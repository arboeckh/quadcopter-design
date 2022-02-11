% %load physical params
load("physical_parameters.mat");
%generate hoverSS from simscape model
gen_hoverSS;
A = hoverSS.a;
B = hoverSS.b;
C = hoverSS.c;
D = hoverSS.d;
m = physical_params.motor_mass * 4 + physical_params.arm_mass * 4 + physical_params.box_mass;  %total mass


Q = [50 0 0 0 0 0 0 0 0 0 0 0;
     0 50 0 0 0 0 0 0 0 0 0 0;
     0 0 20 0 0 0 0 0 0 0 0 0;
     0 0 0 1 0 0 0 0 0 0 0 0;
     0 0 0 0 1 0 0 0 0 0 0 0;
     0 0 0 0 0 1 0 0 0 0 0 0;
     0 0 0 0 0 0 1 0 0 0 0 0;
     0 0 0 0 0 0 0 1 0 0 0 0;
     0 0 0 0 0 0 0 0 1 0 0 0;
     0 0 0 0 0 0 0 0 0 1 0 0;
     0 0 0 0 0 0 0 0 0 0 1 0;
     0 0 0 0 0 0 0 0 0 0 0 1];
R = [0.1 0 0 0;
      0 0.1 0 0;
      0 0 0.1 0;
      0 0 0 0.1];
K = lqr(A,B, Q,R);
  
%set the setpoint values
shape = size(A);
n = shape(1);
setpoint = zeros(n,1);
%init state space
state_init = setpoint;

%set x to 1m
setpoint(1) = 1;
setpoint(2) = 1;
setpoint(3) = -1;


%gravity compensation value
gravity_comp = (9.81 * m)/4;


%run the model
out = sim("lqr_hover.slx", 5);
% plot(out);
 