% OCR (Optical Character Recognition).
% Clear all
clc, close all 
% Read image
%imagen=imread('espace2.png');
image1=imread('M.bmp');
% Show image
imshow(image1);
title('Image user inputed (NOISE PRESSENT)');
% Convert to gray scale
if size(image1,3)==3 %RGB image
    image1=rgb2gray(image1);
end
% Convert to black and white but since the input image is already
% greythresh it is 
%threshold = graythresh(imagen);
%imagen =~imbinarize(imagen,threshold);

%Opens text.txt for writing recognized letter
ftext = fopen('text.txt', 'wt');
% Load templates
load templates;
global templates;
% Compute the number of letters in template file
num_letter=size(templates,2);
image1=imresize(image1,[42 24]);     
        % Call readletter to read character from imput image
        letter=read_letter(image1,num_letter);
        fprintf(ftext,'%s\n',letter);
   
 
fclose(ftext);
%Open 'text.txt' file
winopen('text.txt')
clear all