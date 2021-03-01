clc; clear;
global c

% Apply the Euler method as a modular function:
c = 0.05;
t = 0:25:100;
tspan = 0:1:100;
y0 = 200;
yE = euler_method(@f, t, y0); % Input the derivative function using a handle
yH = heun_method(@f, t, y0);
[tspan, y] = ode45(@f, tspan, y0); % https://uk.mathworks.com/help/matlab/math/choose-an-ode-solver.html
plot(tspan, y, 'k', t, yE, '--r', t, yH, '--b')
legend('Exact', 'Euler', 'Heun')

% This is the function for the Euler method
function y = euler_method(f,t,y0)
    y = zeros(size(t));
    y(1) = y0;
    for ii=1:(length(t)-1)
        y(ii+1) = y(ii) + f(t(ii),y(ii))*(t(ii+1)-t(ii));
    end
end

function y = heun_method(f,t,y0)
    y = zeros(size(t));
    y(1) = y0;
    for ii=1:(length(t)-1)
        % Make a first prediction using Euler’s method
        y_pred = y(ii) + f(t(ii),y(ii))*(t(ii+1)-t(ii));
        % Then, Heun’s method uses the average slope:
        y(ii+1) = y(ii)+ 0.5*(f(t(ii),y(ii)) + f(t(ii+1),y_pred)) *(t(ii+1)-t(ii));
    end
end

% This is the function for the derivative
function dydt=f(t,y)
    global c
    dydt = -c*y;
end

