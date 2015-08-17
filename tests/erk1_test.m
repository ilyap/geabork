function erk1_test
% Tests for erk1_test ode solver.
addpath('../');
test_print('erk1_test: ');

ode_solver_diff_tests(@erk1, 1, 2e-3);

end