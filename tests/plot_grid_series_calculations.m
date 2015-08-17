function [ avg_inclination ] = plot_grid_series_calculations(...
  f, u0, solver, p, tau0, T, n_grids, plot_results)
%PLOT_GRID_SERIES_CALCULATIONS Summary of this function goes here
%   Detailed explanation goes here
tau = tau0;
%DIM = length(u0);
u1 = repmat(u0, 1, T/tau+1);

% Preallocate memory for relative errors.
a = ones(1, n_grids);

for i = 1:n_grids
  if (i == 1)
    j = 2;
    for t = tau:tau:T
      u1(:,j) = solver(f, t-tau, u1(:,j-1), tau);
      j = j + 1;
    end
  else
    u1 = u2;
  end
  
  tau = tau/2;

  u2 = repmat(u0, 1, T/tau+1);
  j = 2;
  for t = tau:tau:T
    u2(:,j) = solver(f, t-tau, u2(:,j-1), tau);
    j = j + 1;
  end
  
  [a(i),~] = get_error_richardson(u1, u2, p);
end

x = T/tau0*2.^(1:n_grids);
avg_inclination = get_average_inclination(a);

if (plot_results)
  t = 0:tau:T;
  for i = 1 : numel(u0)
    plot(t, u2(i,:), 'k-', 'LineWidth', 2);
    title(sprintf('Average inclination=%f', avg_inclination));
    pause;
    close;
  end
  loglog(x, a, 'k-o');
  title(sprintf('Average inclination=%f', avg_inclination));
  pause;
  close;
end

end
