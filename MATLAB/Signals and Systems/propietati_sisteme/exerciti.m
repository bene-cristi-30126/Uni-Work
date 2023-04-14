u=@(t)(t>=0);
x1 = @(u,t)(u(t)-u(t-2)); t =-3:0.01:5;
subplot(5,2,1); plot(t,x1(u,t)); axis([-3 4 -0.1 1.1]); grid; xlabel('t'); ylabel('x_1(t)')
y1 = @(u,t)((u(t)-u(t-1)).*t + (u(t-1)-u(t-2)).*(2-t));
subplot(5,2,2); plot(t,y1(u,t)); axis([-3 4 -0.1 1.1]); grid; xlabel('t'); ylabel('y_1(t)')

%a
x2 = x1(u,t+2)+ x1(u,t+1) + x1(u,t);
subplot(5,2,3); plot(t,x2); axis([-3 4 -0.1 2.1]); grid; xlabel('f'); ylabel('x_2(t)')
y2 = y1(u,t+1) + y1(u,t);
subplot(5,2,4); plot(t,y2); axis([-3 4 -0.1 2.1]); grid; xlabel('f'); ylabel('y_2(t)')

%b
x3 =x1(u,t+2) + x1(u,t-2);
subplot(5,2,5); plot(t,x3); axis([-3 4 -0.1 1.1]); grid; xlabel('f'); ylabel('x_5(t)')
y3 =y1(u,t+2) + y1(u,t-2);
subplot(5,2,6); plot(t,y3); axis([-3 4 -0.1 1.1]); grid; xlabel('t'); ylabel('y_5(t)')

%c
x4 = -2*x1(u,t+2);
subplot(5,2,7); plot(t,x4); axis([-3 4 -2.1 0.1]); grid; xlabel('t'); ylabel('x_4(t)')
y4 = -2*y1(u,t+2);
subplot(5,2,8); plot(t,y4); axis([-3 4 -2.1 0.1]); grid; xlabel('f'); ylabel('y_4(t)')


%d
x5 = -2*x1(u,t);
subplot(5,2,9); plot(t,x5); axis([-3 4 -2.1 0.1]); grid; xlabel('t'); ylabel('x_5(t)')
y5 = -2*y1(u,t-1);
subplot(5,2,10); plot(t,y5); axis([-3 4 -2.1 0.1]); grid; xlabel('f'); ylabel('y_5(t)')