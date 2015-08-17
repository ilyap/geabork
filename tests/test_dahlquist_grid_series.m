function test_dahlquist_grid_series(solver, p, tau0, plot_results)
% Solve dahlquist1 problem on a set of nested grids and check efficient
% accuracy of a solver. 
if nargin < 4
  plot_results = false;
  if nargin < 3
    tau0 = 1e-1;
  end
end

T = 1;
f = @dahlquist1; u0 = 1;
n_grids = 3;

avg_inclin = plot_grid_series_calculations(f, u0, solver, p, tau0, T, ... 
	n_grids, plot_results);

% Allow difference between theoretical an effective order to be 10% of p
% (because of not thin enough grid).
dp = 0.1*p;
assert((avg_inclin > p) | (abs(avg_inclin - p) < dp), ...
  'p=%5.2f, p_eff=%4.2f', p, avg_inclin);
end