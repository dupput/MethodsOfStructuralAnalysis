clear; clc

% define beam properties
L= 4;
q = 10;
EI = 10^5;

% define mesh
n = 10;
dx = L/(n-1);
xn = linspace(0, L, n);

% Exact solution
xe = linspace(0,L,100);
Fe = q*L/2-q*xe;
Me = -q*L*xe/2 + q*xe.^2/2;
re = (1/EI) * (-q*L*xe.^2/4 + q*xe.^3/6 + q*L^3/24);
we = (1/EI) * (-q*L*xe.^3/12 + q*xe.^4/24 + q*L^3*xe/24);

% define finite differences matrices
A = zeros(n+4, n+4);
b = zeros(n+4, 1);
kr = zeros(n, n+4); % Rotations
kM = zeros(n, n+4); % Bending moments
kF = zeros(n, n+4); % Shear Forces

% populate matrices
for ii = 3:n+2
    A(ii-2, ii-2:ii+2) = [1, -4, 6, -4, 1];
    b(ii-2, 1) = q * dx^4 / EI;
    kr(ii-2, ii-1:ii+1) = (-1/(2*dx)) * [1 0 -1];
    kM(ii-2, ii-1:ii+1) = (EI / dx^2) * [1 -2 1];
    kF(ii-2, ii-2:ii+2) = (-EI / (2*dx^3)) * [-1 2 0 -2 1];
end

% define boundary condtions
A(n+1, 3) = 1; b(n+1, 1) = 0;
A(n+2, n +2) = 1; b(n+2, 1) = 0;
A(n+3, 2:4) = [1, -2, 1]; b(n+3, 1) = 0;
A(n+4, n+1:n+3) = [1, -2, 1]; b(n+4, 1) = 0;

% Solve the system
w = A\b;
wn =w(3:n+2, 1);
r = kr * w;
M = kM * w;
F = kF * w;

figure(1)
subplot(4,1,1)
plot(xn,-wn,'-o',xe,-we)
xlabel('x (m)'); ylabel('Deflection w (m)'); legend('Finite Differences','Exact'); grid on
subplot(4,1,2)
plot(xn,r,'-o',xe,re)
xlabel('x (m)'); ylabel('Rotation (rad)'); grid on
subplot(4,1,3)
plot(xn,M,'-o',xe,Me)
xlabel('x (m)'); ylabel('Bending Moment M (kNm)'); grid on
subplot(4,1,4)
plot(xn,F,'-o',xe,Fe)
xlabel('x (m)'); ylabel('Shear Force F (kN)'); grid on
