function [u, deltas] = oirk4(f, t0, u0, tau, M)
%OIRK4 OIRK4 method for stiff ODE and DA problems.
%   Optimal inverse Runge-Kutta (OIRK) implicit method. It is L4-stable,
%   4th order of accuracy on differential or differential-algebraic 
%   autonomous problems with constant mass matrix G.

if nargin < 5
   M = eye(length(u0));
end

A = [ 1,  2,  2,  1; 
     -2,  2,  2,  1;
      1, -1,  2,  1;
      1,  2, -4,  1] / 6;
b = [1; 2; 2; 1] / 6;
c = [1, 1/2, 1/2, 0];

[u, deltas] = firk(A, b, c, M, f, t0, u0, tau);