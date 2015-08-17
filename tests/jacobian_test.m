function jacobian_test
% Tests for jacobian.
addpath('../')

test_print('jacobian_test: ');

simpleTest; test_print('.');

end

function simpleTest
eps = 1e-10;

D = jacobian(@fTest, [1;1]);
expected = [1, 1; 0, 2];

diff = abs(D - expected);

assert(all(all(diff < eps)), 'Max diff: %5.2e', max(max(diff)));
end

function f = fTest(u)
f(1,1) = u(1) + u(2);
f(2,1) = 2*u(2);
end