function dydt = diff_alg_sincos(t,u)
% Simple differential-algebraic problem. If initial value is u(0)=[0;-1], then
% solution is [sin(t); -cos(t)]. So the end of integration interval 
% shall be < pi/2.
% If initial value is u(0)=[1,0], then solution is constant [1;0].

% f(1,1) = -u(2);   f(2,1) = u(1)^2+u(2)^2-1;
dydt(1,1) = -u(2);
dydt(2,1) = u(1)^2+u(2)^2-1;
end