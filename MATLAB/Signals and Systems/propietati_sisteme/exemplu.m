u=@(t)(t>=0);
x1 = @(u,t)(u(t)-u(t-2)); t =-3:0.05:5;
subplot(2,2,1); plot(t,x1(u,t)); axis([-0.1 4 -2 4]); grid; xlabel('t'); ylabel('x1(t)')
x2 = @(u,t)((u(t)-u(t-1)).*t + (u(t-1)-u(t-2)).*(2-t));
subplot(2,2,2); plot(t,x2(u,t)); axis([-0.1 4 -2 4]); grid; xlabel('t'); ylabel('y2(t)')

y1 = @(u,t)(1/2).*(u(t)-u(t-2));
subplot(2,2,3); plot(t,y1(u,t)+y1(u,-t)); axis([-2 4 -2 4]); grid; xlabel('t'); ylabel('x1(t)')
y2 = @(u,t)(1/2).*((u(t)-u(t-1)).*t + (u(t-1)-u(t-2)).*(2-t));
subplot(2,2,4); plot(t,y2(u,t)+y2(u,-t)); axis([-2 4 -2 4]); grid; xlabel('t'); ylabel('y2(t)')