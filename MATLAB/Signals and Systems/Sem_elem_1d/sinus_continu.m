A=2; T=1/10; phi=pi/3;
t1=-0.1; tstep=0.005; t2=0.2;
subplot(2,1,1)
t=t1:tstep:t2;
xs=A*sin(2*pi/T*t+phi);
plot(t,xs,'LineWidth',2); grid;
xlabel('t'); ylabel('x_s(t)');
title('x_s(t)=A sin(2 \pi /T) t+  /phi)')

subplot(2,1,2)
A=2; T=1/10; phi=pi/3;
t1=-0.1; t2=0.2;
xs=@(t)(A*sin(2*pi/T*t+phi));
t=[t1,t2];
fplot(xs,t); grid
xlabel('t'); ylabel('x_s(t)');
title('x_s(t)=A sin(2 \pi /T) t+  /phi)')

