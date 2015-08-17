function erk2_test
% Tests for erk2_test ode solver.
addpath('../');
test_print('erk2_test: ');

ode_solver_diff_tests(@erk2, 2, 4e-2);

end