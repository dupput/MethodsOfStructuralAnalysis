clc; clear;
x = 2:2:10; y = log(x);
xi = [1, 2.5, 5.6] % this can be single point or range
yi = linear_interpol(x, y, xi)
y_actual = log(xi)
plot(x, y, xi, yi, 'o')

function y_out = linear_interpol(x_in, y_in, x_out)
    y_out = zeros(size(x_out));
    for jj = 1:length(x_out)
        if x_out(jj) < min(x_in)
            ii = 1; 
        elseif x_out(jj) > max(x_in)
            ii = length(x_in) - 1;
        else
            ii = find(x_in <= x_out(jj), 1, 'last');
        end
        x1 = x_in(ii);  x2 = x_in(ii+1);
        y1 = y_in(ii);  y2 = y_in(ii+1);
        y_out(jj) = y1 + (y2-y1)/(x2-x1)*(x_out(jj)-x1);
    end
end