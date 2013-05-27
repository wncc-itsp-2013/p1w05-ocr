%TRAINING IMAGE SEGMENTATION AND ISOLATION

%This script will segment and isolate the characters from ocrfonts.png file
%and create individual bmp image files for all the characters in the order
%shown by the labels in the labelmatrix L.

%These image files will later be renamed as per the character shown in
%order to use them for OCR testing.

%Also the images have been resized to 19(maxx)X34(maxy) size
[stats,maxx,maxy,bw3,L] = boundbox();

for i=1:70
    subimage = imcrop(bw3,stats(i).BoundingBox);
    subimage = imresize(subimage,[maxy,maxx]);
    filename = sprintf('ocrfonts_images/label_%d.bmp',i);
    imwrite(subimage,filename,'bmp');
end