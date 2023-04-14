u0 = @(n)(n>=0);
d = @(n)(n==0);
x = @(n)(n/2.*(u0(n+4)-u0(n-5)));
n = -8:8;
subplot(4,2,1);
stem(n,x(n));grid;

subplot(4,2,2);
stem(n,x(2-n));grid;

subplot(4,2,3);
stem(n,x(n+2));

subplot(4,2,4);
stem(n,x(-n).*u0(n)+x(n));grid;

subplot(4,2,5);
stem(n,x(n+2)+x(-1-n));grid;

subplot(4,2,6);
stem(n,x(3*n).*d(n-1));grid;

subplot(4,2,7);
stem(n,x(n+1).*(u0(n+3)-u0(-n)));grid;

subplot(4,2,8);
stem(n,x(n).*(u0(n-4)-u0(n-3)));grid;