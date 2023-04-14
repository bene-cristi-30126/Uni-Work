img = imread('peppers.png');
if (ndims(img)==3) img = rgb2gray(img); end
F = fftshift(fft2(double(img)));
figure; imshow(img);
figure; imshow(log(abs(F)),[]); title('Magnitude')
figure; imshow(angle(F)); title('Phase')
filtertype = 'LPF';
D0 = 27;
n = 1;
[M,N] = size(img);
 H = imfreqfilter(filtertype,M,N,D0,n);
 figure;
 surf(H), title(filtertype);
 G=H.*F;
figure; imshow(log(abs(G)),[]); title('Filterred Magnitude')
figure; imshow(angle(G)); title('Filterred Phase')
imgf=real(ifft2(ifftshift(double(G))));
figure; imshow(imgf,[ ]); title('Filterred Image')