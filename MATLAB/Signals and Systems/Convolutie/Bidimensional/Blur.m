im=imread('peppers.png');
imshow(im);
%Blur Gaussian filter
h=1/256*[1,4,6,4,1;4,16,24,16,4;6,24,36,24,6;4,16,24,16,4;1,4,6,4,1]
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Blur');
%Motion blur
h=zeros(9,9);
for i=1:length(h)
 for j=1:length(h)
 if(i==j) h(i,j)=1;end
 end
end
h=h/9;
imf=imfilter(im,h,'conv','circular');
figure; imshow(imf);title('Motion blur');
%Sharpening
h=[-1,-1,-1;-1,9,-1;-1,-1,-1];
imf=imfilter(im,h,'conv','circular');
figure,imshow(imf);title('Sharpening');
%Laplacian edge and line detectors
h=[-1,-1,-1;-1,8,-1;-1,-1,-1]%detectie muchii
imf=imfilter(im,h,'conv','circular');
figure,imshow(imf);title('Laplacian detectie muchii');
h=[-1,-1,-1;2,2,2;-1,-1,-1]%detectie linii orizontale
imf=imfilter(im,h,'conv','circular');
figure,imshow(imf);title('Laplacian detectie liniiorizontale');
h=[-1,2,-1;-1,2,-1;-1,2,-1]%detectie linii verticale
imf=imfilter(im,h,'conv','circular');
figure,imshow(imf);title('Laplacian detectie liniiverticale');
h=[-1,-1,2;-1,2,-1;2,-1,-1];%45 degrees(upward slope)
imf=imfilter(im,h,'conv','circular');
figure,imshow(imf);title('Laplacian 45 degrees(upwardslope)');
h=[2,-1,-1;-1,2,-1;-1,-1,2]%45 degrees (downward slope)
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Laplacian 45 degrees (downwardslope)')
%Sobel edge detector
h=[1,2,1;0,0,0;-1,-2,-1]%evidentiere muchii orizontale
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Sobel muchii orizontale');
h=[1,0,-1;2,0,-2;1,0,-1]; %evidentiere muchii verticale
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Sobel muchii verticale');
%Prewitt edge detector
h=[1,1,1;0,0,0;-1,-1,-1]%evidentiere muchii orizontale
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Prewitt muchii orizontale');
h=[1,0,-1;1,0,-1;1,0,-1]%evidentiere muchii verticale
imf=imfilter(im,h,'conv','circular');
figure;imshow(imf);title('Prewitt muchii verticale');
imn=imnoise(im,'salt & pepper');
imwrite(imn,'photo1_noise.jpg');
h=1/9*[1,1,1;1,1,1;1,1,1];
imf=imfilter(imn,h,'conv','circular');
figure;imshow(imn);figure;imshow(imf);title('imaginea filtrata');
h=1/9*[1,1,1;1,1,1;1,1,1;1,1,1;1,1,1];
imf=imfilter(imn,h,'conv','circular');
figure;imshow(imn);figure;imshow(imf);title('imaginea filtrata filtru marit');