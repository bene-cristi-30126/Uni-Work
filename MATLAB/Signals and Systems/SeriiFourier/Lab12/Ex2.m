img = imread('saturn.png');         img2 =imread('cameraman.tif');

if (ndims(img)==3) 
    img = rgb2gray(img); 
end

F = fftshift(fft2(double(img)));    F2 = fftshift(fft2(double(img2)));


B = imresize(img, size(img2));


figure; subplot(121), imshow(B);  subplot(122), imshow(img2);

figure; subplot(121), imshow(log(abs(F)),[]); title('Magnitude')
        subplot(122), imshow(log(abs(F2)),[]); title('Magnitude')
      
figure; subplot(121), imshow(angle(F)); title('Phase')
        subplot(122), imshow(angle(F2)); title('Phase')

filtertype = 'LPF';
D0 = 27;
n = 1;
[M,N] = size(img);
 H = imfreqfilter(filtertype,M,N,D0,n);

D0 = 27;
n = 1;
[M2,N2] = size(img2);
H2 = imfreqfilter(filtertype,M2,N2,D0,n);

 G=H.*F; G2=H2.*F2;
figure; subplot(121), imshow(angle(G)); title('Filterred Phase')
        imgf=real(ifft2(ifftshift(double(G))))
        subplot(122), imshow(angle(G2)); title('Filterred Phase')
        imgf2=real(ifft2(ifftshift(double(G2))))
figure; subplot(121), imshow(imgf,[ ]); title('Filterred Image')
        subplot(122), imshow(imgf2,[ ]); title('Filterred Image')


