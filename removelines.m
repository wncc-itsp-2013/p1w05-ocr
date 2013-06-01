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

%%%%%%%%%%%%%%%%%%%% FUNCTION DOCUMENTATION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%imread function reads an image and returns a 2/3 dimensional
%matrix(depending on image type) containing the pixel values of the image

%mat2gray function converts a given image matrix into a grayscale image
%matrix.

%im2bw function takes in the image matrix and the threshold value as the
%input and returns a binarized image in which pixels are either 1 or 0. The
%basic principle behind thresholding is to assign the pixel value 1 to all
%pixels above a certain threshold value and assign the rest as zero.

%graythresh function uses Otsu's global thresholding method to calculate a
%threshold value for a given grayscale matrix. This method chooses a
%threshold so as to minimize the intraclass variance of the binarized
%pixels

%strel function is used to create a morphological structuring element which
%can be used in dilation and erosion of an image. The syntax which is used
%here is strel(shape,parameters), where shape is the specified shape of the
%structuring element and the parameters are defined as per the shape
%selected. eg. for a rectangle, parameters will be height and width, for a
%disk it will be radius etc.

%imerode function takes the image matrix and the structural element as the
%input and performs binary/grayscale erosion depending on the image matrix.
%This can be particularly useful in removing lines and specks as we can
%take a flat structural element which is just thicker than the lines and
%dots and perform an erosion. This will remove the lines and dots

%imdilate function is the opposite of imerode and takes in similar inputs
%and also performs binary/grayscale dilation depending on the image matrix.
%As erosion erodes the image by the structural element, imdilate expands it
%according to the structural element. This is used to restore characters to
%their original sizes after removing the lines and dots by using imerode