% Clear the work space and close all open figure windows
clear; 
close all; 
clc;

% Read in the picture name
name = ('girlface.png');
name = ['/Users/hughj/Pictures/', name];

% Read in the picture data
pic = imread(name);
pic = double(pic);

% Display original image in a figure window
figure(1);
imshow(pic/255);
colormap(gray(256));
shg;

H_o = calcEntropy(pic);

Q_step = 15;
pic_qi = Q_step*round(pic/Q_step);

figure(2);
imshow(pic_qi/255);
colormap(gray(256));
shg;

H_qi = calcEntropy(pic_qi);

MSE = calcMSE(pic, pic_qi);
