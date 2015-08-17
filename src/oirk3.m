function [u, deltas] = oirk3(f, t0, u0, tau, M)
%OIRK3 OIRK3 method for stiff ODE and DA problems.
%   Optimal inverse Runge-Kutta (OIRK) implicit method. It is L3-stable,
%   3rd order of accuracy on differential or differential-algebraic 
%   autonomous problems with constant mass matrix G.

if nargin < 5
   M = eye(length(u0));
end

A = [ 2/9,   3/9,   4/9; 
     -5/18,  3/9,   4/9;
      2/9, -15/36,  4/9];
b = [2; 3; 4] / 9;
c = [1; 1/2; 1/4];

[u, deltas] = firk(A, b, c, M, f, t0, u0, tau);