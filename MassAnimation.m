classdef MassAnimation
    
    properties
        width
        ax
        Length
        
        mass
        spring
        damper
        
    end
    
    methods
        % Constructor ----------------------
        function self = MassAnimation(P,plot_axes)
            % include path to graphics objects
            addpath ~/Documents/MATLAB
            
            % initialize variables
            self.width = P.width;
            self.ax = plot_axes;
            self.Length = P.Length;
            
            % Initialize axes, draw wall
            plot(self.ax,[-0.5*P.Length,P.Length],[0,0],'k',-P.Length/2*[1,1],[0,0.7*P.Length],'k');
            hold(self.ax,'on')
            xlabel(self.ax,'z');
            set(self.ax,'XLim',[-0.7*P.Length,1.1*P.Length],'YLim',...
                [-0.2*P.Length,P.Length],'dataaspectratio',[1 1 1]);
            
            % Initialize and draw everything
            self.mass = Rectangle(P.width,P.width,[P.width/2;P.width/2],self.ax);
            self.spring = plot(self.ax,linspace(-P.Length/2,P.z0,8),...
                P.width*[2/3 1 2/3 1 2/3 1 2/3 1],'r');
            self.damper = plot(self.ax,[-self.Length/2,P.z0],P.width*[1/3, 1/3],'g');
        end
        %---------------------------
        function self = draw(self,z)
            self.mass.translate([z;0]);
            
            set(self.spring,'XData',linspace(-self.Length/2,z,8));
            set(self.damper,'XData',[-self.Length/2,z]);
        end
            
    end
    
end