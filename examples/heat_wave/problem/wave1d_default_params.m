function params = wave1d_default_params
%WAVE1D_DEFAULT_PARAMS Const params of 1-dimensional heat wave problem.
%  Returns:
%    Structure with members C,K and M, where C represents wave speed, K 
%    is a constant factor and M is a constant exponent in the formula for 
%    heat conduction coefficient: kappa=K*u^M.

params.C = 4;
params.K = 4;
params.M = 5;

end

