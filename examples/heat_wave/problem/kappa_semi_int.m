function k = kappa_semi_int(u1, u2, kappa, params)
% KAPPA_SEMI_INT Formula for calculation of kappa in semi-integer node.
%  Approximation of heat conduction coefficient kappa in the middle of
%  [u1,u2] interval.
%  Args:
%    u1: left value of temperature u.
%    u2: right value of temperature u.
%    kappa: function handler kappa = kappa(u).
k = 1/2*(kappa(u1, params)+kappa(u2, params));
end