function dydt = vdpol100_auto(u)
% Van Der Pol problem, sigma = 100.
sigma = 100;
dydt = [u(2); -u(1) - sigma * (u(1).^2 - 1) * u(2)];