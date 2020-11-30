clc
clear

% initial values
x = [3, 4]; % estimate value
iter = 1; imax = 60; tol = 0.00001; err = tol;

% main loop
while iter <= imax && err >= tol
    iter = iter + 1;
    x = x - Jacob(x)\F(x);
    err = norm(F(x));
end

% print results
final_result = x
total_iterations = iter

% 
function y = F(x)
    % define the multiple functions
    X = x(1); Y = x(2);
    f = X^2 + Y^2 - 4;
    g = exp(X) + Y - 1;
    y = [f; g];
end

function y = Jacob(x)
    X = x(1); Y = x(2);
    dfdx = 2*X; dfdy = 2*Y;
    dgdx = exp(X); dgdy = 1;
    y = [dfdx, dfdy; dgdx, dgdy];
end