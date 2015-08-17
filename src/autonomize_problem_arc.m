function F_from_U = autonomize_problem_arc(f)
% Transforms ODE problem f(t,u), u \in R^M to F(U), U \in R^{M+1}. 

%    fval = f(u0(1:length(u0)-1));
% 
%    div = sqrt(1 + sum(fval.^2));
%    f_l = [fval ./ div; 1/div];

F_from_U = @(t,U) ([f(U(end), U(1:end-1)); 1]./sqrt(1 + sum(f(U(end), U(1:end-1)).^2)));

end