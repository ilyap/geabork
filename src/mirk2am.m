function [u] = mirk2am(f, t0, u0, tau)
%MIRK2 Mono-implicit RK ODE solver for autonomous problems. 
%   L1 stable, 2nd order of approximation.

[u] = modified_newton(t0, u0, tau, f);
end


function u2 = rhs(t0, u0, u1, tau, f)
v = 1-1/sqrt(2);
w1 = 1-2*v;
a32 = (1/3-w1)/(w1-1/2);
w3 = (w1-1/2)^2/(1/3-w1);
w2 = 1-w1-w3;

k1 = f(t0, u0);
k2 = f(t0, u1);
k3 = f(t0, u1+tau*a32*k2);

u2 = u0 + tau*(w1*k1 + w2*k2 + w3*k3);
end


function u = modified_newton(t0, u0, tau, f)
v = 1-1/sqrt(2);

u1 = u0;
fa = @(x) f(t0,x);

while (true)
  lhs = (eye(numel(u0))-v*tau*jacobian(fa, u1));

  d = (rhs(t0, u0, u1, tau, f) - u1)\lhs\lhs;
  u2 = u1 + d;
  
  if norm(d) < 1e-10
    break;
  end
  
  u1 = u2;  
end

u = u2;

end