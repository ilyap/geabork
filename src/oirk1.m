function [u, deltas] = oirk1(f, t0, u0, tau, G)
%OIRK1 OIRK1 method for stiff ODE and DA problems.
%   Implicit Euler's method also known as optimal inverse Runge-Kutta
%   (OIRK) implicit method. It is L1-stable, 1st order of accuracy on 
%   differential or differential-algebraic problems with constant mass
%   matrix G.

if nargin < 5
  G = eye(length(u0));
end

solver_equation = @(x) parametrized_solver_equation(t0, u0, x, tau, G, f);
%solver_equation = @(u) (M*(u-u0) - tau*f(t0+tau, u));
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(t0, u0, u, tau, G, f)
% Returns the non-linear equation which represents a numerical approximation
% of cauchy problem according to a particular solver.  
F = G*(u-u0) - tau*f(t0+tau, u);
end
