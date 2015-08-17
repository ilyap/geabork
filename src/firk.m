function [u, deltas] = firk(A, b, c, G, f, t0, u0, tau)
%FIRK Generic implicit Runge-Kutta method for stiff ODE and DA problems.
%   Fully implicit Runge-Kutta (FIRK) method with arbitrary coefficients
%   in Butcher's form: A, b and c.

s = length(b); % Number of stages.
M = length(u0); % Dimension of the problem.

% Merge s copies of vector u0 to a single vector U0.
U0 = repmat(u0, [s,1]);

solver_equation = @(x) parametrized_solver_equation(A, c, U0, x, t0, ...
    tau, G, f);

% Solve S*M-dimensional nonlinear problem to advance to a next step.
[Y, deltas] = newton(solver_equation, U0);
                                      
UU = reshape(Y, M, s);
v1 = 1 - sum(b'/A);
v2 = (b'/A*UU')';

u = v1*u0 + v2;
end


function F = parametrized_solver_equation(A, c, U0, U, t0, tau, G, f)
[s,~] = size(A); % Number of stages.
M = length(U)/s; % Dimension of the origin problem.

FY = zeros(M*s, 1);
for i = 1:s
   FY(M*(i-1)+1:M*i) = f(t0 + tau*c(i), U(M*(i-1)+1:M*i));
end

AFY = zeros(s*M, 1);
GG = zeros(s*M);
for i = 1:s
   i1 = (i-1)*M+1:i*M;
   for j = 1:s
      i2 = (j-1)*M+1:j*M;
      AFY(i1) = AFY(i1) + A(i,j) * FY(i2);
   end
   
   GG(i1,i1) = G;
end

F = GG*(U - U0) - tau*AFY;

end
