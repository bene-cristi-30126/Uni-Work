delta = @(n) (n ==0)
sx = -2; ex =5; dtx =sx:ex;
x= @(n) ( delta(n) + 2*delta(n-1) - delta(n-3));
sh = -4; eh = 4; dth = sh:eh;
h= @(n) (2*delta(n+1) + 2*delta(n-1));
dty = sx+sh:ex+eh;
y1= conv(x(dtx), h(dth));
y1_analitic = 2*(dty== -1) + 4*(dty==0) + 2*(dty==1)+ 2*(dty==2)- 2*(dty==4);
y2= conv(x(dtx+2), h(dth));
y2_analitic = 2*(dty== -3) + 4*(dty==-2) + 2*(dty==-1)+ 2*(dty==0)- 2*(dty==2);
y3= conv(x(dtx), h(dth+2));
y3_analitic = 2*(dty== -3) + 4*(dty==-2) +2*(dty==-1)+2*(dty==0)-2*(dty==2);
figure,
subplot(521);stem(dtx,x(dtx)); grid; xlabel('n'); ylabel('x[n]');
subplot(522);stem(dtx,x(dtx+1)); grid; xlabel('n'); ylabel('x[n+1]');
subplot(523);stem(dth,h(dth)); grid; xlabel('n'); ylabel('h[n]');
subplot(524);stem(dth,h(dth+2)); grid; xlabel('n'); ylabel('h[n+2]');
subplot(513);stem(dty,y1); grid; xlabel('n'); ylabel('x[n]*h[n]');
subplot(514);stem(dty,y2); grid; xlabel('n'); ylabel('x[n+1]*h[n]');
subplot(515);stem(dty,y3); grid; xlabel('n'); ylabel('x[n]*h[n+2]');