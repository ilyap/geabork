function [u] = erk1(f, t0, u0, tau)
%ERK1 ERK1 method for non-stiff ODE problems.
%   Explicit Runge-Kutta 1st order method. It is not A-stable.
u = u0 + tau * f(t0, u0);
end