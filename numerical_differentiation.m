clc; clear
x = 2:0.1:6;
y = cos(x.^2).*exp(0.1*x.^2);
% Exact derivative
x_ex = 2:0.001:6;
dydx_ex = -2*sin(x_ex.^2).*x_ex.*exp(0.1*x_ex.^2)+0.2*cos(x_ex.^2).*exp(0.1*x_ex.^2).*x_ex;

% Calculate Centre Finite Difference
dydx_cen = centre_diff(x,y);
dydx_bad_cen = bad_cent_diff(x,y);

% Plot
figure
plot(x_ex,dydx_ex,'b', x,dydx_cen,'*m', x,dydx_bad_cen,'*b')
xlabel('x','Fontweight','bold'); ylabel('f(x)','Fontweight','bold'); grid on; grid minor;

% Centred Finite Difference
function dydx = centre_diff(x, y)
    dydx = zeros(1,length(x));
    for ii = 3:(length(dydx)-2) % This time we miss both the first and last points
        dydx(ii) = ( -y(ii+2)+8*y(ii+1)-8*y(ii-1)+y(ii-2) ) / (6* ( x(ii+1)-x(ii-1) ) );
    end
end

function dydx = bad_cent_diff(x,y)
    dydx = zeros(1,length(x));
    for ii = 2:(length(x)-1)
        dydx(ii) = ( y(ii+1) - y(ii-1) ) / ( x(ii+1) - x(ii-1) );
    end
end

