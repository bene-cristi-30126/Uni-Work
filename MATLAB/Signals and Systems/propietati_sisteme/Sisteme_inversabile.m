x=@(n)4*(n==0)
n= -6:2:6;
y=x(n)+(1/2)*x(n-1)+(1/4)*x(n-2)
stem(n,y)