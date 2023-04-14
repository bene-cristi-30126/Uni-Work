x=@(n)(n==0)
n=0:6;y=2*x(n-2)+5*x(n-3)+2*x(n-4);
figure; stem(n,y)