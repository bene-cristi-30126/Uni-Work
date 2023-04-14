subplot(5,2,1)              %perioada=2/5
x=@(t)(4*cos(5*pi*t)-pi/4);
fplot(x, [-1, 1]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,2)              % nu este periodic
x=@(t)(4*(t>=0)+2*sin(3*pi*t));
fplot(x, [-1, 1]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,3)              % nu este periodic
x=@(t)(3*cos(4*t)+sin(pi*t));
fplot(x, [-2, 2]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,4)              %perioada=2
x=@(t)(cos(2*pi*t)+2*cos(4*pi*t)+sin(pi*t));
fplot(x, [-2, 2]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,5)              %perioada=2
x=@(t)(4*cos(3*pi*t+pi/2)+2*cos(8*pi*t+pi/2));
fplot(x, [-2, 2]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,6)              %perioada=2
x=@(t)(4*cos(3*pi*t+pi/2)+4*cos(10*pi*t-pi/2));
fplot(x, [-2, 2]); grid;
xlabel('t'); ylabel('x(t)')

subplot(5,2,7)              %perioada=2
n=-4:0.5:4;
xs=@(n) 4*cos(pi*n-2);
stem(n,xs(n)); grid;
xlabel('n');ylabel('x[n]')

subplot(5,2,8)              %perioada=2/3
n=-4:0.5:4;
xs=@(n) 2*cos(3*n);
stem(n,xs(n)); grid;
xlabel('n');ylabel('x[n]')

subplot(5,2,9)              %perioada=4
n=-4:0.5:4;
xs=@(n) 4*cos(0.5*pi*n+pi/4);
stem(n,xs(n)); grid;
xlabel('n');ylabel('x[n]')