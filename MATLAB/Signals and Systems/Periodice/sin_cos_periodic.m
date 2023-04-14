subplot(2,1,1)
x=@(t)(4*sin(pi*t+asin(1/4)));
fplot(x, [-2, 3]); grid;
xlabel('t'); ylabel('x(t)')

subplot(2,1,2)
t= -2:0.01:3;
x=@(t)(4*cos(pi*t-acos(1/4)));
fplot(x, [-2, 3]); grid;
xlabel('t'); ylabel('x(t)')