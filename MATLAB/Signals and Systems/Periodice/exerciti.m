subplot(4,1,1)
x=@(t)(2*cos(pi*t-acos(-1/2)));
fplot(x, [-3, 3]); grid;
xlabel('t'); ylabel('x(t)')

subplot(4,1,2)
x=@(t)(2*sin(2*pi/3*t))+(t>=0);
fplot(x, [-6, 6]); grid;
xlabel('t'); ylabel('x(t)')

subplot(4,1,3)
t=-5:1:5;
xs=@(t) cos(pi*t);
stem(t,xs(t)); grid;
xlabel('t');ylabel('x[t]')

subplot(4,1,4) %mod(n,N)
N=10;
n=1:3.5*N;
xm=mod(-n,N)-5;
plot(n,xm);