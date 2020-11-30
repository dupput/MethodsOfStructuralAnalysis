clc
clear

a = 0;
b = 10;

while f(b)*f(a) > 0
    a = b;
    b = 2*b;
end

iter = 0;
max_iter = 100;
tol = 1;
err = 10;

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
    E = 210e9;
    init = 350e6;
    A = 2;
    n = 10;
    strain = 0.02;
    y = x/E + x*A/E * (x/init)^(n-1) - strain;
end
