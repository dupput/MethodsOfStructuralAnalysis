clc
clear

a = 0;
b =10;
iter = 0;
max_iter = 500;
tol = 0.0001;
err = 1;
while iter <= max_iter && err >= tol
    iter = iter + 1
    x = (a + b)/2
    if f(x) * f(a) > 0
        err = abs(a-x);
        a = x;
    else
        err = abs(b-x);
        b = x;
    end
end

function y = f(x)
    y = x^2 + 3*x -5;
end
