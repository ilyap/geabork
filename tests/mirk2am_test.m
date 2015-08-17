function mirk2am_test
% Tests for mirk2am ode solver.
test_print('mirk2am_test: ');

% Disable non-autonomous problems.
ode_solver_diff_tests(@mirk2am, 2, 1e-1, false);

end
