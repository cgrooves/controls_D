classdef MassDynamics < handle
    
    properties
        state
        m
        k
        b
        Ts
        var
        
    end
    
    methods
        % Constructor ----------------
        function self = MassDynamics(P)
            
            % Initialize state vector
            self.state = [...
                P.z0;...
                P.zdot0;...
                ];
            
            % Initialize uncertainty parameter
            self.var = P.var;
            
            % initialize other sim params
            % add up to 20% uncertainty to each parameter
            self.m = P.m*((2*self.var)*rand + (1-self.var));
            self.k = P.k*((2*self.var)*rand + (1-self.var));
            self.b = P.b*((2*self.var)*rand + (1-self.var));
            
            self.Ts = P.Ts;
        end
        %------------------------------
        function self = propagateDynamics(self,u)
            %
            % Integrate the differential equations defining dynamics by
            % using Runga-Kutta 4th order methods.
            % u is the system input (F)
            
            k1 = self.derivatives(self.state, u);
            k2 = self.derivatives(self.state + self.Ts/2*k1, u);
            k3 = self.derivatives(self.state + self.Ts/2*k2, u);
            k4 = self.derivatives(self.state + self.Ts*k3, u);
            self.state = self.state + self.Ts/6 * (k1 + 2*k2 + 2*k3 + k4);
        end
        % ---------------------------------------------------------------
        function xdot = derivatives(self, state, u)
           %
           % Return xdot = f(x,u) the derivatives of the continuous states
           % as a matrix
           f = u;
           
           % Equations of motion!!!
           xdot = zeros(2,1);
           
           xdot(1) = state(2);
           xdot(2) = 1/self.m*(f - self.b*self.state(2) - self.k*self.state(1));
           
        end
        % -----------------------------------------------------------------
        function y = output(self)
            % Return the system variables as a column vector
            y = self.state(1);
            
        end
        %---------------------------------------
            
    end
    
end