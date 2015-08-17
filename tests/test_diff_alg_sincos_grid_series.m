function test_diff_alg_sincos_grid_series(solver, p, n_nodes0, plot_results)
% p is expected order of accuracy on differential-algebraic problems for the
% solver.

if nargin < 4
  plot_results = false;
  if nargin < 3
    n_nodes0 = 11;
  end
end

n_nodes = n_nodes0;
tspan = [0,1];
f = @diff_alg_sincos; u0 = [0; -1]; G = [1,0;0,0];
f_solution = @diff_alg_sincos_solution;
n_grids = 5;

for i = 1:n_grids
  if (i == 1)
    [~, u1] = integrate_ode(tspan, n_nodes, f, u0, solver, G);
  else
    u1 = u2;
  end
  
  % Double number of intervals in a grid.
  n_nodes = n_nodes*2 - 1;

  [~, u2] = integrate_ode(tspan, n_nodes, f, u0, solver, G);
  
  [aerr(i), ~] = get_error_richardson(u1, u2, p);
end

avg_inclin = get_average_inclination(aerr);

if (plot_results)
  tau0 = diff(tspan)/n_nodes0;
  t_solution = tspan(1) : tau0 : tspan(2);
  u_solution = f_solution(t_solution);

  tau = diff(tspan)/n_nodes; 
  t = tspan(1):tau:tspan(2);
  for i = 1 : numel(u0)
    plot(t_solution, u_solution(i,:), 'ko'); hold on;
    plot(t, u2(i,:), 'k-', 'LineWidth', 2);
    title(sprintf('Average inclinations=%f', avg_inclin));
    pause;
    close;
  end

  x = n_nodes0*2.^(1:n_grids);
  loglog(x, aerr, 'k-o');
  title(sprintf('Average inclinations=%f', avg_inclin));
  pause;
  close;
end

% Allow difference between theoretical an effective order to be 10% of p
% (because of not thin enough grid).
dp = 0.1*p;
assert((avg_inclin > p) | (abs(avg_inclin - p) < dp), ...
  'p=%5.2f, p_eff=%4.2f', p, avg_inclin);

end
