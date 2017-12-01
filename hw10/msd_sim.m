% close out everything
clear; close; clc;

% add parent directory
addpath ./..
MassParams

% Create dynamics object
dynamics = MassDynamics(P);

% Create GUI object
mass = msd_gui;

% get handles to GUI
handles = guidata(mass);
ax = handles.axes1;
z_slider = handles.z_ref_slider;

% set slider values
set(z_slider,'Min',P.z_min,'Max',P.z_max,'Value',P.z_init);

% Create animation object
animation = MassAnimation(P,ax);

% Create controller
msd_controller = MSD_Observer(P);
z = dynamics.output();

% Create I/O graph window
plt = DynamicPlotData(P,'Force(N)','Z Position(m)');
%obs = ObserverData(2,P.Ts);

% Graphics loop
while isgraphics(mass)
    
    % get input values
    z_ref = get(z_slider,'Value');
    f = msd_controller.input(z_ref,z);
    
    % propagate dynamics
    dynamics.propagateDynamics(f);
    
    z = dynamics.output(); % get current dynamics output
    animation.draw(z); % update animation
    
    plt.update(f,z);
    %obs.update(dynamics.state,MSD_Observer.xhat);
    
    pause(P.Ts);
    
end