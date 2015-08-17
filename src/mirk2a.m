function [u] = mirk2a(f, t0, u0, tau)
%MIRK2A MIRK2A method for stiff autonomous ODE problems.
%   Mono-implicit Runge-Kutta (MIRK) implicit method. It is L1-stable, 
%   2nd order of accuracy on differential problems.

solver_equation = @(x) parametrized_solver_equation(t0, u0, x, tau, f);
[u] = newton(solver_equation, u0);
end


function F = parametrized_solver_equation(t0, u0, u, tau, f)
v = 1-1/sqrt(2);
w1 = 1-2*v;
a32 = (1/3-w1)/(w1-1/2);
w3 = (w1-1/2)^2/(1/3-w1);
w2 = 1-w1-w3;

k1 = f(t0, u0);
k2 = f(t0, u);
k3 = f(t0, u+tau*a32*k2);

F = u - u0 - tau*(w1*k1 + w2*k2 + w3*k3);
end