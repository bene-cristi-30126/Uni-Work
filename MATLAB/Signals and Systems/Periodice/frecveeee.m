subplot(2,1,1)
x=@(t)(10*sin(16*pi*t));
fplot(x, [0, 2]); grid;
xlabel('t'); ylabel('x(t)')

subplot(2,1,2)
t= -2:0.01:3;
x=@(t)(sin(pi*t-acos(1/4))+1);
fplot(x, [0, 2]); grid;
xlabel('t'); ylabel('x(t)')