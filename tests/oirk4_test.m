function oirk4_test
% Tests for oirk4 ode solver.
addpath('../');
test_print('oirk4_test: ');

ode_solver_diff_tests(@oirk4, 4, 2e-1);
ode_solver_da_tests(@oirk4, 4);

end