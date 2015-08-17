function solveodet_test
% Tests for solveodet integrator.
addpath('../');
addpath('../problems');

test_print('solveodet_test: ');

print_time(@test_vdp1_default); test_print('.');
print_time(@test_vdp1_cros4); test_print('.');
print_time(@test_vdp1_bmp); test_print('.');
print_time(@test_vdp1_erk4); test_print('.');

end


function test_vdp1_default
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
G = eye(numel(u0));
atol = 1e-6;
n_nodes = 40;

% BORK4 solver is used for integration by default.
p = 4;
[~, ~, conv] = solveodet(f, tspan, u0, G, atol, n_nodes);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end


function test_vdp1_cros4
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
G = eye(numel(u0));
atol = 1e-6;
n_nodes = 10;
solver = @cros4a; p = 4;
[~, ~, conv] = solveodet(f, tspan, u0, G, atol, n_nodes, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end


function test_vdp1_bmp
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
G = eye(numel(u0));
atol = 1e-3;
n_nodes = 50;
solver = @bmp; p = 2;
[~, ~, conv] = solveodet(f, tspan, u0, G, atol, n_nodes, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), ...
    'Average inclination = %f', inclin);
end


function test_vdp1_erk4
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
G = eye(numel(u0));
atol = 1e-6;
n_nodes = 50;
solver = @erk4; p = 4;
[~, ~, conv] = solveodet(f, tspan, u0, G, atol, n_nodes, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), ...
    'Average inclination = %f', inclin);
end
