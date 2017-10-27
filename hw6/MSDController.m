classdef MSDController
   
    properties
       zCtrl
       k
       limit
       
        
    end
    
    methods
       %---------------------
       function self = MSDController(P)
           self.zCtrl = PDControl(P.kp, P.kd, P.Ts, P.sat_limit);
           self.limit = P.sat_limit;
           self.k = P.k;
       end
       %---------------------
       function force = u(self, y_r, y)
           init_force = self.zCtrl.PD(y_r,y);
           
           if init_force > self.limit(2)
               force = self.limit(2);
           elseif init_force < self.limit(1)
               force = self.limit(1);
           else
               force = init_force;
           end
           
       end
       %---------------------
        
    end
    
end