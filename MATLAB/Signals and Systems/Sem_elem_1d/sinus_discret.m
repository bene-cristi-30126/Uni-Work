%semnal sinusoidal discret
subplot(2,1,1)
A=2; Ns=10; phi=pi/3;
n1=-5; n2=10; n=n1:n2;
xs= A*sin(2*pi*(1/Ns)*n+phi);
stem(n,xs)
xlabel('n');ylabel('x.s[n]')
title('x.s[n]= A sin(2\pi (1/N.s) n +\phi)')

subplot(2,1,2)
xs=@(n) A*sin(2*pi*(1/Ns)*n+phi);
stem(n,xs(n))
xlabel('n');ylabel('x.s[n]')
title('x.s[n]= A sin(2\pi (1/N.s) n +\phi)')