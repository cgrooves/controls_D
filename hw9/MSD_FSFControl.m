classdef MSD_FSFControl < handle
    
    properties
        
        K
        ki
        
        beta
        Ts
        limit
        
        zdot_d1
        z_d1
        
        error_d1
        ui
    end
    
    methods
        %----------------------------------
        function self = MSD_FSFControl(P)
            self.K = P.K1; % gains
            self.ki = P.ki1;
            
            self.beta = (2*P.tau - P.Ts)/(2*P.tau + P.Ts); % dirty derivative gain
            self.Ts = P.Ts;
            self.limit = P.sat_limit;
            self.ui = 0;
            
            self.z_d1 = 0;
            self.zdot_d1 = 0;
            self.error_d1 = 0;
        end
        %----------------------------------
        function u = input(self,r,y)
            % get input
            z_ref = r;
            z = y;
            % reconstruct state
            x = zeros(2,1);
            x(1) = z;
            x(2) = self.beta*self.zdot_d1 + 1/self.Ts*(1-self.beta)*(z - self.z_d1);
            
            % implement integrator
            error = z_ref - z;
            self.ui = self.ui + (self.Ts/2)*(error + self.error_d1);
            
            u_unsat = -self.K*x - self.ki*self.ui + 0.25; % constant input disturbance
            u = self.saturate(u_unsat); % calculated input 
            
            % integrator anti-windup
            if self.ki ~= 0
                self.ui = self.ui + (u-u_unsat)/self.ki;
            end
            
            % set old values to current ones
            self.z_d1 = x(1);
            self.zdot_d1 = x(2);
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