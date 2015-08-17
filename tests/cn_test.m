function cn_test
% Tests for cn ode solver.
test_print('cn_test: ');

ode_solver_diff_tests(@cn, 2);

end
