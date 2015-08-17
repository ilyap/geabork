function dudt = implifier(t, u)
%IMPLIFIER Test problem for differential-algebraic problem solvers.
%   Detailed explanation goes here
R0 = 1000;
R1 = 9000;
R2 = 9000;
R3 = 9000;
R4 = 9000;
R5 = 9000;
R6 = 9000;
R7 = 9000;
R8 = 9000;
R9 = 9000;
Ub = 6;
a = 0.99;

dudt(1,1) = -Ue(t)/R0 + u(1)/R0;
dudt(2,1) = -Ub/R2 + u(2)*(1/R1+1/R2)-(a-1)*g(u(2)-u(3));
dudt(3,1) = -g(u(2)-u(3)) + u(3)/R3;
dudt(4,1) = -Ub/R4 + u(4)/R4 + a*g(u(2)-u(3));
dudt(5,1) = -Ub/R6 + u(5)*(1/R5+1/R6) - (a-1)*g(u(5)-u(6));
dudt(6,1) = -g(u(5)-u(6)) + u(6)/R7;
dudt(7,1) = -Ub/R8 + u(7)/R8 + a*g(u(5)-u(6));
dudt(8,1) = u(8)/R9;

end


function ue = Ue(t)
ue = 0.1*sin(200*pi*t);
end


function g = g(u)
b = 1e-6;
UF = 0.026;
g = b*(exp(u/UF)-1);
end