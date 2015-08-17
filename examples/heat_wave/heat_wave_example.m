function [t,u] = heat_wave_example(matlab_solver, print_solution)
% 1-D heat wave problem solved by MATLAB or geabork stiff ODE solvers.
if nargin < 2
  print_solution = true;
  
  if nargin < 1
    matlab_solver = true;
  end
end

addpath('../../src');
addpath('problem');
addpath('utils');

t0 = 0;
t1 = 0.5;

x0 = 0;
x1 = 2.5;

% Number of nodes and size of integration step.
N = 21;
h = (x1-x0)/(N-1);

% Initial data.
u0 = zeros(N-2, 1);

params = wave1d_default_params;

f = @(t,u) wave1d_rhs(t, u, h, N, params);

tic;

% t represents full grid by time.
% u_ represents solution in internal nodes of space grid.

if matlab_solver
  [t, u_] = ode23s(f, [t0, t1], u0);
else
  M = 51;
  [t, u_] = integrate_ode([t0, t1], M, f, u0, @bmp);
end

toc

u = [wave1d_border1(t, params), u_, wave1d_border2(t)];

if print_solution
  plot_with_solution(t, x0:h:x1, u, params);
end

end
