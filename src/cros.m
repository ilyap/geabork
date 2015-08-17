function u = cros(f, t0, u0, tau, G, dfdu)
%CROS CROS method for stiff ODE and DA problems.
%   CROS is semi-implicit one stage Rosenbrock method with complex 
%   coefficients. It is L2-stable, 2nd order of accuracy on differential 
%   or differential-algebraic autonomous problems with constant mass 
%   matrix G.

if nargin < 6
  dfdu = @jacobian;

  if nargin < 5
    G = eye(length(u0));
  end
end

g = @(x) (f(t0, x));

a = (1+1i)/2;

D = (G - a*tau*dfdu(g, u0));
F = f(t0+tau/2,u0);
k = D\F;

u = u0 + tau*real(k);

end
