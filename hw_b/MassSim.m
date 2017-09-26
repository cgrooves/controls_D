% Clear everything
clear; close; clc;

% add parent path
addpath ./..
MassParams

% Create dynamics object
dynamics = MassDynamics(P);

% Create GUI object
mass = MassGUI;
% get handles to GUI
handles = guidata(mass);
ax = handles.axes1;
f_slider = handles.force_slider;

% set slider values
set(f_slider,'Min',P.f_min,'Max',P.f_max,'Value',P.f_init);

% Create animation object
animation = MassAnimation(P,ax);

% Graphics loop
while isgraphics(mass)
    % get input values
    f = get(f_slider,'Value');
    % propagate dynamics
    dynamics.propagateDynamics(f);
    
    y = dynamics.output(); % get output
    animation.draw(y); % update animation
    
    pause(0.05);
    
end