A=[-1 0 0 0 0;
    0 -1 0 0 0;
    0 0 -3 2 0;
    0 0 0 1 0;
    0 0 0 0  -2]

B=[1 0; 0 1; 1 0; 0 0; 0 1];
C=[1 2 0 0 0; 0 0 0 -1 1];
D=[0 0; 0 0];

sys=ss(A,B,C,D)

[num1,dem1]=ss2tf(A,B,C,D,1);
[num2,dem2]=ss2tf(A,B,C,D,2);

H11=minreal(tf(num1(1,:),dem1),1e-1)
H12=minreal(tf(num1(2,:),dem1),1e-1)
