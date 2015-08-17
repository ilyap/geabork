clear;   clc;

addpath('../../libode');

f = @implifier_auto;
[G, u0] = implifier_auto_initials;
[dim,~] = size(G);

solver = @cros4;
tau = 0.00005;
T = 0.2;

tic;
u = zeros(dim, T/tau+1); u(:,1) = u0;
t = 0:tau:T;
u(9,:) = 0:tau:T;
for i = 1:length(t)-1
   u(:,i+1) = solver(f, u(:,i), tau, G);
   disp(int2str(i));
end
disp('done');
toc

u_input = @(t) (0.1*sin(200*pi*t));

close;
plot(t, u_input(t), 'k-', 'LineWidth', 2); hold on;
plot(t, u(8,:), 'k-');

text(0.005, 0.4, '\it{U_e(t)}');
text(0.12, 1.35, '\it{U_8(t)}');

xlabel('\it{t}');
ylabel('\it{U(t)}');
set(findall(gca,'type','text'),'fontSize',12)
set(findall(gca,'type','text'),'fontName','Times New Roman')

u_final = u(1:8,end);

u_exact = implifier_end_solution; 
err = norm(u_final - u_exact);
disp(num2str(err));
