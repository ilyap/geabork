function autonomize_performance_test
% Performance tests for different approaches for problem autonomization.
test_print('autonomize_performance_test: ');

print_time(@test_vdpol1); test_print('.');
print_time(@test_vdpol1_autonomize_time); test_print('.');
print_time(@test_vdpol1_autonomize_arc); test_print('.');

end


function test_vdpol1
f = @vdpol1;
u0 = [2; 0];
tspan = [0,7];
run_solveodet_cros4(f, u0, tspan);
end


function test_vdpol1_autonomize_time
f = autonomize_problem_time(@vdpol1);
u0 = [2; 0; 0];
tspan = [0,7];
run_solveodet_cros4(f, u0, tspan);
end


function test_vdpol1_autonomize_arc
% When we perform autonomization via arc len, then for the vdp1 problem
% t(17)=7, which means that we can just integrate on an interval [0,17] in
% order to compare the approach performance. 
f = autonomize_problem_arc(@vdpol1);
u0 = [2; 0; 0];
tspan = [0,17];
run_solveodet_cros4(f, u0, tspan);
end


function run_solveodet_cros4(f_auto, u0, tspan)
G = eye(numel(u0));
atol = 1e-6;
n_nodes = 50;
solver = @cros4a; p = 4;
[~, ~, conv] = solveodet(f_auto, tspan, u0, G, atol, n_nodes, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));

% Allow difference between theoretical an effective order to be 10% of p
% (because of not thin enough grid).
dp = 0.1*p;
assert((inclin > p) | (abs(inclin - p) < dp), ...
  'p=%5.2f, p_eff=%4.2f', p, inclin);
end
