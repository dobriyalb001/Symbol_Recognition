%%ocr test
%%model one of OCR
%this recognizes the text more accurately and efficiently than its 
%%predecessor

%OCR1 uses image preprocessing techniques to enhance the image quality
%and hence makes it easier for the OCR to recognize text


 clc
 clear all
 close all
 %reading the input image with noise
 image=imread('image.jfif'); 
 %opening a text file in write mode to enter the recognized string
 ftext = fopen('text.txt', 'wt');
 imshow(image);
 title('Original Image input by the user');
 
 %%running ocr on image without preprocessing
 %m=ocr(x);
 %fprintf(fid,'%s',m.Text);
 %disp(m.Text);
 %fclose(fid);
 %winopen('text.txt')
 
 
 figure;
 %converting the image to grayscale to remove noise
 image=rgb2gray(image);
 imshow(image); 
 title('image after grayscale');
 %%ocr on grayscaled image
 
 %m=ocr(x);
 %fprintf(fid,'%s',m.Text);
 %disp(m.Text);
 %fclose(fid);
 %winopen('text.txt')
 
 
 
 figure; 
 %binarizing grayscale image for further clearity
 image=imbinarize(image); 
 imshow(image);
 title('Binary Image'); 
 %%morphological closing-filling the gaps
 %inverting color of the image for further accurate morph operation
 image=imcomplement(image); 
 %to fill gaps use disk space structuring element with radius of 5 pixel
 closearea=strel('disk',5);
 image=imclose(image,closearea); 
 figure; 
 imshow(image);
 title('Image after applying Morphological Closing on grayscaled image');
 final=ocr(image);
 fprintf(ftext,'%s',final.Text);
 disp(final.Text);
 fclose(ftext);
 %Open 'text.txt' file
 winopen('text.txt')