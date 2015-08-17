function dudt = protero_auto(t,u)
%PROTERO_AUTO Protero-Robertson autonomized non-stiff ODE problem.
%   phi(x) is cos(x). Initial value is 0. Exact solution is
%   y(x) = cos(x) - exp(lambda*x).
lambda = -1;
dudt = [lambda*(u(1)-cos(u(2))) - sin(u(2)); 1];
end