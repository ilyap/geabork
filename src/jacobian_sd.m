function D = jacobian_sd(f, u)
% Numerical calculation of Jacoby matrix. Symmetric difference rule is used
% for each derivative caltulation.

hu = 5e-5;
dim = length(u);
D = zeros(dim);

for i = 1 : dim
    ut1 = u;
    ut2 = u;
    ut1(i) = ut1(i) + hu;
    ut2(i) = ut2(i) - hu;
    D(:,i) = (f(ut1) - f(ut2))/2/hu;
end

end
