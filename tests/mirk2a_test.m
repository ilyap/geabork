function mirk2a_test
% Tests for mirk2a ode solver.
test_print('mirk2a_test: ');

% Disable non-autonomous problems.
ode_solver_diff_tests(@mirk2a, 2, 1e-1, false);

end
