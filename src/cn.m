function [u, deltas] = cn(f, t0, u0, tau)
%CN CN method for moderately stiff ODE problems.
%   Crank-Nicolson method is implicit, A-stable, 2-nd order of accuracy.
if nargin < 3
  error('Not enough input arguments.');
end

solver_equation = @(x) parametrized_solver_equation(t0, u0, x, tau, f);
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(t0, u0, u, tau, f)
% Returns the non-linear equation which represents a numerical
% approximation of Cauchy problem according to a particular solver.  
F = u - u0 - tau*(f(t0+tau,u) + f(t0,u0))/2;
end
