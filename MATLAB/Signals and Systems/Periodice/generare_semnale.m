subplot (2,1,1)
x1=[-3:.1:3];
f=zeros(1,length(x1));
for i=1:length(x1)
    f(i)=3*x1(i)^3-2*x1(i)+x1(i);
end
plot(x1,f)
grid on;

subplot (2,1,2)
x2=[-3:.1:3];
g=zeros(1,length(x2));
for i=1:length(x2)
    g(i)=exp(x2(i))-2*x2(i)+3;
end
plot(x2,g)
grid on;

f(100)=3*100^3-2*100+100; 
 g(10)=exp(10)-2*10+3;
 z=f(100)/g(10)
