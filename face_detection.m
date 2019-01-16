%Matlab Code for Viola Jones
clc;
clear all;
close all;

faceDetector = vision.CascadeObjectDetector;
% Detect faces.
%Path for where you want to save the cropped image.
file1 = 'E:\cohn-kanade-images\S100\happy_new\’;

%Path to access the original image
srcFiles = dir(’E:\cohn-kanade-images\S100\happy\*.png’);
for i = 1 : length(srcFiles)
	filename = strcat(’E:\cohn-kanade-images\S100\happy\’,srcFiles(i).name);
	I = imread(filename);
	bboxes = step(faceDetector, I);
	I = I’;
	im_new = I(bboxes(1):(bboxes(1)+bboxes(3)), bboxes(2):(bboxes(2)+bboxes(4)));
	im_new2 = imresize(im_new,[96 96]);
	%Note that you have to create a folder 00x_new inside 00x. Otherwise
	%you can simply save it as it is. x=1,2...6.
	new_name = strcat(file1, num2str(i), ’.png’);
	imwrite(im_new2’, new_name);
	%figure, imshow(im_new2’);
end