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