u0 = @(t)(t>=0)
A=1; T=1; t = -4:0.001:4;
i= @(t) (A*u0(t+4*T)-A*u0(t));

x =-1/2*sin(2*pi*t).*i(t)+1/2*cos(2*pi*t).*u0(t);
plot(t,x); xlabel('axa X');ylabel('axa Y');
