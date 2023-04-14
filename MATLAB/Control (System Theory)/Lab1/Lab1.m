Ha=tf([1,0.5],[1,1,1,0])
subplot(311), nyquist(Ha)

Hb=tf([40,4],[-6,5,1])
subplot(312), nyquist(Hb)

Hc=tf([1],[0.3,1,1])
subplot(313), nyquist(Hc)

Hc=tf([125],[1,2,25],'IODelay',0.5)
figure, nyquist(Hc)

Hc=tf([125,1],[1,2,25])
figure, nyquist(Hc)