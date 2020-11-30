% example function x^2 - 2 = 0
% pass <newton_function(@(x) x^2 -2, @(x) 2*x, 1, 50, 0.01)> in command
% window. Check script 1, script 2
function x = newton_function(f, df, xo, imax, xtol)

    % initial values
    iter = 1;
    err = xtol;

    % main loop
    while iter <= imax && err >= xtol
        iter = iter + 1;
        x = xo - df(xo)\f(xo);
        err = norm(x- xo);
        xo = x;
    end

end