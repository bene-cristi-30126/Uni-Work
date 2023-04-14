H=tf(1, conv([2,1],[100.5,1]));
Te=min(2/10,100/10);
Hd1=c2d(H,10)
step(H), hold on, step(Hd1)
figure, rlocus(H)