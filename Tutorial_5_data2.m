clc
clear all

data = importdata("data2.mat");
xi = data.xx
% y = data.yy;
%plot(x,y, "o")
x = [0.03, 0.04, 0.05, 0.06, 0.1, 0.11]'
y = [19, 15, 12, 10.5, 7, 5.7]'

n = length(x);
F = [ones(n, 1),  x, log(x)];

a = F\y;

yfit = F*a;
plot(x, y, "or", x, yfit, 'b')
yav = sum(y)/n;
St = sum( (y-yav).^2 );
Sr = sum( (y-yfit).^2 ); % residual error
R1 = sqrt((St-Sr) / St) 
R2 = corrcoef(yfit, y)