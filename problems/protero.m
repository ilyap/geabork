function dudt = protero(t,u)
%PROTERO Protero-Robertson non-autonomous stiff ODE problem.
%   phi(x) is cos(x). Initial value is 0. Exact solution is
%   y(x) = cos(x) - exp(lambda*x).
lambda = -1;
dudt = lambda*(u-cos(t)) - sin(t);
end