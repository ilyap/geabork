function cros_test
% Tests for cros.
addpath('../');
test_print('cros_test: ');

ode_solver_diff_tests(@cros, 2, 4e-2);
ode_solver_da_tests(@cros, 2);

end
