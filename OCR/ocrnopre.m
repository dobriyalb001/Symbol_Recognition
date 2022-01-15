%%this is the basic ocr in which we are just using the trained
%%ocr to perform image recognition and not using preprocessing 
%%techniques
clc
 clear all
 close all
 x=imread('image.jfif'); 
 imshow(x);
 title('Original Image without preprocessing');
%%ditreclty applying OCR
 m=ocr(x);
 fid = fopen('text.txt', 'wt');
 fprintf(fid,'%s',m.Text);
 disp(m.Text);
 fclose(fid);
 %Open 'text.txt' file
 winopen('text.txt')
 
 %%genereates the output image which is wrong and hence the efficeiency 
 %%of the model decreases 
 %%limited only to clear images with minimal amount of noise