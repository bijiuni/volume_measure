img = abs(sos(ifft2c(ReorderData1(:,:,:,6)),3));
img_c = img;
for n= 1:11
z= n*1.5*2-3;
str=sprintf('z = %0.5gmm',z);
figure,imagesc([0 32],[0 32],abs(sos(ifft2c(ReorderData1(:,:,:,n)),3))),colormap(gray),title(str),xlabel('mm'), ylabel('mm');axis equal;
z= n*1.5*2-1.5;
str=sprintf('z = %0.5gmm',z);
figure,imagesc([0 32],[0 32],abs(sos(ifft2c(ReorderData1(:,:,:,n+12)),3))),colormap(gray),title(str),xlabel('mm'), ylabel('mm');axis equal;
end



img_c= abs(sos(ifft2c(ReorderData1(:,:,:,1)),3));
figure, imagesc(img_c), title('original image'),colormap(gray);
[~, threshold] = edge(img_c, 'sobel');
fudgeFactor = 0.6;
BWs = edge(img_c,'sobel', threshold * fudgeFactor);
figure, imshow(BWs), title('binary gradient mask');
se90 = strel('line', 6, 90);
se0 = strel('line', 6, 0);
BWsdil = imdilate(BWs, [se90 se0]);
figure, imshow(BWsdil), title('dilated gradient mask');
BWdfill = imfill(BWsdil);
% double click area to be filled
figure, imshow(BWdfill);
title('binary image with filled holes');
seD = strel('diamond',1);
BWFinal = imerode(BWdfill,seD);
BWFinal = imerode(BWFinal,seD);
figure, imshow(BWFinal);
title('final segmented image');
label=bwlabel(BWFinal);
stats = regionprops(label);
areas = [stats.Area];
[maxArea index] = max(areas);
figure, imshow(label==index);
maxArea