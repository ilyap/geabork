function u = wave1d_border1(t, params)
%WAVE1D_BORDER1 Left border condition for 1-dimensional heat wave problem.
%   Detailed explanation goes here

u = (params.M * params.C^2 / params.K * t) .^ (1/params.M);

end

