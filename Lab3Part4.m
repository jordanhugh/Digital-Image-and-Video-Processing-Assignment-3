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

%Quantise image
Q_step = 15;
pic = Q_step*round(pic/Q_step);

H_qhaar = zeros(5,1);
H_recon = zeros(5,1);
for i = 1 : 5
    
    %Calculate the Haar Transform
    newpic = calcHaar(pic, i);
    
    % Display transformed image in a figure window
    figure(i*2);
    imshow(newpic/255);
    colormap(gray(256));
    shg;
    
    % Calcalate entropy of transformed and quantised image
    H_qhaar(i,:) = calcEntropy(newpic);
    
    %Reconstruct image
    newpic = calcInvHaar(newpic, i);

    % Display original image in a figure window
    figure(i*2 + 1);
    imshow(newpic/255);
    colormap(gray(256));
    shg;
    
    H_recon(i,:) = calcEntropy(newpic);
end

