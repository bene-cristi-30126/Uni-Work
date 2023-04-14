n1=-6;n2=6;
n=n1:n2;
u=@(n)(n>=0);
x=(-n/2).*(u(n+4)-u(n-5));

subplot(221), stem(n,x),

x1= dirac(n)- dirac(n-1) + dirac(n-4);
subplot(222), stem(n,x1);

y= (0.5).^n.*u(n);
subplot(223), stem(n,y);
subplot(224), stem(conv(x1,y));
