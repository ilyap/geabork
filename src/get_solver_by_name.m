function [solver, p] = get_solver_by_name(solver_name, G)
% Returns solver and its order of approximation depending on mass matrix G.
if nargin < 2
  is_da_problem = false;
else 
  [dim,~] = size(G);
  if G == eye(dim)
    is_da_problem = false;
  else
    is_da_problem = true;
  end
end

if strcmpi(solver_name, 'cros')
  solver = @cros;
  p = 2;
elseif strcmpi(solver_name, 'cros4a')
  solver = @cros4a;
  if is_da_problem
    p = 3;
  else
    p = 4;
  end
elseif strcmpi(solver_name, 'erk1')
  if is_da_problem
    error('ODE solver %s can not be used for DA problems.', solver_name);
  end
  solver = @erk1;
  p = 1;
elseif strcmpi(solver_name, 'erk2')
  if is_da_problem
    error('ODE solver %s can not be used for DA problems.', solver_name);
  end
  solver = @erk2;
  p = 2;
elseif strcmpi(solver_name, 'erk3')
  if is_da_problem
    error('ODE solver %s can not be used for DA problems.', solver_name);
  end
  solver = @erk3;
  p = 3;
elseif strcmpi(solver_name, 'erk4')
  if is_da_problem
    error('ODE solver %s can not be used for DA problems.', solver_name);
  end
  solver = @erk4;
  p = 4;
elseif strcmpi(solver_name, 'oirk1')
  solver = @oirk1;
  p = 1;
elseif strcmpi(solver_name, 'oirk2')
  solver = @oirk2;
  p = 2;
elseif strcmpi(solver_name, 'oirk3')
  solver = @oirk3;
  p = 3;
elseif strcmpi(solver_name, 'oirk4')
  solver = @oirk4;
  p = 4;
elseif strcmpi(solver_name, 'bmp')
  solver = @bmp;
  p = 2;
elseif strcmpi(solver_name, 'cn')
  solver = @cn;
  p = 2;
else
  error('ODE solver name %s is uknown.', solver_name);
end
  
end