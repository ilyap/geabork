function [u, deltas] = bork2(f, t0, u0, tau)
%BORK2 BORK2 method for stiff ODE problems.
%   Backward optimal Runge-Kutta method. It is implicit, L2-stable,
%   2-nd order of accuracy.

solver_equation = @(x) parametrized_solver_equation(f, t0, u0, tau, x);
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(f, t0, u0, tau, u)
% Returns the non-linear equation which represents a numerical approximation
% of cauchy problem according to a particular solver.
A = [0; 2/3];
B = [1/4; 3/4];

f1 = f(t0+tau,u);
f2 = f(t0+tau*(1-A(2)),u-tau*A(2)*f1);
F = u - u0 - tau*(B(1)*f1 + B(2)*f2);
end
