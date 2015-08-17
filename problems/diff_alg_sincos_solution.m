function u = diff_alg_sincos_solution(t)
% Solution of the following simple differential-algebraic problem G*du/dt=f(u):
% f(1,1) = -u(2);   f(2,1) = u(1)^2+u(2)^2-1.
% If initial value shall be u(0)=[0;-1].

u(1,:) = sin(t);
u(2,:) = -cos(t);

end