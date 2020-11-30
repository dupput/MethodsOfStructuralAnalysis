clc
clear

x = 0;
iter = 0;
max_iter = 50;
err = 10;
tol = 1;

while iter <= max_iter && err >= tol
    iter = iter + 1
    x_new = x - f(x)/df(x)
    err = abs(x_new-x);
    x = x_new;
end

function y = f(x)
    E = 210e9;
    init = 350e6;
    A = 2;
    n = 10;
    strain = 0.02;
    y = x/E + x*A/E * (x/init)^(n-1) - strain;
end

function y = df(x)
    E = 210e9;
    init = 350e6;
    A = 2;
    n = 10;
    y =(1/E) + (A*n)/(E*(init^(n-1))) * x^(n-1);
end