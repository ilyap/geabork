function [tout, uout, conv] = solveodel(f, tspan, u0, atol, h0, solver, ...
                                        p, max_grids)
% Arbitrary ODE problem (du/dt = f(t,u)) solver.
% Problem is integrated on a set of nested uniform grids using solution arc
% length as integration parameter. Aposteriori error estimation in L2 norm 
% is calculated using Richardson's method.
%
% Integration span and number of steps is not known in advance. Initial
% step size h0 shall be chosen carefully.

if nargin < 8
  max_grids = 10;
  if nargin < 6
    solver = @bork4;
    p = 4;
    if nargin < 5
      h0 = 1e-1;
      if nargin < 4
        atol = 1e-6;   
      end
    end
  end
end

MAX_STEPS = 1e6;

f_auto = autonomize_problem_arc(f);
u0_auto = [u0; tspan(1)];
conv = zeros(2, max_grids);

hl = h0;

for i = 1:max_grids
  if (i == 1)
    u1 = integrate(f_auto, tspan(2), u0_auto, hl, solver, MAX_STEPS);
  else
    u1 = u2;
  end
  
  hl = hl/2;

  u2 = integrate(f_auto, tspan(2), u0_auto, hl, solver, MAX_STEPS);

  
  [aerr, ~] = get_error_richardson(u1, u2, p);
  [~,n_nodes] = size(u2);
  conv(:,i) = [n_nodes; aerr];

  if (aerr < atol)
  	break;
  end
end

conv = conv(:,1:i);
tout = u2(end,:);
uout = u2(1:end-1,:);
end


function [u, T_reached] = integrate(f_auto, T, u0, hl, solver, max_steps)
% Integrate autonomized ODE problem dudt=f(u) with a provided solver until
% value of time is less than T.
  
% Approximate preallocation.
u = zeros(numel(u0), floor(T/hl));
u(:,1) = u0;

i = 1;
while ((u(end,i) < T) && (i < max_steps))
  u(:,i+1) = solver(f_auto, 0, u(:,i), hl);
  i = i+1;
end

% Truncate a tail of preallocated solution.
u = u(:,1:i);
T_reached = (u(end,i) >= T);
end
