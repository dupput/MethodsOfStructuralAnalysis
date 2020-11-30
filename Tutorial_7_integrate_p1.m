clc; clear;
upper = 1;
lower = 0;
x = -3:0.5:3; xi = -3:0.1:4;
y =  x.^4-x.^3+8*x.^2+5;

approx = trapez(x, x.^4-x.^3+8*x.^2+5);
y_int = xi.^5/5 - xi.^4/4 + 8*xi.^3/3 + 5*xi + 3117/20;
plot(x, approx, 'o', xi, y_int)

function int_trap = trapez(x,y)
    int_trap = zeros(size(x));
    for ii = 2:length(x)
        int_trap(ii) = int_trap(ii-1) + (y(ii-1)+y(ii))*(x(ii)-x(ii-1))/2;
    end
end

