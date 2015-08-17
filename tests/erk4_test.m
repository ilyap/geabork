function erk4_test
% Tests for erk4_test ode solver.
addpath('../');
test_print('erk4_test: ');

ode_solver_diff_tests(@erk4, 4);

end