function run_tests(tests_list)
% Execute provided test scripts and decorate their output.
% Args:
%   tests_list: 
N = numel(tests_list);
total_times = zeros(1, N);
for i = 1 : N
  total_times(i) = run_single_test(tests_list{i});
end

test_print('=====\n  Total time: %5.2fs\n', sum(total_times));

end


function [total_time] = run_single_test(test)
% Decorate test fixture execution with total time measurement.
total_time = print_time(test, true);
test_print(' [OK]  Total time: %5.2fs\n', total_time);
end