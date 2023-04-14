close all
H=tf(10,[8 1])
Hdis=c2d(H,0.8,'zoh')
step(H), hold on, step(Hdis)

H=tf(5,conv([1 4],[1 16]))
Hdis=c2d(H,1/160,'zoh')
figure, step(H), hold on, step(Hdis)

H=tf([1 5],[1 8 64])
Hdis=c2d(H,1/40,'zoh')
figure, step(H), hold on, step(Hdis)

H=tf([1 2],[1 101 100 0])
Hdis=c2d(H,1/10,'zoh')
figure, step(H), hold on, step(Hdis)

% P=[1 2.5 5 10 25 50 100]
% esanti=[1/50 1/50 1/50 1/100 1/250 1/500 1/1000]
% for i=1:length(P)
%     H=tf(200,conv([1 1],[1 P(i)]))
%     Hdis=c2d(H,esanti(i),'zoh')
%     figure, step(H), hold on, step(Hdis)
% end
% 
% H=tf([1 7],[1 9], 'IOdelay', 0.5)
% Hdis=c2d(H,0.05,'zoh')
% figure, step(H), hold on, step(Hdis)
