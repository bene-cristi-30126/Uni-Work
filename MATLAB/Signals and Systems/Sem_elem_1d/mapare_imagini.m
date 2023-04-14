I=imread('Rangers.jpg'); I=rgb2gray(I);
figure, imshow("Rangers.jpg")
[x,y]=meshgrid(1:size(I,2), 1:size(I,1));
figure, surf(x,y, double(I)), shading flat, colormap gray