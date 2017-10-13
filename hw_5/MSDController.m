classdef MSDController
   
    properties
       zCtrl
       k
       
        
    end
    
    methods
       %---------------------
       function self = MSDController(P)
           self.zCtrl = PDControl(P.kp, P.kd, P.Ts, P.sat_limit);
           self.k = P.k;
       end
       %---------------------
       function force = u(self, y_r, y)
                     
           force = self.zCtrl.PD(y_r,y) + self.k*y;
           
       end
       %---------------------
        
    end
    
end