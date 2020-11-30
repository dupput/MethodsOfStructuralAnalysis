clear all
clc

newton_function(@f, @df, 1, 50, 0.01)

function y = f(x)
y = x^2 - 2;
end

function y =df(x)
y = 2*x;
end
