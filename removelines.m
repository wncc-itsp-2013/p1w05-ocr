%This function removes thin lines and specks from the test image and also
%converts it to a binarized image
function imgout = removelines(img);
    %Reading image from file
    img = imread('ocrfonts.png');
    
    %Conversion to grayscale
    I = mat2gray(img);
    
    %Thresholding
    bw = im2bw(I,graythresh(I));
    
    %Defining structural element for erosion/dilation
    se = strel('rectangle',[2,2]);
    
    %Erosion for removing lines and specks
    bw2 = imerode(bw,se);
    
    %Dilation for restoring the characters to their original size
    imout = imdilate(bw2,se);
    imshow(imout);
    winopen('ocrfonts.png');
end