im=imread('test.jpg'); %incarcare imagine in Matlab
imshow(im) %afisare imagine
 
%binarizare imagine(in urma acestei operatii pixelii apartinand obiectelor
%trebuie sa fie albi, iar pixelii apartinand fundalului negri)

if(~islogical(im))
    if(ndims(im)>2), im=rgb2gray(im); end
    level=graythresh(im); BW=im2bw(im,level);
else
    BW=im;
end
figure,imshow(BW)
%daca in urma binarizarii fundalul este alb si obiectele negre, se va
%complementa imaginea
%BW=~BW;
%figure,imshow(BW)

%segmentare imagine si extragere contur obiecte 
[B,L,N]=bwboundaries(BW,'noholes');
%N - numarul de obiecte gasite in imagine;
%B- structura continand conturul fiecarui obiect;
%L- matrice 2D in care sunt etichetate regiunile gasite

%afisarea conturului fiecarui obiect din imagine 
nc=200;
for(k=1:N)
    X=B{k}(:,2);
    Y=B{k}(:,1);
    contur =[X';Y'];
    figure,plot(X,Y);
    ellipticFourierDescriptors(contur,nc)
end

stats = regionprops(BW, 'Centroid');
xc = stats.Centroid(1);
yc=  stats.Centroid(2);
boundary = bwboundaries(BW);
boundary = boundary{1};
x = boundary(:, 2);
y = boundary(:, 1);
% Compute all distances from centroid to every boundary point:
distances = sqrt((x - xc) .^ 2 + (y - yc) .^ 2);
figure, subplot(211), plot(x,distances) 
        subplot(212), plot(y,distances);