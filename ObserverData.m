classdef ObserverData < handle
    
    properties
        x
        x_hat
        n
        Ts
        t
        error
        
        x_handles
        x_hat_handles
        error_handles
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
            
            self.error = zeros(states,1);
            
            % create subplots
            figure(5), clf
            
            for i = 1:states
                
                subplot(states,1,i);
                hold on
                self.x_handles(i) = plot(gca,0,0,'b');
                xlabel('Time (s)');
                self.x_hat_handles(i) = plot(gca,0,0,'g');
                Y = ['State',num2str(i)];
                ylabel(Y);
                
                leg1 = ['X',num2str(i)];
                leg2 = ['X_h_a_t',num2str(i)];
                
                legend(leg1,leg2);
                
                self.error_handles(i) = plot(gca,0,0,'r');
                
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
            err = x - x_hat;
            self.error = cat(2,self.error,err);
            
            % update plots
            for i = 1:self.n
                set(self.x_handles(i),'XData',self.t,'YData',self.x(i,:));
                set(self.x_hat_handles(i),'XData',self.t,'YData',self.x_hat(i,:));
                set(self.error_handles(i),'XData',self.t,'YData',self.error(i,:));
            end
            
        end
        %----------------------------------
        
    end
    
end