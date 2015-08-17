function test_protero_with_exact_solution(solver, tau, plot_solution, ...
    autonomize_problem)
% Test that solution given by solver on protero problem t\in[0,1]
% is close to exact solution.
if nargin < 4
  autonomize_problem = false;
  if nargin < 3
    plot_solution = false;

    if nargin < 2
    	tau = 1e-2;
    end
  end
end

T = 1;

x = 0:tau:T;

if autonomize_problem
  problem = @protero_auto;
  solution = @protero_auto_solution;
  u0 = [0;0];
else
  problem = @protero;
  solution = @protero_solution;
  u0 = 0;
end

u = zeros(numel(u0), T/tau + 1);
u(:,1) = u0;

for i = 2:numel(x)
  u(:,i) = solver(problem, x(i-1), u(:,i-1), tau);
end

sln = solution(x);

if (plot_solution)
  plot(x, sln, 'k-', 'LineWidth', 2);
  hold on;
  % Plot 20 points of solution.
  dx = floor(numel(x) / 20);
  idx = 1 : dx : numel(x);
  plot(x(idx), u(1,idx), 'k-o');
  title(sprintf('Max dif: %f', max(abs(u - sln))));
  pause;
  close;
end

abs_diff = abs(u-sln);

max_error = max(abs_diff(1,:));
assert(all(abs_diff(1,:) < 1e-3), 'max_error=%5.2e', max_error);

end