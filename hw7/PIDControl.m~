classdef PIDControl < handle
   
    properties
        kP
        kD
        kI
        limit
        beta
        Ts
        
        y_d1
        error_d1
        uI_d1
        uD_d1
    end
    
    methods
       
        % Constructor-------------------
        function self = PIDControl(gains, tau, Ts, limit)
           self.kP = gains.kP;
           self.kD = gains.kD;
           self.kI = gains.kI;
           
           self.beta = (2*tau - Ts)/(2*tau + Ts);
           self.Ts = Ts;
           self.limit = limit; % saturation limits
           
           self.y_d1 = 0.0;
           self.error_d1 = 0.0;
           self.uI_d1 = 0.0;
           self.uD_d1 = 0.0;
       
        end
        %---------------------------------
        function u = PID(self, y_r, y, u_eq)
           % calculate error
           error = y_r - y;
            
            % calculate uP, uD, uI
            uP = error;
            uD = self.beta * self.uD_d1 + (1 - self.beta)/self.Ts*(y-self.y_d1);
            uI = self.uI_d1 + self.Ts/2*(error + self.error_d1);
            
            % calculate u_unsat
            u_unsat = self.kP*uP - self.kD*uD + self.kI*uI + u_eq;
            % saturate
            u = self.saturate(u_unsat);
            
            % Calculate integrator ant-windup
            self.uI_d1 = (u - u_unsat) / self.kI + uI;
            
            % Update [n-1] values
            self.y_d1 = y;
            self.error_d1 = error;
            self.uD_d1 = uD;
            
        end
        %------------------------------
        function u_sat = saturate(self,u)
            
            if u < self.limit(1)
                u_sat = self.limit(1);
            elseif u > self.limit(2)
                u_sat = self.limit(2);
            else
                u_sat = u;
            end
        end
        %------------------------------
        
    end           
    
end