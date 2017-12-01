classdef Observer < handles
    % returns Observer gains based on desired poles
    
    properties
        A
        B
        Cm
        O
        
    end
    
    methods
        %---------------------------------------
        function self = Observer(A,B,Cm)
            
            % set state matrices
            self.A = A;
            self.B = B;
            self.Cm = Cm;
            
            self.O = self.observability();
            
        end
        %---------------------------------------
        function O = observability(self)
            
            n = size(self.Cm,1);
            O = zeros(n);
            
            for i = 0:n-1
                O(i+1,:) = self.Cm*self.A^i;
            end
            
            if det(O) == 0
                fprintf('System is not observable');
            else
                fprintf('System is observable');
            end
            
        end
        %---------------------------------------
        
    end
    
end