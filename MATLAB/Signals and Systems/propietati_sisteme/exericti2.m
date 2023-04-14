u=@(t)(t>=0);
x1 = @(u,t)(u(t)-u(t-3)); t =-3:0.01:5;
subplot(3,2,1); plot(t,x1(u,t)); axis([-3 5 -0.1 5]); grid; xlabel('n'); ylabel('x(n)')
y1 = @(u,t)(2.*(u(t)-u(t-3)))
subplot(3,2,2); plot(t,y1(u,t)); axis([-3 5 -5 10]); grid; xlabel('n'); ylabel('y(n)')

x2 = x1(u,t);
subplot(3,2,3); plot(t,x2); axis([-3 5 -0.1 5]); grid; xlabel('n'); ylabel('x(n)')
y2 = @(u,t)((2.*t+1).*(u(t)-u(t-3)));
subplot(3,2,4); plot(t,y2(u,t)); axis([-3 5 -5 10]); grid; xlabel('n'); ylabel('y(n)')

x3 =x1(u,t);
subplot(3,2,5); plot(t,x3); axis([-3 5 -0.1 5]); grid; xlabel('n'); ylabel('x(n)')
y3 = @(u,t)(-2.*(u(t)-u(t-3)));
subplot(3,2,6); plot(t,y3(u,t)); axis([-3 5 -5 10]); grid; xlabel('n'); ylabel('y(n)')