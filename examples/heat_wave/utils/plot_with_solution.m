function plot_with_solution(t, x, u, params)
%PLOT_WITH_SOLUTION Summary of this function goes here
%  Note: 'problem' folder should be in path for wave1d_solution function.

max_err = 0;

for i = 1:numel(t)
  solution = wave1d_solution(t(i), x, params);
  plot(x, solution, 'k-', 'LineWidth', 2);
  hold on;
  plot(x, u(i,:), 'k-o');
  
  max_err = max(max_err, norm(solution - u(i,:)));
  title(sprintf('Let(t): %d, max L2 error: %5.2e', numel(t), max_err));
  
  pause(0.01);
  hold off;
end;

end
