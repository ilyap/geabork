function dydt = vdpol1_auto(u)
% Autonomous interface of Van Der Pol problem (no parameter "t"). Sigma = 1.
w = 1;
sig = 1;
x = u(1);
v = u(2);

dydt = [v; -w^2*x - sig * (x.^2 - 1) * v];