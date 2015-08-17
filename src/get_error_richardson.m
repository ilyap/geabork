function [aerr, rerr] = get_error_richardson(u1, u2, p, r)
%GET_ERROR_RICHARDSON Richardson method for solution error estimation. 
%   Richardson method for solution error estimatio of the numerical result 
%   calculated on two nested grids. "u2" must be thinner than "u1".
%   "p" is the approximation order of the used solver, "r" is number of 
%   times grid "u2" is expected to be thinner than "u1":
%   "u1" is a matrix (dim,N), "u2" is (dim,r*N).

if nargin < 4
  r = 2;
end

% Number of nodes in two grids may be slightly different due to rounding
% errors. But as soon as u1 and u2 are expected to be two consequetive
% grids, i.e. h(u1) = r*h(u2), then we can truncate tail from one of these
% grids.
[~, n10] = size(u1);
[~, n20] = size(u2);

if r*n10-1 < n20
  % Too many nodes in 2nd grid.
  n1 = n10;
  n2 = r*n10-1;
elseif r*n10-1 > n20
  % Too many nodes in 1st grid.
  n1 = floor((n20+1)/r);
  n2 = r*n1-1;
else
  n1 = n10;
  n2 = n20;  
end

assert(n1 <= n10);
assert(n2 <= n20);

dif = u1(:, 1:n1) - u2(:, 1:r:n2);

% Norm of average squared error summed for all nodes of grids.
aerr = norm(sqrt(sum(dif.^2, 2) / n1)) / (r^p-1);

% Relative error is also average squared error.
norm_divider = u2(:, 1:r:n2);
% Take absolute error as relative if divider is very small.
norm_divider(abs(norm_divider) < 1e-14) = 1;

rerr = norm(sqrt(sum(dif.^2 ./ norm_divider.^2, 2)) / n1 / (r^p-1));
