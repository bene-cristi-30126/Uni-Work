clear all, close all

Ha=tf([1,200],conv([1,5],[1,10]));
Hda=c2d(Ha,min(1/50,1/100), 'tustin');
step(Ha), hold on, step(Hda)

Hc=tf([1,7],[1,9],'IOdelay',0.2);
Hdc=c2d(Hc,0.08,'zoh')
figure, step(Hc), hold on, step(Hdc)



Hd=tf(72,[1,6,36]);
Hdd=tf([72*(0.03^2) 0 0],[1.2124, 2.18, 1])
figure, step(Hd), hold on, step(Hdd)

P=[1 2.5 5]
esanti=[1/50 1/50 1/50]
for i=1:length(P)
    H=tf(200,conv([1 1],[1 P(i)]))
    Hdis=c2d(H,esanti(i),'zoh')
    figure, step(H), hold on, step(Hdis)
end