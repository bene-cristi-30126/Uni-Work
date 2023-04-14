A=[0 16 32 48; 16 0 16 32; 32 16 0 16; 48 32 16 0]
h=1/9*ones(3,3)
%afisare matrice initiala
imagesc(A), colormap gray; title('Imagine initiala')

%filtrare si afisare
Af=imfilter(A,h,'conv','circular')
figure, imagesc(Af), colormap gray; title('Imagine filtrata')