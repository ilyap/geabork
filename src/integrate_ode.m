function [t, u] = integrate_ode(tspan, n_nodes, f, u0, solver, G)
% INTEGRATE_ODE Numerically integrate G*du/dt=f(t,u) ode problem on a 
% single grid.
% Params:
%   tspan: interval of ingegration.
%   n_nodes: number of grid nodes.
%   f: function handler of the ODE right-hand side.
%   u0: initial data.
%   solver: function handler to ODE solver which should have the following
%       signature: "solver(f, t, u, tau, G)".
%   G: mass matrix; can be singular.
% Returns:
%   t: grid by argument t.
%   u: numerical solution of the ODE problem.

if nargin < 6
  G = eye(numel(u0));
  is_da_problem = false;
else
  is_da_problem = any(any(G ~= eye(numel(u0))));
end

tau = diff(tspan)/(n_nodes-1);

u = zeros(numel(u0), n_nodes);
u(:,1) = u0;

for i = 2:n_nodes
  if is_da_problem
    u(:,i) = solver(f, tspan(1) + (i-2)*tau, u(:,i-1), tau, G);
  else
    u(:,i) = solver(f, tspan(1) + (i-2)*tau, u(:,i-1), tau);
  end
end

t = tspan(1):tau:tspan(2);

end
