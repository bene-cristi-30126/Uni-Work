im = imread('text2.png');
bw=imread('text.png');
template=bw(32:45,88:98);
if(ndims(im) == 3)
    im = rgb2gray(im);
end
if(ndims(template) == 3)
    template = rgb2gray(template);
end
figure; imshow(im),title('Image'),figure,imshow(template),title('Template')
c = normxcorr2(template,im);
figure,surf(c),shading flat
[max_c,imax] = max(c(:));
[ypeak,xpeak] = ind2sub(size(c),imax(1));
corr_offset = [(xpeak - size(template,2))
               (ypeak - size(template,1))];
xoffset = corr_offset(1);
yoffset = corr_offset(2);
xbegin = round(xoffset + 1);
xend = round(xoffset + size(template,2));
ybegin = round(yoffset + 1);
yend = round(yoffset + size(template,1));
recovered_template = uint8(zeros(size(im)));
recovered_template(ybegin:yend,xbegin:xend)=template;
figure, imshow(recovered_template)
[m,n] = size(im); mask = ones(m,n);
i = find(recovered_template == 0);
mask(i) = .5;
figure,imshow(im),title('Template overlayed on orginial image')
hold on
h = imshow(recovered_template);
set(h,'AlphaData',mask);