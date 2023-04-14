close all,

Hc=tf((11.6^2)*[22 1], 1);
Hf=tf( 1,[22 1 0]);
Ho=feedback(Hc*Hf,1);
step(Ho)