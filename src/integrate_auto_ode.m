function u = integrate_auto_ode(tspan, n_nodes, f, u0, solver, G)
% Numerically integrate G*du/dt=f(t,u) ode problem on a single grid.
% Mass matrix G can be singular. u0 is initial contition; t is taken from 
% [tspan(1); tspan(2)]. n_nodes is a number of grid nodes.
tau = diff(tspan)/n_nodes;
is_da_problem = any(any(G ~= eye(numel(u0))));

u = zeros(numel(u0), n_nodes+1);
u(:,1) = u0;
t = tspan(1);
tau = diff(tspan);

% Allow usage of non-stiff ODE solvers.
if is_da_problem
  for i = 2:n_nodes+1
    t = t + tau;
    u(:,i) = solver(f, t, u(:,i-1), tau, G);
  end
else
  for i = 2:n_nodes+1
    t = t + tau;
    u(:,i) = solver(f, t, u(:,i-1), tau);
  end
end

end
