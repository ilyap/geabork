function bmp_test
% Tests for bmp ode solver.
test_print('bmp_test: ');

ode_solver_diff_tests(@bmp, 2);

end
