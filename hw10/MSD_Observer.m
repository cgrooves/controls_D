classdef MSD_Observer < handle
    
        properties
        A
        B
        Cm
            
        K
        ki
        L
        
        beta
        Ts
        limit
        
        xhat
        u_d1
        ui
        
        error_d1
        
    end
    
    methods
        %----------------------------------
        function self = MSD_Observer(P)
            self.K = P.K1; % gains
            self.ki = P.ki1;
            
            self.A = P.A;
            self.B = P.B;
            self.Cm = P.Cr;
            self.L = P.L;
            
            self.Ts = P.Ts;
            self.limit = P.sat_limit;
            
            self.xhat = [0; 0];
            self.u_d1 = 0;
            self.ui = 0;
            
            self.error_d1 = 0;

        end
        %----------------------------------
        function u = input(self,r,y)            
             % get input
            z_ref = r;
            z = y;
            
            % update observer
            self.updateObserver(z);
            z_hat = self.xhat(1);
            
            % implement integrator
            error = z_ref - z_hat;
            self.integrateError(error);
            
            % compute u
            u_tilde = -self.K*self.xhat - self.ki*self.ui + 2.25;
            u = self.saturate(u_tilde); % calculated input 
            
            % integrator anti-windup
            if self.ki ~= 0
                self.ui = self.ui + (u-u_tilde)/self.ki;
            end
            
            self.updateU(u);
                       
        end
        %----------------------------------   
        function self = updateObserver(self,y_m)
            N = 10;
            
            % Approximate observer differential equation
            for i = 1:N
                self.xhat = self.xhat + self.Ts/N*(self.A*self.xhat + ...
                    self.B*self.u_d1 + self.L*(y_m-self.Cm*self.xhat));
            end
        end
        %----------------------------------
        function self = updateU(self,u)
            self.u_d1 = u;
        end
        %----------------------------------
        function self = integrateError(self,error)
            self.ui = self.ui + (self.Ts/2)*(error+self.error_d1);
            self.error_d1 = error;
        end
        %----------------------------------
        function u = saturate(self,uin)
            
            if uin < self.limit(1)
                u = self.limit(1);
            elseif uin > self.limit(2)
                u = self.limit(2);
            else
                u = uin;
            end
            
        end
        %---------------------------------
    end  
end