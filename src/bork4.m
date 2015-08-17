function [u, deltas] = bork4(f, t0, u0, tau)
%BORK4 BORK4 method for stiff ODE problems.
%   Backward optimal Runge-Kutta method. It is implicit, L4-stable,
%   4-th order of accuracy.

solver_equation = @(x) parametrized_solver_equation(f, t0, u0, tau, x);
[u, deltas] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(f, t0, u0, tau, u)
% Returns the non-linear equation which represents a numerical approximation
% of cauchy problem according to a particular solver.
A = [0; 1/2; 1/2; 1];
B = [1/6; 2/6; 2/6; 1/6];

f1 = f(t0+tau,u);
f2 = f(t0+tau*(1-A(2)),u-tau*A(2)*f1);
f3 = f(t0+tau*(1-A(3)),u-tau*A(3)*f2);
f4 = f(t0+tau*(1-A(4)),u-tau*A(4)*f3);

F = u - u0 - tau*(B(1)*f1 + B(2)*f2 + B(3)*f3 + B(4)*f4);
end
