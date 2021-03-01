clear; clc;

global c
c = 0.05;
y0 = 200;
tspan = 0:1:100;

[t, y] = ode45(@f, tspan, y0);
plot(t, y)

function dydt = f(t, y)
    global c
    dydt = -c * y;
end