function [M, u0] = implifier_initials
% IMPLIFIER_INITIALS Initial data and mass matrix for implifier problem.

R1 = 9000;
R2 = 9000;
R5 = 9000;
R6 = 9000;
C1 = 1e-6;
C2 = 2e-6;
C3 = 3e-6;
C4 = 4e-6;
C5 = 5e-6;
Ub = 6;

u0(1) = 0;
u0(2) = Ub/(R2/R1 + 1);
u0(3) = Ub/(R2/R1 + 1);
u0(4) = Ub;
u0(5) = Ub/(R6/R5 + 1);
u0(6) = Ub/(R6/R5 + 1);
u0(7) = Ub;
u0(8) = 0;

M = [-C1, C1, 0, 0, 0, 0, 0, 0; ...
     C1, -C1, 0, 0, 0, 0, 0, 0; ...
     0, 0, -C2, 0, 0, 0, 0, 0; ...
     0, 0, 0, -C3, C3, 0, 0, 0; ...
     0, 0, 0, C3, -C3, 0, 0, 0; ...
     0, 0, 0, 0, 0, -C4, 0, 0; ...
     0, 0, 0, 0, 0, 0, -C5, C5; ...
     0, 0, 0, 0, 0, 0, C5, -C5];