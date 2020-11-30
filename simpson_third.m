clc; clear;
upper = 10; % upper bound of integral
lower = 0; % lower bound of integral
func = 3*x + x.^2;

area = intergrate(x, y);
total_area =area(length(x))

function trap = intergrate(x, y)
    trap = zeros(size(x));
    for ii =3:length(x)
        trap(ii) = trap(ii-2) + ((y(ii-2) + 4*y(ii-1) + y(ii)) / 3) * ((x(ii) - x(ii-2))/2);
    end
end

%% How do i implement a lower bound to this formula? How can I call this from command window?
