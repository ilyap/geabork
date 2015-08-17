function k = wave1d_kappa(u, params)
% WAVE1D_KAPPA Heat conduction coefficient for 1d heat wave problem.

k = params.K*u.^params.M;

end