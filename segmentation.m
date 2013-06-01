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

%%%%%%%%%%%%%%%%%%%%%%% FUNCTION DOCUMENTATION %%%%%%%%%%%%%%%%%%%%%%%%%%%

%This code is a follow up on the boundbox.m file and uses the output
%obtained from boundbox.m to segment the image 'ocrfonts.png'
%maxx and maxy were found out to be 19 and 34 respectively and there were
%70 components in total. 26+26(alphabets) + 10 digits + 8 special
%characters.

%imcrop function is used to crop an image matrix according to the input
%parameters. The syntax used here is imcrop(image,map) where bw3 is the
%image to be cropped and map is the dimensions and co-ordinates of the
%bounding box.

%imresize takes in an image matrix and resized dimensions as input and
%returns the resized image. Here all segmented images are resized to 19X34

%sprintf is used to name the files of imdividual images segmented from the
%original image and its syntax is similar to other common programming
%languages such as C++ etc.

%imwrite is used to write an image matrix to a file and the syntax used
%here is imwrite(image,filename,'file type).