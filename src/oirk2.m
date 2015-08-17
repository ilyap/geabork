function [u, deltas] = oirk2(f, t0, u0, tau, G)
%OIRK2 OIRK2 method for stiff ODE and DA problems.
%   Optimal inverse Runge-Kutta (OIRK) implicit method. It is L2-stable,
%   2nd order of accuracy on differential or differential-algebraic 
%   autonomous problems with constant mass matrix G.

if nargin < 5
   G = eye(length(u0));
end

A = [1/4, 3/4; -5/12, 3/4];
b = [1/4; 3/4];
c = [1; 1/3];

[u, deltas] = firk(A, b, c, G, f, t0, u0, tau);