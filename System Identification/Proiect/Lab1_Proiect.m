k=1:10
y=[4; 9; 10; 20; 29; 39; 54; 70; 91; 110]
X=[ ones(10,1), k', k'.^2]

Teta=X\y

yc=zeros(1,10);
E=zeros(1,10);
for i=1:10
    yc(i)=[1 k(i) k(i).^2]*Teta;
    E(i)=y(i)-yc(i);
end

subplot(2,1,1), plot(k,y,'r*', k,yc,'b')
subplot(2,1,2), plot(k,E)
grid on

MSE=0;
for i=1:10
    MSE=MSE+E(i).^2
end
MSE=MSE/10
