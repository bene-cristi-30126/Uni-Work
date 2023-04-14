n1=-5;n2=15;
n=n1:n2;
u=@(n)(n>=0);
y=0.1.^u(n);
x=u(n)-u(n-10);
subplot (311), stem(n,x)
subplot(312), stem(n,y)
subplot(313), stem(conv(x,y))