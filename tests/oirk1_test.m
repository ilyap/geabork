function oirk1_test
% Tests for imp_euler ode solver.
test_print('oirk1_test: ');

ode_solver_diff_tests(@oirk1, 1, 2e-2);
ode_solver_da_tests(@oirk1, 1);

end