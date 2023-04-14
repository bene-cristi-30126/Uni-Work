T=2; t=-10:0.01:10;
u0 = @(t)(t==0)

i=u0(t).*(0.5);
plot(t,i, 'LineWidth', 2)
grid on