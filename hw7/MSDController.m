classdef MSDController
   
    properties
       zCtrl
       gains
    end
    
    methods
       %---------------------
       function self = MSDController(P)
           self.gains.kP = P.kP;
           self.gains.kD = P.kD;
           self.gains.kI = P.kI;
           self.zCtrl = PIDControl(self.gains,P.tau,P.Ts,P.sat_limit);
       end
       %---------------------
       function force = u(self, y_r, y)
           % call PID on the controller
           force = self.zCtrl.PID(y_r,y,0);
       end
       %---------------------
        
    end
    
end