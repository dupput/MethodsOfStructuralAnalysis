% right so I am getting graphs that look good but I feel like I am doing it
% wrong somehow.
clc
clear all

% import data
data = importdata("data3.mat");
x_data = data.xx
y_data = data.yy;

% produce fits
a_linear = myFit(x_data, y_data, @myLinear); 
y_linear = myLinear(x_data) * a_linear;
R2 = corrcoef(y_data, y_linear)
plot(x_data, y_data, "or", x_data, y_linear, 'b')

% function to determine a
function a = myFit(x, y, f)
    a = f(x)\y;
end 

% function to fit graph
function y = myLinear(x)
    n = length(x);
    y = [ones(n,1), x, 1./x]; %does graph become more efective the more parameters I add even if they are unrelated?
end


