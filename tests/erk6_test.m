function erk6_test
% Tests for erk6 ode solver.
addpath('../');
test_print('erk6_test: ');

ode_solver_diff_tests(@erk6, 6, 1e-1);

end