
P=[1,2.5,5,10,25,50,100];
for i=1:length(P)
    H5=tf(200,conv([1,5],[1,P(i)]) );
    Hd5=c2d(H5,min(1/50, 1/(P(i)*10)));

    step(H5), hold on, step(Hd5)
    legend('1','2.5','5','10','25','50','100');
end

% H6=tf([1 7],[1 9], 'IOdelay', 0.5);
% Hd6=c2d(H6, 0.5/0.5) %Te=0.9 si trebe cat mai aproape de 0.5 intreg
% 
% subplot(326), step(H6), hold on, step(Hd6)
