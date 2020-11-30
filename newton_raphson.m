clc
clear

% initial values
x(1) = 0; iter = 1;
imax = 60;
tol = 0.00001; err = tol;

% main loop
while iter <= imax && err >= tol
    iter = iter + 1;
    x(iter) = x(iter-1) - f(x(iter-1)) / df(x(iter-1));
    err = abs(x(iter)- x(iter-1));
end

% print results
final_result = x(iter)
total_iterations = iter

% 
function y = f(x)
    y = x^2 + 3*x -5;
end

function y = df(x)
    y = 2*x + 3;
end