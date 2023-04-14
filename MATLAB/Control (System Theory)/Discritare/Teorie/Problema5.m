H1=tf(10,[8,1]);
Hd1=c2d(H1,0.8);

subplot(321), step(H1), hold on, step(Hd1)

H2=tf(5,conv([1,4],[1,16]));
Hd2=c2d(H2,min(1/40,1/160));

subplot(322), step(H2), hold on, step(Hd2)

H3=tf([1 5],[1, 8, 64]);
Hd3=c2d(H3,1/40);

subplot(323), step(H3), hold on, step(Hd3)

H4=tf([1 2],[conv([1,1],[1,100]), 0]);
Hd4=c2d(H4,min(1/10, 1/10e3));

subplot(324), step(H4), hold on, step(Hd4)

P=5;
H5=tf(200,conv([1,5],[1,P]) );
Hd5=c2d(H5,min(1/50, 1/(P*10)));

subplot(325), step(H5), hold on, step(Hd5)

H6=tf([1 7],[1 9], 'IOdelay', 0.5);
Hd6=c2d(H6, 0.5/0.025) %Te=0.9 si trebe cat mai aproape de 0.5 intreg

subplot(326), step(H6), hold on, step(Hd6)
