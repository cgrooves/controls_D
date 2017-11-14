% Mass Parameters
P.m = 5; % kg, mass
P.k = 3; % N/m, spring constant
P.b = 0.5; % N sec/m, damping

P.var = 0.2; % uncertainty parameter, varies m, k, b
P.tau = 0.05; % dirty derivative gain

% Simulation parameters
P.Ts = 0.05; % Time-step

P.Length = 3;
P.width = 0.5;

P.z0 = 0;
P.zdot0 = 0;

P.f_init = 0;
P.f_min = 0;
P.f_max = 30;

P.z_min = 0;
P.z_max = 1;
P.z_init = 1;

% Animation parameters
P.t_start = 0;

% Controller parameters
P.tr = 2.2;
P.wn = 2.2/P.tr;
P.zeta = 0.7;
P.sat_limit = [-3,3];

%P.kD = 22*P.zeta/P.tr - P.b;
%P.kP = 5*(2.2/P.tr)^2 - P.k;
P.kI = 1.2;
P.kP = 2;
P.kD = 6.0;

% Full-state feedback stuff
% Open-loop states
P.A = [0, 1; 
    -P.k/P.m, -P.b/P.m];
P.B = [0; 1/P.m];
P.Cr = [1 0];
P.D = [0 0];

P.C = [P.B, P.A*P.B]; % controllability matrix

if det(P.C) == 0
    fprintf ("System is not controllable\n");
else
    fprintf("System is controllable\n");
end

P.p = roots([1, 2*P.zeta*P.wn, P.wn^2]); % desired poles

P.K = place(P.A, P.B, P.p); % Closed-loop gains
P.kr = -1/(P.Cr(1,:)*((P.A - P.B*P.K)\P.B)); % feedforward gains

%% Full-state feedback w/integrator
P.p1 = cat(1,P.p,-1); % set additional pole for system
[P.K1, P.ki1] = FSF_integrator(P.A,P.B,P.Cr,P.p1); % get gains




