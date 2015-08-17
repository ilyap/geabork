function autonomize_problem_arc_test
%AUTONOMIZE_PROBLEM_ARC_TEST Tests for autonomize_problem_arc.
addpath('../');
addpath('../problems');
test_print('autonomize_problem_arc_test: ');

test_solver_with_arc_length_sum_shall_be_equal_to_hl(@erk1);
test_print('.');

test_solver_with_arc_length_sum_shall_be_equal_to_hl(@oirk1);
test_print('.');

end


function test_solver_with_arc_length_sum_shall_be_equal_to_hl(solver)
% Checks that dl = sqrt(sum(dyl.^2)) for rk1 and eulerImp solvers.
f = @dahlquist1;
g = autonomize_problem_arc(f);

y0 = 1;

T2 = 1;
yl(:,1) = [y0; 0];
dimL = length(y0)+1;
hl = 0.1;

i = 1;
while yl(dimL,i) < T2
  % 0 here is just a stub for "t", which is not used after autonomization.
  yl(:,i+1) = solver(g, 0, yl(:,i), hl);
  i=i+1;
  
  dl = sqrt(sum((yl(:,i)-yl(:,i-1)).^2));
   
  % dl shall be ~ hl: within 1% range.
  assert((dl-hl)/hl <= 0.01, 'hl=%5.2e, dl=%5.2e', hl, dl);
end

end
