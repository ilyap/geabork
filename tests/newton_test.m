function newton_test
% Tests for newton.
addpath('../');
test_print('newton_test: ');

test_one_dim_linear; test_print('.');
test_two_dim; test_print('.');
test_two_dim_explicit_jacobian; test_print('.');

end

function f = f_one_dim_linear(x)
f = 2*x + 1;
end


function test_one_dim_linear
f = @f_one_dim_linear;
u0 = 100;

u = newton(f, u0);

assert(-0.5 == u)
end


function f = f_two_dim(x)
f(1,1) = 2*x(1) + 1;
f(2,1) = x(2)^2 + x(1) + 0.5;
end

function j = j_two_dim(x)
j = [2, 0; 1, 2*x(2)];
end

function test_two_dim
f = @f_two_dim;
u0 = [5;5];
answer = [-0.5;0];

u = newton(f, u0);

assert(norm(u-answer) < 1e-8);
end


function test_two_dim_explicit_jacobian
f = @f_two_dim;
j = @j_two_dim;
u0 = [5;5];
answer = [-0.5;0];

u = newton(f, u0, j);

assert(norm(u-answer) < 1e-8);
end
