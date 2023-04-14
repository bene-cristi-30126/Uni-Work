%secventa impuls
subplot(2,1,1)
n1= -5; n2=10; n=n1:n2;
x= (n==1)
stem(n,x)
xlabel('s'); ylabel('\delta.n');
title('Secventa impuls unitar')
axis([n1 n2 -0.1 1.1]);

subplot(2,1,2)
x= @(n)(n==0)
stem(n,x(n))
xlabel('s'); ylabel('\delta.n');
title('Secventa impuls unitar')
axis([n1 n2 -0.1 1.1]);