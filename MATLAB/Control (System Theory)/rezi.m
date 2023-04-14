close all
H=tf(4,[conv([1 4],[1 1]) 0])
Ho=feedback(H,1) 
step(Ho)

figure, nyquist(H)