function solveodel_test
% Tests for solveodet integrator.
test_print('solveodel_test: ');

print_time(@test_vdp1_default); test_print('.');
print_time(@test_vdp1_cros4a); test_print('.');
print_time(@test_vdp1_bmp); test_print('.');
print_time(@test_vdp1_erk4); test_print('.');

end


function test_vdp1_default
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
% atol=1e-6 takes (~5s).
atol = 1e-6;
h0 = 0.5;
p = 4;
[~, ~, conv] = solveodel(f, tspan, u0, atol, h0);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end


function test_vdp1_cros4a
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
atol = 1e-6;
h0 = 1;
solver = @cros4a; p = 4;
[~, ~, conv] = solveodel(f, tspan, u0, atol, h0, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end


function test_vdp1_bmp
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
% atol=1e-6 takes significantly more time (>1m).
atol = 1e-3;
h0 = 1;
solver = @bmp; p = 2;
[~, ~, conv] = solveodel(f, tspan, u0, atol, h0, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end


function test_vdp1_erk4
f = @vdpol1; u0 = [2; 0]; tspan = [0,7];
atol = 1e-6;
h0 = 1;
solver = @erk4; p = 4;
[~, ~, conv] = solveodel(f, tspan, u0, atol, h0, solver, p);

inclin = get_average_inclination(conv(2,:));
assert(numel(conv(2,:)) > 1, 'Only 1 error: %5.2e', conv(2,1));
assert((inclin > p) | (abs(inclin - p) < 0.1), 'Av inclin = %f', inclin);
end
