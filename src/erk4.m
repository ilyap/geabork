function [u] = erk4(f, t0, u0, h)
%ERK4 ERK4 method for non-stiff ODE problems. 
%   Explicit Runge-Kutta 4th order method. It is not A-stable.
%   Method coefficients in the form of Butcher matrix are the following:
%   A = [0, 0, 0, 0;
%        1/2, 0, 0, 0;
%        0, 1/2, 0, 0;
%        0, 0, 1, 0];
%   B = [1, 2, 2, 1] / 6;
%   C = [0; 1/2; 1/2; 1];

k1 = f(t0, u0);
k2 = f(t0 + h/2, u0+h*k1/2);
k3 = f(t0 + h/2, u0+h*k2/2);
k4 = f(t0 + h, u0+h*k3);
    
u = u0 + h/6*(k1 + 2*k2 + 2*k3 + k4);

end
