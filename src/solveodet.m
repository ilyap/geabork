function [tout, uout, conv] = solveodet(f, tspan, u0, G, atol, n_nodes, ...
                                        solver, p, max_grids)
% Autonomous ODE or DA problem (G*du/dt = f(u)) solver.
% Problem is integrated on a set of nested uniform grids in order to
% calculate aposteriori error estimation in L2 norm using Richardson's
% method.

if nargin < 9
  max_grids = 10;
  if nargin < 7
    solver = @bork4;
    p = 4;
    if nargin < 6
      n_nodes = 1e2;
      if nargin < 5
        atol = 1e-5;   
        if nargin < 4
          G = eye(numel(u0));
        end
      end
    end
  end
end

conv = zeros(2, max_grids);

for i = 1:max_grids
  if (i == 1)
    [~, u1] = integrate_ode(tspan, n_nodes, f, u0, solver, G);
  else
    u1 = u2;
  end
  
  n_nodes = n_nodes*2 - 1;

  [~, u2] = integrate_ode(tspan, n_nodes, f, u0, solver, G);
  
  [aerr, ~] = get_error_richardson(u1, u2, p);

  conv(:,i) = [n_nodes; aerr];

  if (aerr < atol)
  	break;
  end
end

tau = diff(tspan) / n_nodes;
tout = tspan(1):tau:tspan(2);
uout = u2;
conv = conv(:,1:i);

end
