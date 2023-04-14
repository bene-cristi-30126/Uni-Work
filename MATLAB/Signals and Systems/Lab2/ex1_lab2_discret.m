n=[-10:0.5:10];
x=zeros(1,length(n));
for i=1:length(n)
    if(n(i)>0 && n(i)<=4)
        x(i)=-n(i)/2+1;
    elseif(n(i)>=-4 && n(i)<0)
        x(i)=n(i)/2+1;
    else
        n(i)=0;
    end
end
subplot(3,2,1), stem(n,x), xlabel('n'); ylabel('x2[n]');
subplot(3,2,2), stem(n-1,x), xlabel('n'); ylabel('x2[n-1]');
subplot(3,2,3), stem(n+1,x), xlabel('n'); ylabel('x2[n+1]');
subplot(3,2,4), stem(2*n,x), xlabel('n'); ylabel('x2[2n]');
subplot(3,2,5), stem(n/2,x), xlabel('n'); ylabel('x2[n/2]');