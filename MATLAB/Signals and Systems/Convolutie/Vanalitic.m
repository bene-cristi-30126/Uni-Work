u = @(n) (n>=0);
sx= -3; ex =5; dtx= sx:ex;
x=@(n) (u(n) - u(n-2));
sy= -2; ey =5; dty= sy:ey;
y=@(n) ((0.2).^n.* u(n));
dtv=sx+sy:ex+ey;
v=conv(x(dtx), y(dty));
v_analitic = 0.2.^dtv .* (1-5.^(dtv+1) )/4 .* ...
    (-(dtv>=0)+(dtv>=2)) + 6 * 0.2.^dtv.*(dtv>=2);
figure,
subplot(311); stem(dtx,x(dtx)); grid; xlabel('n'); ylabel('x[n]');
subplot(312); stem(dty,x(dty)); grid; xlabel('n'); ylabel('y[n]');
subplot(313); stem(dtv,v); grid; xlabel('n'); ylabel('v[n]'); hold on;
stem(dtv, v_analitic, '*r'); legend('v', 'v_analitic')