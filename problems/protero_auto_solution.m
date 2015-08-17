function y = protero_auto_solution(x)
%PROTERO_AUTO_SOLUTION Solution of Protero-Robertson autonomized non-stiff
%   ODE problem.
lambda = -1;
y = [cos(x) - exp(lambda*x); x];