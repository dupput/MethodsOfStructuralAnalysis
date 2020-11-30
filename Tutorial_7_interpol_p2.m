clc; clear;
x = -3:1:3; y = x.^4-x.^3+8*x.^2+5;
xi = -3:0.25:3 % this can be single point or range
yi = cubic_interpolate(x, y, xi)
x_plot = -3:1/100:3; y_plot = x_plot.^4-x_plot.^3+8*x_plot.^2+5;
figure
plot(x, y, xi, yi, 'o', x_plot, y_plot, 'r')

function y_out = cubic_interpolate( x_in, y_in, x_out )
    y_out = zeros(size(x_out));
    for jj=1:length(x_out)
        if x_out(jj)<min(x_in) % This can be done in many different ways
            ii=2;
        else
            ii = find(x_in <= x_out(jj),1,'last');
            if ii==1
                ii=2;
            elseif ii>=length(x_in)-1
                ii=length(x_in)-2;
            end
        end
        x = x_out(jj);
        x1 = x_in(ii-1); y1 = y_in(ii-1);
        x2 = x_in(ii); y2 = y_in(ii);
        x3 = x_in(ii+1); y3 = y_in(ii+1);
        x4 = x_in(ii+2); y4 = y_in(ii+2);
        y_out(jj) = y1*((x-x2)*(x-x3)*(x-x4))/((x1-x2)*(x1-x3)*(x1-x4)) ...
            + y2*((x-x1)*(x-x3)*(x-x4))/((x2-x1)*(x2-x3)*(x2-x4))...
            + y3*((x-x1)*(x-x2)*(x-x4))/((x3-x1)*(x3-x2)*(x3-x4))...
            + y4*((x-x1)*(x-x2)*(x-x3))/((x4-x1)*(x4-x2)*(x4-x3));
    end
end

