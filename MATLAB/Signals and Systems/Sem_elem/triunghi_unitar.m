u0 = @(t)(t>=0)
x2 = @(u,t)((u(t+1/2)-u(t)).*2.*(t+1/2) + (u(t)-u(t-1/2)).*(-2.*t+1));
plot(t,x2(u,t)); grid; xlabel('t'); ylabel('y2(t)')

