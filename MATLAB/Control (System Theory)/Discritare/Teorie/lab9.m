clear all, close all

% Ha=tf(2,conv([5,1],[1,1]));
% Hda=c2d(Ha,min(5/10,1/10), 'tustin');
% Ho=feedback(8000*Ha,1); Hdo=feedback(8000*Hda,1);
% step(Ho), hold on, step(Hdo)
% figure, rlocus(Hda)

% H2=tf(2,conv([5,1],[1,1]));
% Hd2=c2d(H2,min(1/2,1/10), 'zoh')
% step(H2), hold on, step(Hd2)
% figure, rlocus(Hd2)

H2=tf(4,[2 1],'IOdelay',0.3);
Hd2=c2d(H2,0.3, 'zoh')
step(H2), hold on, step(Hd2)
figure, step(feedback(Hd2,92))
figure, rlocus(Hd2)
% 
% H2=tf(4*[1 4.41],[conv([1 18.4],[1 2]), 0] );
% Hd2=c2d(H2,min(1/20,1/184), 'zoh')
% step(H2), hold on, step(Hd2)
% figure, step(feedback(Hd2,92))
% figure, rlocus(Hd2)

% H2=tf([1 -1],[1 2 0] );
% Hd2=c2d(H2,1/20, 'zoh')
% step(H2), hold on, step(Hd2)
% figure, step(feedback(Hd2,1))
% figure, rlocus(Hd2)

% H2=tf(14,[1 7 49] );
% Hd2=c2d(H2,2/7, 'tustin')
% step(H2), hold on, step(Hd2)
% figure, step(feedback(Hd2,1))
% figure, rlocus(Hd2)