clc
clear all
x = [ 0 : pi/100 : 2*pi ]; %generate x values
y = sin(x); %function of x
plot(x,y, "r--")
% for colours can use 'r,g,b,c,m,y,k'
% for linestyle '-.,:'
%for marker 'o+*xsd'
% try "Linewidth",
xlabel("x")
ylabel("sin(x)")
hold on
y2 = sin(x+ pi/4);
plot(x,y2, 'b-')
legend('y', 'y_2', 'location', "bestoutside")
% '\pi' gives actual pi. "fontsize", "textcolor", "boxoff" 
xlim([0, 2*pi])
ylim([-1.1,1.1])
xticks(0:pi/2:2*pi)
xticklabels({'0', '\pi/2', '\pi', '3\pi/4', '2\pi'})
grid on
grid minor

%MAKE SURE TO REMEMBER:
%AXIS LABELS, LEGEND
%UNITS
%LEGIBEL TEXT
%ARE PLOTS DISTINGUISHABLE
%THINK ABOUT IF REPORT IS PUBLISHED IN BLACK AND WHITE?


