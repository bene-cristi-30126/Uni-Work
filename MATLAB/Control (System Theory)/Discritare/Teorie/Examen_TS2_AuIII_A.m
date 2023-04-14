close all
K=1;
G=tf([-1 5],[1 0])
H=tf(3,[1 8])
Ho=feedback(K*G,H)
Hdes=series(K*G,H)
bode(Hdes)
figure, step(Ho)