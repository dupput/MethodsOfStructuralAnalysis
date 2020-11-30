
% Three Points:
x1 = 1; y1 = log(x1);
x2 = 4; y2 = log(x2);
x3 = 6; y3 = log(x3);
x4 = 7; y4 = log(x4);
% Interpolation:
x = 6.5;
b1 = y1;
b2 = (y2-y1) / (x2-x1);
b3 = ((y3-y2)/(x3-x2) - (y2-y1)/(x2-x1)) / (x3-x1);
b4 = ((y4-y3)/(x4-x3) - (y3-y2)/(x3-x2) - (y2-y1)/(x2-x1)) / (x4-x1);
y_pred = b1 + b2*(x-x1) + b3*(x-x1)*(x-x2) + b4*(x-x1)*(x-x2)*(x-x3)
y_act = log(x)