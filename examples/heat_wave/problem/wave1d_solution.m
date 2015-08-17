function [u] = wave1d_solution(t, x, params)
%WAVE1D_SOLUTION Solution of 1-dimensional heat wave problem.
% Args:
%   t: instant of time.
%   x: space point.
%   params: a structure with constant parameters of a problem: C, K, M.

u = zeros(1,length(x));

for i=1:length(x)
   if (params.C*t-x(i) < 0)
      break;
   end;
   
   u(i) = (params.C*params.M/params.K * (params.C*t-x(i)))^(1/params.M);
end;

end

