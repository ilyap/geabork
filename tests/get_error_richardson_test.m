function get_error_richardson_test
% Tests for get_error_richardson.
addpath('../');
test_print('get_error_richardson_test: ');

% print_time(test_simple_check); test_print('.');

end

% TODO: check that calculated error is comparable with real error in norm
% C.

% function test_simple_check
% u1 = [  1,   2,   3; ...
%       0.1, 0.2, 0.3];
% 
% u2 = [  1,  1.5,   21,  2.5,    3; ...
%       0.1, 0.15, 0.21, 0.25, 0.31];
% 
% p = 3;
% 
% div = 2^p-1;
% 
% expected = [...
%   norm([19; norm([0.01, 0.01])]) / 3 / div;
%   norm([19/21; norm([0.01, 0.01])]) / 3 / div];
% 
% [actual(1,1), actual(2,1)] = get_error_richardson(u1, u2, p);
% 
% assert(all(abs(expected - actual) < eps));
% end
