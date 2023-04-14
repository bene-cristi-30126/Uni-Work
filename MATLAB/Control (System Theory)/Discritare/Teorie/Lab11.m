dem=[2 2 0 4]; num=[1 7 2];
[a,b,c,d]=tf2ss([1 7 2],[2 2 0 4]);
N=3;
[gv, R]=deconv([num zeros(1,N)], dem);

[res,pol,dir]=residue(num,dem)
A=[pol(1) 0 0;
    0 pol(2) 0;
    0 0 pol(3)]
B=ones(N,1); C=res; D=0;