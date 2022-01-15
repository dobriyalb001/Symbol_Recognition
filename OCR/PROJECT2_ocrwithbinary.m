%%model one of OCR
%this recognizes the text more accurately and efficiently than its 
%%predecessor

%OCR1 uses image preprocessing techniques to enhance the image quality
%and hence makes it easier for the OCR to recognize text
clc
 clear all
 close all
 %reading the input image with noise
 %image1=imread('image.jfif'); 
 image1=imread('captcha11.jpg'); 
 %opening a text file in write mode to enter the recognized string
 ftext = fopen('text.txt', 'wt');
 imshow(image1);
 title('Original Image input by the user');
 %figure creates new window so that we can compare the changes
 figure;
 %converting the image to grayscale to remove noise
 image1=rgb2gray(image1);
 imshow(image1); 
 title('Image after applying grayscale feature');
 figure; 
 %binarizing grayscale image for further clearity
 image1=imbinarize(image1); 
 imshow(image1);
 title('Image after binarizing the original'); 
 
 
 %%morphological closing-filling the gaps
 
 %inverting color of the image for further accurate morph operation
 image1=imcomplement(image1); 
 %to fill gaps use disk space structuring element with radius of 5 pixel
 %reduced pixel radius to identify various images accordingly
 g=strel('disk',1);
 %closing the image
 image1=imclose(image1,g); 
 figure; 
 imshow(image1);
 title('final Image after applying Morphological Closing');
 
 %%image is preprocessed and has the least amount of noise present 
 %OCR is executed
 final=ocr(image1); 
 fprintf(ftext,'%s',final.Text);
 disp(final.Text);
 fclose(ftext);
 %Open 'text.txt' file
 winopen('text.txt')