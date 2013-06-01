%This function is a continuation of the removelines function. In addition
%to removing lines and dots, this function segments and isolates all the
%characters in the ocrfonts.png file and creates a stats structure which
%will help in getting bounding boxes and these in turn will help in
%generating independent images of all characters for model estimation in
%OCR.

%Run this function in following manner to get all 5 outputs, otherwise it
%will only give the first output as the function output
%[stats,maxx,maxy,bw3,L] = boundbox();
function [stats,maxx,maxy,bw3,L] = boundbox()
    %This part is almost the same as removelines function
    img = imread('ocrfonts.png');
    I = mat2gray(img);
    bw = im2bw(I,graythresh(I));
    se = strel('rectangle',[2,2]);
    bw2 = imerode(bw,se);
    bw3 = imdilate(bw2,se);
    
    %The new part starts here
    
    %This is for labeling components which are disconnected such as i,j etc
    %What this step does is that it expands the image boundaries by 5 pixel
    %so that the components are no longer disconnected
    bw4 = bwdist(bw3) <=5;
    %This creates the labelmatrix for the above image
    L = labelmatrix(bwconncomp(bw4));
    %This will create a labelmatrix such that the background pixels replace
    %the expanded pixels in bw4 and so there is a single label for
    %disconnected components of i,j etc.
    L(~bw3)=0;
    
    %This creates a structure named stats containing properties such as
    %pixel area and bounding box parameter for all labeled entitites
    %Bounding box is of the form [ulcorner width]
    %ulcorner is of form [x y]:co-ordinates of upper-left corner
    %width is of the form [xwidth ywidth]
    stats = regionprops(L,'Area','BoundingBox');
    maxx = 0;
    maxy = 0;
    
    %This loop is for finding the maximum Bounding Box dimensions which
    %will be used to generate rescaled images of all characters, which will
    %have the same size for all characters
    for i=1:70
        if stats(i).BoundingBox(3) > maxx
            maxx = stats(i).BoundingBox(3);
        end
        if stats(i).BoundingBox(4) > maxy
            maxy = stats(i).BoundingBox(4);
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%% FUNCTION DOCUMENTATION %%%%%%%%%%%%%%%%%%%%%%%%%%

%Boundbox function returns the variables 'stats','maxx','maxy','bw3','L'
%from the image 'ocrfonts.png'.

%imread, mat2gray, strel, imerode imdilate have been explained in
%'removelines.m'

%bwdist function computes the Euclidean distance transform of a binarized
%image which it takes as input. For each pixel in input image, the distance
%transform assigns a number that is the distance between that pixel and the
%nearest nonzero pixel(nearest white element in this case). In this file,
%it is used to connect the disconnected elements such as i,j etc by
%approximating a distance 5 and returns the image bw4.

%bwconncomp function takes in a binarized image as input and returns the
%connected components found in the input image.

%labelmatrix function takes in the Connected Component output of the
%bwconncomp function and returns a labeled matrix wherein each of the
%connected component is assigned a label number. The elements of the
%labelmatrix are integer values starting from 0 for the background pixels
%and 1,2,3,.. and so on for each pixel in a connected component. i.e, all
%the pixel in a connected component are assigned the same integer value.

%regionprops function calculated the specified properties of all the
%connected components in an image. In this file, the syntax used is
%regionprops(L,properties) and we get a structure called stats as the
%output. Some examples of properties for the connected components are
%'Area','BoundingBox',Perimeter' etc. The Boundbox property has been
%explained in the code.

%Summarizing the outputs of boundbox function
%stats is the structure containing the properties of the connected
%components of the binarized image.
%maxx and maxy are the maximum width and height respectively among all the
%BoundingBox dimensions.
%bw3 is the binarized image obtained after removing the lines and specks.
%L is the label matrix corresponding to the image bw3.