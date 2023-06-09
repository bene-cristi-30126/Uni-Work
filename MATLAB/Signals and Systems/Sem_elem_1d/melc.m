a=1; b=.1;
t=0:0.01:8*pi;
x=a*exp(b*t).*cos(t);
y=a*exp(b*t).*sin(t);
figure, plot(x,y, 'r', 'LineWidth', 2) 
box on;
set(gca, 'FontSize', 16, 'FontWeight', 'Bold', 'Xcolor' , [0 0 1], 'YColor', [0 0 1], 'XTick' , [-5 0 5 10], 'YTick' , [-10 -5 0 5])
title('\fontsize{20}\color{blue}(ae^{bt}cos(t) ae^{bt}sin(t))','EdgeColor', 'b', 'LineWidth', 2);