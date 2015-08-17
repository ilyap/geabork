function dydt = vdpol1(t, u)
% Van Der Pol problem, sigma = 1.
sigma = 1;
dydt = [u(2); -u(1) - sigma * (u(1).^2 - 1) * u(2)];