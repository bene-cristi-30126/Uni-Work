clear all, close all
load("iddata-18.mat");

na=1;m=2; u=val.u; y=[2 -4];
deep=3;

    for n=1:na
            if deep<=n
              coloane_y(1,n)=0; coloane_u(1,n)=0;
            else
              coloane_y(1,n)=y(deep-n); coloane_u(1,n)=u(deep-n);
            end
    end
        Matri=1;     %initializre Matri    

    for pow=1:m
        Matri=[Matri,coloane_y.^pow];   Matri=[Matri,coloane_u.^pow];       % aduagare u si y simpli     
    end
    Fi=Matri