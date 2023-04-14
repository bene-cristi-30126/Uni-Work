t=-1:0.1:1;
x_t = @(t) (abs(t))

deltat = 0.1;
k = -10: 1 : 10;
x_k = @(k) (x_t(deltat*k));
y_k = @(k) (x_k(k)).*(k >= -4);

n=-10:10;
d = @(n)(n==0); 
u=@(n) (n>=0);
x=  -d(n+1) + d(n) - d(n-1);

X = fft(x);
Y = fft(y_k(k));
z = X.*Y;
Z = ifft(z);

subplot(311), stem(n, x);
subplot(312), stem(k, y_k(k));
subplot(313), stem(Z);





img = imread('peppers.png');
if (ndims(img)==3) img = rgb2gray(img); end
F = fftshift(fft2(double(img)));
figure; imshow(img);

filtertype = 'GHPF';
D0 = 29;
n = 1;
[M,N] = size(img);
 H = imfreqfilter(filtertype,M,N,D0,n);
 G=H.*F;
imgf=real(ifft2(ifftshift(double(G))));
figure; imshow(imgf,[ ]); title('Filterred Image')