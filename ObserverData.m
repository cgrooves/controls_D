classdef ObserverData < handle
    
    properties
        x
        x_hat
        n
        Ts
        t
        
        x_handles
        x_hat_handles
    end % properties
    
    methods
        %----------------------------------
        function self = ObserverData(states,Ts)
            
            self.t = 0;
            self.x = zeros(states,1);
            self.x_hat = zeros(states,1);
            self.n = states;
            self.Ts = Ts;
            
            self.x_handles = 0;
            self.x_hat_handles = 0;
            
            % create subplots
            figure(5), clf
            
            for i = 1:states
                
                subplot(states,1,i);
                hold on
                self.x_handles(i) = plot(self.x_handles(i),0,0);
                xlabel('Time (s)');
                self.x_hat_handles(i) = plot(self.x_hat_handles(i),0,0);
                xlabel('Time (s)');
                
            end
        end
        %----------------------------------
        function update(self,x,x_hat)
            
            if size(self.t) == [0 0]
                self.t = cat(2,self.t,self.Ts);
            else
                self.t = cat(2,self.t,self.t(end)+self.Ts);
            end
            
            % update each state and estimated state
            self.x = cat(2,self.x,x);
            self.x_hat = cat(2,self.x_hat,x_hat);
            
            % update plots
            for i = 1:self.n
                set(self.x_handles(i),'Xdata',self.t,'Ydata',self.x(:,i));
                set(self.x_hat_handles(i),'Xdata',self.t,'Ydata',self.x_hat(:,i));
            end
            
        end
        %----------------------------------
        
    end
    
end