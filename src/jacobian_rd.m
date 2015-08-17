function D = jacobian_rd(f, u)
% Numerical calculation of Jacoby matrix. Right difference rule is used
% for each derivative caltulation.

hu = 1e-8;
dim = length(u);
D = zeros(dim);

FTU = f(u);

for i = 1 : dim
    ut1 = u;
    ut1(i) = ut1(i) + hu;
    D(:,i) = (f(ut1) - FTU)/hu;
end

end