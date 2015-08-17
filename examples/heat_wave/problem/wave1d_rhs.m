function rhs = wave1d_rhs(t, u, h, N, params)
%WAVE1D_RHS Nonlinear right-hand side for heat wave problem.
%   The model is fully non-linear, so the right hand side doesn't depend
%   on the solution from previous layer.
%
%   The function implicitly depends on the following functions:
%      - wave1d_border1
%      - wave1d_border2
%      - wave1d_kappa
%      - kappa_semi_int
%  Returns:
%    Vector of right-hand side calculated in internal nodes (size=N-2).

rhs = zeros(N-2, 1);

% This is u_0.
u_left = wave1d_border1(t, params);
% This is u_{N-1}, because node indexes are {0, 1, ..., N-1}.
u_right = wave1d_border2(t);

rhs(1) = kappa_semi_int(u(1), u(2), @wave1d_kappa, params) * (u(2)-u(1)) - ...
         kappa_semi_int(u_left, u(1), @wave1d_kappa, params) * (u(1)-u_left);
rhs(N-2) = kappa_semi_int(u(N-2), u_right, @wave1d_kappa, params) * (u_right-u(N-2)) - ...
           kappa_semi_int(u(N-3), u(N-2), @wave1d_kappa, params) * (u(N-2)-u(N-3));
         
for i=2:N-3
  rhs(i) = kappa_semi_int(u(i), u(i+1), @wave1d_kappa, params) * (u(i+1)-u(i)) - ...
           kappa_semi_int(u(i-1), u(i), @wave1d_kappa, params) * (u(i)-u(i-1));
end

rhs = rhs/h/h;

end
