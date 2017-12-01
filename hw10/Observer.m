classdef Observer < handle
    % returns Observer gains based on desired poles
    
    properties
        A
        B
        Cm
        Obs
        
    end
    
    methods
        %---------------------------------------
        function self = Observer(A,B,Cm)
            
            % set state matrices
            self.A = A;
            self.B = B;
            self.Cm = Cm;
            
            self.Obs = self.observability();
            
        end
        %---------------------------------------
        function O = observability(self)
            
            n = size(self.Cm,2);
            O = zeros(n);
            
            for i = 0:n-1
                O(i+1,:) = self.Cm*(self.A^i);
            end
            
            if det(O) == 0
                fprintf('System is not observable\n');
            else
                fprintf('System is observable\n');
            end
            
        end
        %---------------------------------------
        
    end
    
end