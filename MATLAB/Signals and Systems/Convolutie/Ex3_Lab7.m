delta = @(n) (n ==0)
sx = -2; ex =5; dtx =sx:ex; alfa=0.5;
x= @(n) ( delta(n) + alfa*delta(n-1));

sh = -4; eh = 4; dth = sh:eh;
dty = sx+sh:ex+eh;
h1= @(n) ( (alfa.^n).*delta(n) ); 
h2= @(n) ( sin(8*n) );

y1= conv(h2(dtx), h1(dth));

subplot(411);stem(dtx,x(dtx)); grid; xlabel('n'); ylabel('x[n]');
subplot(412);stem(dth,h1(dth)); grid; xlabel('n'); ylabel('h1[n]');
subplot(413);stem(dth,h2(dth)); grid; xlabel('n'); ylabel('h2[n]');
subplot(414);stem(dty,y1); grid; xlabel('n'); ylabel('h1[n]*h2[n]');