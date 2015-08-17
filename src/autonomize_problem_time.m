function f_u = autonomize_problem_time(f)
% Transforms ODE problem f(t,u) to autonomous problem f(U), U=[u;t]. 

f_u = @(t,U) ([f(U(end), U(1:end-1)); 1]);

end