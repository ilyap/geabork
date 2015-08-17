function oirk3_test
% Tests for oirk3 ode solver.
addpath('../');
test_print('oirk3_test: ');

ode_solver_diff_tests(@oirk3, 3, 5e-1);
ode_solver_da_tests(@oirk3, 3);

end