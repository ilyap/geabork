function oirk2_test
% Tests for oirk2 ode solver.
addpath('../');
test_print('oirk2_test: ');

ode_solver_diff_tests(@oirk2, 2, 2e-1);
ode_solver_da_tests(@oirk2, 2);

end