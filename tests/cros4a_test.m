function cros4a_test
% Tests for cros4a.
addpath('../');
test_print('cros4a_test: ');

tau0 = 1e-1;

% CROS4A solver is developed for autonomous problems. 
% Although any problem can be autonomized, so that order of
% accuracy was improved to 4 or 3 (for DA problems).

ode_solver_diff_tests(@cros4a, 4, tau0, ...
	false); % enable_non_autonomous_problems
ode_solver_da_tests(@cros4a, 3);

% Applied to non-autonomous problems CROS4A gives only 1st order of accuracy.
% So integration step shall be decreased significantly.
test_protero_with_exact_solution(@cros4a, tau0/80); test_print('.');
test_protero_grid_series(@cros4a, 1, tau0); test_print('.');

end
