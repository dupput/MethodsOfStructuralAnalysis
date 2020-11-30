clc; clear;
upper = 10;
lower = 3;
x = 3:10;
y = 3*x + x.^2;

%area = Trapezoidal(upper, lower, 3*x + x.^2)
area = trapez(x, y)

function trap1 = Trapezoidal(upper, lower, y)
    x1 = 0 : upper;
    x2 = 0 : lower;
    trap1 = zeros(size(x1));
    trap2 = zeros(size(x2));
    for ii =2:length(x1)
        trap1(ii) = trap1(ii-1) + (y(ii-1) + y(ii)) * (x1(ii) - x1(ii-1)) / 2;
    end
%     for ii =2:length(x2)
%         trap2(ii) = trap2(ii-1) + (y(ii-1) + y(ii)) * (x2(ii) - x2(ii-1)) / 2;
%     end
%     trap = trap1(length(x1))-trap2(length(x2));
end

function int_trap = trapez(x,y)
    int_trap = zeros(size(x));
    for ii = 2:length(x);
        int_trap(ii) = int_trap(ii-1) + (y(ii-1)+y(ii))*(x(ii)-x(ii-1))/2;
    end
end
