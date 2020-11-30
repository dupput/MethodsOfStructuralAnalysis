clc; clear;
upper = 1;
lower = 0;
x = -3:0.5:4; xi = -3:0.1:4;
y =  x.^4-x.^3+8*x.^2+5;

approx = trapez(x, x.^4-x.^3+8*x.^2+5);
y_int = xi.^5/5 - xi.^4/4 + 8*xi.^3/3 + 5*xi + 3117/20;
plot(x(1:2:end), approx(1:2:end), 'o', xi, y_int)

function trap = trapez(x,y)
    trap = zeros(size(x))
    for ii =3:length(x)
        trap(ii) = trap(ii-2) + ((y(ii-2) + 4*y(ii-1) + y(ii)) / 3) * ((x(ii) - x(ii-2))/2)
    end
end

