function bork2_test
% Tests for bork2 ode solver.
test_print('bork2_test: ');

ode_solver_diff_tests(@bork2, 2);

end
