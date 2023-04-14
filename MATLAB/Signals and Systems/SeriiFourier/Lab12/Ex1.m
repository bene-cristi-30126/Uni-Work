img = imread('peppers.png');
if (ndims(img)==3) img = rgb2gray(img); end
F = fftshift(fft2(double(img)));
figure, imshow(img); title('Imagine initiala')

%filtrare si afisare
Af=imfilter(img,[0 1 2; -1 0 1; -2 -1 0],'conv','circular')
figure, imagesc(Af), colormap gray; title('Imagine filtrata')

V= fspecial('prewitt')
vertical = imfilter(img,V,'replicate');
figure, imshow(vertical);title('Vertical Detection Image');

figure, subplot (211), freqz2(Af,size(img));
        subplot(212), freqz2(V,size(img));
