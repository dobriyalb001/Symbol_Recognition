% OCR (Optical Character Recognition).
% Clear all
clc, close all 
% Read image
%imagen=imread('espace2.png');
imagen=imread('M.bmp');
% Show image
imshow(imagen);
title('INPUT IMAGE WITH NOISE');
% Convert to gray scale
if size(imagen,3)==3 %RGB image
    imagen=rgb2gray(imagen);
end
% Convert to black and white but since the input image is already
% greythresh it is 
%threshold = graythresh(imagen);
%imagen =~imbinarize(imagen,threshold);

%Opens text.txt for writing recognized letter
fid = fopen('text.txt', 'wt');
% Load templates
load templates;
global templates;
% Compute the number of letters in template file
num_letter=size(templates,2);
imagen=imresize(imagen,[42 24]);     
        % Call readletter to read character from imput image
        letter=read_letter(imagen,num_letter);
        fprintf(fid,'%s\n',letter);
   
 
fclose(fid);
%Open 'text.txt' file
winopen('text.txt')
clear all