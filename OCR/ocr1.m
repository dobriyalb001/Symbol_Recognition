%%model one of OCR
%this recognizes the text more accurately and efficiently than its 
%%predecessor

%OCR1 uses image preprocessing techniques to enhance the image quality
%and hence makes it easier for the OCR to recognize text
clc
 clear all
 close all
 %reading the input image with noise
 x=imread('image.jfif'); 
 %opening a text file in write mode to enter the recognized string
 fid = fopen('text.txt', 'wt');
 imshow(x);
 title('Original Image');
 %figure creates new window so that we can compare the changes
 figure;
 %converting the image to grayscale to remove noise
 x=rgb2gray(x);
 imshow(x); 
 title('Grayscale Image');
 figure; 
 %binarizing grayscale image for further clearity
 x=imbinarize(x); 
 imshow(x);
 title('Binary Image'); 
 
 
 %%morphological closing-filling the gaps
 %inverting color of the image for further accurate morph operation
 x=imcomplement(x); 
 %to fill gaps use disk space structuring element with radius of 5 pixel
 g=strel('disk',5);
 %closing the image
 x=imclose(x,g); 
 figure; 
 imshow(x);
 title('Image after applying Morphological Closing');
 
 %%image is preprocessed and has the least amount of noise present 
 %OCR is executed
 m=ocr(x); 
 fprintf(fid,'%s',m.Text);
 disp(m.Text);
 fclose(fid);
 %Open 'text.txt' file
 winopen('text.txt')