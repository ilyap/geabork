function bork4_test
% Tests for bork4 ode solver.
test_print('bork4_test: ');

ode_solver_diff_tests(@bork4, 4);

end
