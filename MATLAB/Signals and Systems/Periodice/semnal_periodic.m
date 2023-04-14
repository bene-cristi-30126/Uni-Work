subplot(2,1,1)
x=@(t)(4*cos(pi*t-acos(1/4)));
fplot(x, [-2, 3]); grid;
xlabel('t'); ylabel('x(t)')

subplot(2,1,2)
t= -2:0.01:3;
x=(4*cos(pi*t-acos(1/4)));
plot(t,x); grid;
xlabel('t'); ylabel('x(t)')