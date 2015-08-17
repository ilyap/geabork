function test_dahlquist1_with_exact_solution(solver, tau, plot_solution)
% Test that solution given by solver on dahlquist1 problem t\in[0,1]
% is close to exact solution.
if nargin < 3
  plot_solution = false;

  if nargin < 2
  	tau = 1e-2;
  end
end

T = 1;
u0 = 1;

u = zeros(1, T/tau + 1);
u(1) = u0;

i = 2;
for t = tau:tau:T
  u(i) = solver(@dahlquist1, t-tau, u(i-1), tau);
  i = i+1;
end

x = 0:tau:T;
sln = dahlquist1sln(x);

if (plot_solution)
  plot(x, sln, 'k-', 'LineWidth', 2);
  hold on;
  % Plot 20 points of solution.
  dx = floor(numel(x) / 20);
  idx = 1 : dx : numel(x);
  plot(x(idx), u(idx), 'k-o');
  title(sprintf('Max dif: %f', max(abs(u - sln))));
  pause;
  close;
end

max_error = max(abs(u-sln));
assert(all(abs(u - sln) < 1e-3), 'max_error=%5.2e', max_error);

end