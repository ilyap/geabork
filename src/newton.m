function [u, deltas, num_iterations] = newton(f, u0, dfdu, ...
                                              max_iterations, ...
                                              enable_truncations)
%NEWTON Modified Newton's method for solving systems of nonlinear algebraic
% equations.

if nargin < 5
  enable_truncations = true;

  if nargin < 4
    max_iterations = 0;
    
    if nargin < 3
      dfdu = @(x) jacobian(f,x);
    
      if nargin < 2
        error('Not enough arguments.');
      end
    end
  end
end

num_iterations = 1;
deltas = zeros(1,max_iterations);
max_truncations = 10;

F = f(u0);

while (true)
   D = dfdu(u0);
   du = D\(-F);
   
   if (enable_truncations)
      [u, du, F] = truncate_newton_step(f, u0, du, F, max_truncations);
   else
      u = u0 + du;
      F = f(u);
   end
   
   d = norm(du);
   deltas(num_iterations) = d;

   if (d <= 1e-10 || (max_iterations>0 && num_iterations == max_iterations))
      break;
   end
   
   u0 = u;
   num_iterations = num_iterations + 1;
end

deltas = deltas(1:num_iterations);
end


function [u, du, feval_f_u] = truncate_newton_step(f, u0, du0, feval_f_u0, ...
                                                   max_truncations)
% Truncated Newton iterations: |rhs| shall decrease.

norm1 = norm(feval_f_u0);

n_truncations = 0;
tau = 1;
while (n_truncations < max_truncations)
   du = tau*du0;
   u = u0 + du;
   feval_f_u = f(u);

   norm2 = norm(feval_f_u);
   if (norm(du) <= 1e-10 || norm2 < norm1)
      return;
   end;
   
   n_truncations = n_truncations + 1;
   tau = tau / 2;
end

warning('Newton:TooManyTruncations', 'Too many truncations.');
end
