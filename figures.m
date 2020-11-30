clc
clear all

x1= 0:1000;
y1 = log(x1);
x2 = 0:0.1:10;
y2 = exp(x2);
y3 = 2*x2.^3;

figure("name", "subplot")
subplot(2,3,1)
plot(x1,y1)
title("plain graph")
subplot(2,3,2)
semilogx(x1,y1)
title("log graph")
subplot(2,3,3)
plot(x2,y2)
title("exp graph")
subplot(2,3,4)
semilogy(x2,y2)
title("log y graph")
subplot(2,3,5)
loglog(x2,y3)
title("log log graph")

%%
[i, j] = meshgrid( 1:0.2:10, 1:0.2:10);
k = sin(i) + cos(j);
%surf(i,j,k)
%mesh(i,j,k)
contour(i,j,k, [-2:0.5:2], "Showtext", "on", "LineWidth", 2)
colorbar


