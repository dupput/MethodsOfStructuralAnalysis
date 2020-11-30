clc; clear;
x = -3:1:3; y = x.^4-x.^3+8*x.^2+5;
xi = -3:0.5:2.5 % this can be single point or range
yi = linear_interpol(x, y, xi)
x_plot = -3:1/100:3; y_plot = x_plot.^4-x_plot.^3+8*x_plot.^2+5;
plot(x, y, xi, yi, 'o', x_plot, y_plot, 'r')

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
xx = "hello world"
