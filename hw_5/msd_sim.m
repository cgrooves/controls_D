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
msd_controller = MSDController(P);
z = dynamics.output();

% Graphics loop
while isgraphics(mass)
    % get input values
    z_ref = get(z_slider,'Value');
    f = msd_controller.u(z_ref,z);
    
    % propagate dynamics
    dynamics.propagateDynamics(f);
    
    z = dynamics.output(); % update output
    animation.draw(z); % update animation
    
    pause(0.05);
    
end