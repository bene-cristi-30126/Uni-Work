u0 = @(t)(t>=0)
A=1; T=1; t=-2:0.001:2;
i=A*u0(t+T/2)-A*u0(t-T/2);
plot(t,i, 'LineWidth', 2)
axis([min(t), max(t), min(i)-0.01, max(i)+0.01])
xlabel('t'); xlabel('i(t)'); grid