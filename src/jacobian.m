function D = jacobian(f, u)
% Numerical calculation of Jacoby matrix. Symmetric difference rule is used
% for each derivative caltulation.

D = jacobian_sd(f, u);

end
