function y = protero_solution(x)
%PROTERO_SOLUTION Solution of Protero-Robertson stiff ODE problem.
lambda = -1;
y = cos(x) - exp(lambda*x);