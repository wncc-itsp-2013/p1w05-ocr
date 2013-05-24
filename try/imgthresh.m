function imgout = imgthresh(img)
    img = imread('Archive-OCR-1.jpg');
    img1 = rgb2gray(img);
    level = graythresh(img1);
    imgout = im2bw(img1,level);
    imshow(imgout);
end