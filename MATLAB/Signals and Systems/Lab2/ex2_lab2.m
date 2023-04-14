t=[-5:.1:5];
subplot(3,2,1);
x1=4*cos(pi*t)
plot(t,x1); grid;

subplot(3,2,2);
x2=2*sin(3*t)
plot(t,x2); grid;

subplot(3,2,3);
x3=0.9*cos(pi*t/10)
plot(t,x3); grid;

subplot(3,2,4);
x4=4*sin(5*pi*t-pi/4)
plot(t,x4); grid;

subplot(3,2,5);
x5=cos(4*t)+2*sin(8*t)
plot(t,x5); grid;

subplot(3,2,6);
x6=3*cos(4*t)+sin(pi*t)
plot(t,x6); grid;