function [u, deltas] = bork3(f, t0, u0, tau)
%BORK3 BORK3 method for stiff ODE problems.
%   Backward optimal Runge-Kutta method. It is implicit, L3-stable,
%   3-nd order of accuracy.

solver_equation = @(x) parametrized_solver_equation(f, t0, u0, tau, x);
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(f, t0, u0, tau, u)
% Returns the non-linear equation which represents a numerical approximation
% of cauchy problem according to a particular solver.
A = [0; 1/2; 3/4];
B = [2/9; 3/9; 4/9];

f1 = f(t0+tau,u);
f2 = f(t0+tau*(1-A(2)),u-tau*A(2)*f1);
f3 = f(t0+tau*(1-A(3)),u-tau*A(3)*f2);
F = u - u0 - tau*(B(1)*f1 + B(2)*f2 + B(3)*f3);
end
