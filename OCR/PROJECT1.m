%%this is the basic ocr in which we are just using the trained
%%ocr to perform image recognition and not using preprocessing 
%%techniques
clc
 clear all
 close all
 image1=imread('image.jfif'); 
 imshow(image1);
 title('Original Image without preprocessing');
%%ditreclty applying OCR
 final=ocr(image1);
 ftext = fopen('text.txt', 'wt');
 fprintf(ftext,'%s',final.Text);
 disp(final.Text);
 fclose(ftext);
 %Open 'text.txt' file
 winopen('text.txt')
 
 %%genereates the output image which is wrong and hence the efficeiency 
 %%of the model decreases 
 %%limited only to clear images with minimal amount of noise