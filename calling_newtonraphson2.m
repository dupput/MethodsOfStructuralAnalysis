clear all
clc
xo = [3;-5]; imax = 50; xtol = 0.01;
newton_function(@f, @df, xo, imax, xtol)

function y = f(x)
y(1,1) = x(1)^2 +x(2)^2 -4;
y(2,1) = exp(x(1))+x(2)-1;
end

function y =df(x)
y = [2*x(1), 2*x(2); exp(x(1)), 1];
end
