n=[1:1:100];
x=zeros(1,length(n));
for i=1:length(x)
    x(i)=(1+1/n(i)).^n(i);
end
stem(n,x);