G=tf([-1 5], [1 0]);
H=tf(3, [1 8]);
Hdes=G*H;
nyquist(Hdes)