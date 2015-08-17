function bork3_test
% Tests for bork3 ode solver.
test_print('bork3_test: ');

ode_solver_diff_tests(@bork3, 3);

end
