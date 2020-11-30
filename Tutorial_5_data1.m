clc
clear all

data = importdata("data1.mat");
x = data.xx;
y = data.yy;
% plot(x,y,'o') %plot graph to approximate shape of curve

% create the F matrix. Decide number of x variables after plot approx
n = length(x);
F = [ones(n, 1), x, x.^2, x.^3];

% solve for parameters a
a = F\y
 
% plot graph
yfit = F * a;
%yfit = a(1) + a(2) * x + a(3) * x.^2 + a(4) * x.^3; 
%lines 17 and 18 equivalent
plot(x,y, "or", x, yfit, 'b')

% determine accuracy
yav = sum(y)/n;
St = sum( (y-yav).^2 );
Sr = sum( (y-yfit).^2 ); % residual error
R1 = (St-Sr) / St 
 