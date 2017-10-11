% Mass Parameters
P.m = 5; % kg, mass
P.k = 3; % N/m, spring constant
P.b = 0.5; % N sec/m, damping

% Simulation parameters
P.Ts = 0.1; % Time-step

P.Length = 15;
P.width = 4;

P.z0 = 0;
P.zdot0 = 0;

P.f_init = 0;
P.f_min = 0;
P.f_max = 30;

P.z_min = 0;
P.z_max = 15;
P.z_init = 0;

% Animation parameters

% Controller parameters
P.kd = 12;
P.kp = 4.5;