A=1; T=2; t=-10:0.01:10;
u0 = @(t)(t>=0)

subplot(3,3,1)
i=A*u0(t);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,2)
i=-A*u0(t-T);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,3)
i=-A*u0(t+T);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,4)
i=-A*u0(t)+1;
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,5)
i=-A*u0(t-T)+1;
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,6)
i=-A*u0(t+T)+1;
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid


subplot(3,3,7)
i=-A*u0(-t);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,8)
i=-A*u0(-t+T);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid

subplot(3,3,9)
i=-A*u0(-t-T);
plot(t,i, 'LineWidth', 2)
xlabel('t'); xlabel('i(t)'); grid