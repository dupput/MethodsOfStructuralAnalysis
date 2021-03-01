clear; clc;

% Define problem variables (as globals)
global m k c F0 wr t0
m = 10000; k = 15000; c = 250;
F0 = 200; wr = 5; t0 = 1;

% Solve using the ode45 solver for high accuracy
[t,x] = ode45(@f, [0:0.01:300], [0;0]); % The initial value must be a vector

% Plot the results
figure
subplot(3,1,1)
plot(t,x(:,1)) % You need the 1st column of the vector for the position z1
xlabel('t (sec)'); ylabel('x (m)'); grid on

subplot(3,1,2)
plot(t,x(:,2))


% This is the ODE function to solve
function dxdt=f(t,x) % change so t is input variable
    global m k c F0 wr t0 % Don’t forget the global variables
    F = Ricker(F0, wr, t0, t);
    dxdt(1,1)=x(2); % This needs to be defined as a vector. z1 is the 1st row.
    dxdt(2,1)=(1/m)*(F - k*x(1) - c*x(2)); % z2 is the 2nd row.
end

% input excitation
function F = Ricker(F0, wr, t0, T)
    F = zeros(size(T));
    for ii = 1:length(T)
        F(ii) = F0 * (1 - (0.5 * wr^2) * (T(ii) - t0)^2) * exp(-0.25 * wr^2 * (T(ii) - t0)^2);
    end
end

% Centred Finite Difference
function dxdt = centre_diff(x, y)
    dxdt = zeros(1,length(x));
    for ii = 3:(length(dxdt)-2) % This time we miss both the first and last points
        dxdt(ii) = ( -y(ii+2)+8*y(ii+1)-8*y(ii-1)+y(ii-2) ) / (6* ( x(ii+1)-x(ii-1) ) );
    end
end