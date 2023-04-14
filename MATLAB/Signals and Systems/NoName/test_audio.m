[s, fs] = audioread('sound3.mp3');
n = length(s);
t = (0:n-1)*(1/fs);
figure, 
subplot(4,1,1), plot(t, s(1:n)), 
sound(s(1:n), fs)

pause
%s(t) <-> s(-t)
sf = fliplr(s(1:n)');
subplot(4,1,2) , plot(t, sf)
sound(sf, fs)

pause
sc = s(1:2:end);
tc = (0:length(sc)-1)*(1/fs);
subplot(4,1,3), plot(tc, sc)
sound(sc, fs)

pause
se = s(1:1/2:end);
te = (0:length(se)-1)*(1/fs);
subplot(4,1,4), plot(te, se), 
sound(se, fs)
