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

Q_step = 15;
pic_qhaar = Q_step*round(pic/Q_step);
pic_qhaar = calcHaarLevel1(pic_qhaar);
H_qhaar = calcEntropy(pic_qhaar);

% Display transformed and quantised image in a figure window
figure(2);
imshow(pic_qhaar/255);
colormap(gray(256));
shg;

Q_step = 15/2;
pic_qhaar1 = Q_step*round(pic/Q_step);
pic_qhaar1 = calcHaarLevel1(pic_qhaar1);

Q_step = Q_step * 2;
pic_qhaar2 = Q_step*round(pic/Q_step);
pic_qhaar2 = calcHaarLevel1(pic_qhaar2);

Q_step = Q_step * 2;
pic_qhaar3 = Q_step*round(pic/Q_step);
pic_qhaar3 = calcHaarLevel1(pic_qhaar3);

pic_recon1 = calcInvHaar(pic_qhaar1, 1);
pic_recon2 = calcInvHaar(pic_qhaar2, 1);
pic_recon3 = calcInvHaar(pic_qhaar3, 1);

figure(3);
imshow(pic_recon1/255);
colormap(gray(256));
shg;

figure(4);
imshow(pic_recon2/255);
colormap(gray(256));
shg;

figure(5);
imshow(pic_recon3/255);
colormap(gray(256));
shg;

H_qhaar1 = calcEntropy(pic_qhaar1);
H_qhaar2 = calcEntropy(pic_qhaar2);
H_qhaar3 = calcEntropy(pic_qhaar3);

MSE_qhaar1 = calcMSE(pic, pic_recon1);
MSE_qhaar2 = calcMSE(pic, pic_recon2);
MSE_qhaar3 = calcMSE(pic, pic_recon3);

Q_step = 15/2;
pic_qi1 = Q_step*round(pic/Q_step);

Q_step = Q_step*2;
pic_qi2 = Q_step*round(pic/Q_step);

Q_step = Q_step*2;
pic_qi3 = Q_step*round(pic/Q_step);

H_qi1 = calcEntropy(pic_qi1);
H_qi2 = calcEntropy(pic_qi2);
H_qi3 = calcEntropy(pic_qi3);

MSE_qi1 = calcMSE(pic, pic_qi1);
MSE_qi2 = calcMSE(pic, pic_qi2);
MSE_qi3 = calcMSE(pic, pic_qi3);