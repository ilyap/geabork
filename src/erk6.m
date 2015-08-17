function [u] = erk6(f, t0, u0, h)
%ERK6 ERK6 method for non-stiff ODE problems.
%   Explicit Runge-Kutta 7 stages 6th order method also known as Hammud's 
%   method (some coefficients are specified by Alshina etc).It is not
%   A-stable.
%   Method coefficients in the form of Butcher matrix are provided below.

A = [0, 0, 0, 0, 0, 0, 0; ...
  4/7, 0, 0, 0, 0, 0, 0; ...
  115/112, -5/16, 0, 0, 0, 0, 0; ...
  589/630, 5/18, -16/45, 0, 0, 0, 0; ...
  229/1200-29/6000*sqrt(5), 119/240-187/1200*sqrt(5), ...
    -14/75+34/375*sqrt(5), -3/100*sqrt(5), 0, 0, 0; ...
    71/2400-587/12000*sqrt(5), 187/480-391/2400*sqrt(5), ...
    -38/75+26/375*sqrt(5), 27/80-3/400*sqrt(5), (1+sqrt(5))/4, 0, 0; ...
  -49/480+43/160*sqrt(5), -425/96+51/32*sqrt(5), ...
    52/15-4/5*sqrt(5), -27/16+3/16*sqrt(5), 5/4-3/4*sqrt(5), ...
    5/2-1/2*sqrt(5), 0];

B = [1, 0, 0, 0, 5, 5, 1] / 12;
C = [0; 4/7; 5/7; 6/7; (5-sqrt(5))/10; (5+sqrt(5))/10; 1];

DIM = length(u0);
k = zeros(DIM,7);

for i = 1:7
  du = zeros(DIM,1);
  for j = 1:i-1
    du = du + k(:,j)*A(i,j);
  end
  k(:,i) = f(t0 + h*C(i), u0 + h*du);
end

u = u0 + h*(B*k')';

end
