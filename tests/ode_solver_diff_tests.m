function ode_solver_diff_tests(solver, p_diff, tau0, ...
	enable_non_autonomous_problems)
% Set of standard ODE test problems.
if nargin < 4
	enable_non_autonomous_problems = true;
    if nargin < 3
      tau0 = 1e-1;
    end
end

addpath('../problems');
addpath('../');

test_dahlquist1_with_exact_solution(solver, tau0/10); test_print('.');
test_dahlquist_grid_series(solver, p_diff, tau0); test_print('.');
test_vdpol1_grid_series(solver, p_diff, tau0); test_print('.');

% Even ODE solvers for autonomized problem should give a theoretical order of
% approximation.
test_protero_with_exact_solution(solver, tau0/10, false, true); test_print('.');
test_protero_grid_series(solver, p_diff, tau0, false, true); test_print('.');

if enable_non_autonomous_problems
    test_protero_with_exact_solution(solver, tau0/10); test_print('.');
    test_protero_grid_series(solver, p_diff, tau0); test_print('.');
end

end
