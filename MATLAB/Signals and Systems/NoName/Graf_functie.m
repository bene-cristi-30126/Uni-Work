subplot(2,1,1)
t1= linspace(-3,3);
y1= zeros(1,length(t1));
for i=1:length(y1)
    if(t1(i)>0)
        y1(i)=t1(i)/2;
    else
        y1(i)=-t1(i)/2;
    end
end
plot(t1,y1)

subplot(2,1,2)
t2= linspace(-10,10);
y2= zeros(1,length(t2));
for i=1:length(y2)
    if(t2(i) < -4 && 4 <= t2(i))
        y2(i)=cos(2*t2(i));
    else
        y2(i)=sin(t2(i));
    end
end
plot(t2,y2)