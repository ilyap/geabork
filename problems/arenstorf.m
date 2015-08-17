function dudt = arenstorf(t, u)
% ARENSTORF Orbital (Arenstorf) non-stiff problem for ODE solvers.
m  = 0.012277471;
m1 = 1 - m;

y1 = u(1);
t1 = u(2);
y2 = u(3);
t2 = u(4);

D1 = ((y1+m)^2  + y2^2)^(3/2);
D2 = ((y1-m1)^2 + y2^2)^(3/2);

dudt = [t1;...
  y1 + 2*t2 - m1*(y1+m)/D1 - m*(y1-m1)/D2; ...
  t2; ...
  y2 - 2*t1 - m1*y2/D1 - m*y2/D2];
