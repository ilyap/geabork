function [u, deltas] = bmp(f, t0, u0, tau)
% BMP BMP method for stiff ODE problems. 
%   Backward midpoint method is implicit, L2-stable, 2-nd order of
%   accuracy.

solver_equation = @(x) parametrized_solver_equation(t0, u0, x, tau, f);
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(t0, u0, u, tau, f)
% Returns the non-linear equation which represents a numerical approximation
% of cauchy problem according to a particular solver.  
u_tild = u - tau/2 * f(t0 + tau, u);
F = u - u0 - tau*f(t0 + tau/2, u_tild);
end
