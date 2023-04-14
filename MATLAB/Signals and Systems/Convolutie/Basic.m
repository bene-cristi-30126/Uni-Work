n=-10:10;figure
d = @(n)(n==0); 
u = @(n) (n>=0);
x=  d(n)+2*d(n-1)-d(n-3);
y=  2*d(n+1)+2*d(n-1) ;

subplot(311);
stem(n,x);

subplot(312);
stem(n,y);

z = conv(x,y);
subplot(313);
nz=-20:20;
stem(nz,z);