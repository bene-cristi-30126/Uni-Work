clear all, close all
H1=tf((10*pi/sqrt(24))^2, [1 4*pi/sqrt(24), (10*pi/sqrt(24))^2]);
H2=tf(1,[0.8,1])
Te=0.4;        %Te=sqrt(24)/(20*pi);
sys1=c2d(H1, Te, 'zoh')
sys2=c2d(H2, Te, 'zoh')
step(sys1, 'b'), hold on, step(sys2, 'r') 