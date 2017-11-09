classdef MSD_FSFControl < handle
    
    properties
        kr
        K
        
        beta
        Ts
        limit
        
        ydot_d1
        y_d1
    end
    
    methods
        %----------------------------------
        function self = MSD_FSFControl(P)
            self.kr = P.kr; % feedforward gain
            self.K = P.K; % gains
            
            self.beta = (2*P.tau - P.Ts)/(2*P.tau + P.Ts); % dirty derivative gain
            self.Ts = P.Ts;
            self.limit = P.sat_limit;
            
            self.y_d1 = 0;
            self.ydot_d1 = 0;
        end
        %----------------------------------
        function u = input(self,r,y)
            
            x = zeros(2,1);
            x(1) = y;
            x(2) = self.beta*self.ydot_d1 + 1/self.Ts*(1-self.beta)*(y - self.y_d1);
            
            u = self.saturate(self.kr*r - self.K*x); % calculated input 
            
            
            % set old values to current ones
            self.y_d1 = x(1);
            self.ydot_d1 = x(2);
            
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