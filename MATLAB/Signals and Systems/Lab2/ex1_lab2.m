t=[-10:0.1:10];
y=zeros(1,length(t));
for i=1:length(t)
    if(t(i)<=0 && t(i)>=-4)
        y(i)=-t(i)/2+1;
    elseif(t(i)>=0 && t(i)<4)
        y(i)=t(i)/2+1;
    else 
        y(i)=0;
    end
end
subplot (3,2,1), plot(t,y), xlabel('t'); ylabel('x1(n)');
subplot(3,2,2), plot(t-1,y), xlabel('t'); ylabel('x1(n-1)');
subplot(3,2,3), plot(t+1,y), xlabel('t'); ylabel('x1(n+1)');
subplot(3,2,4), plot(2*t,y), xlabel('t'); ylabel('x1(2*n)');
subplot(3,2,5), plot(t/2,y), xlabel('t'); ylabel('x1(n/2)');
title('Graficul semnalului');