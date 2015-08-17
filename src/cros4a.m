function u = cros4a(f, t0, u0, tau, G, dfdu)
%CROS4A CROS4A method for autonomous stiff ODE and DA problems.
%   CROS4A is semi-implicit two stage Rosenbrock method with complex 
%   coefficients. It is L2-stable, 4th order of accuracy for autonomous 
%   differential problems, 3rd order of accuracy for differential-algebraic
%   problems with const mass matrix G.

if nargin < 6
  dfdu = @jacobian;

  if nargin < 5
    G = eye(length(u0));
  end
end

% f(t,x) is an autonomous problem, so let's use an alias 'g(x)' for it.
g = @(x) (f(t0,x));

alpha1 = 0.1 + (sqrt(11)/30)*1i;
alpha2 = 0.2 + 0.1i;

b1 = 0.1941430241155180 - 0.2246898944678803i;
b2 = 0.8058569758844820 - 0.8870089521907592i;
c21 = 0.2554708972958462 - 0.2026195833570109i;
a21 = 0.5617645150714754 - 1.148223341045841i;

k1 = (G - alpha1 * tau * dfdu(g, u0)) \ (tau*g(u0));
k2 = (G - alpha2 * tau * dfdu(g, u0 + real(a21*k1))) \ ...
    (tau*g(u0 + real(c21*k1)));

u = u0 + real(b1*k1 + b2*k2);
end