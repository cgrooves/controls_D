classdef MSDController
   
    properties
       zCtrl
       
        
    end
    
    methods
       %---------------------
       function self = MSDController(P)
           self.zCtrl = pd_control(P.kp, P.kd, P.Ts);
       end
       %---------------------
       function force = u(self, y_r, y)
                     
           force = self.zCtrl.PD(y_r,y);
           
       end
       %---------------------
        
    end
    
end