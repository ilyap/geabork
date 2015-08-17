function [total_time] = print_time(test, return_only)
% Executes function test(), measures its execution time and returns the 
% result and prints it into debug stream.

if nargin < 2
  return_only = false;
end

tic_start = tic;
test();
total_time = (double(tic()) - double(tic_start))*1e-6;

if ~return_only
  test_print('[Time: %5.2fs]', total_time);
end
end