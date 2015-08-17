function [u] = erk2(f, t0, u0, h)
%ERK2 ERK2 method for non-stiff ODE problems.
%   Explicit Runge-Kutta 2nd order method. It is not A-stable.
p1 = f(t0, u0);
p2 = f(t0+2/3*h, u0+2*h*p1/3);
    
u = u0 + h/4*(p1 + 3*p2);
end
