% Clear the work space and close all open figure windows
clear; 
close all; 
clc;

symbols = 1:6;
p = [5/8 3/32 3/32 1/32 1/8 1/32];

h = -p .* log2(p);
h=(h(~isnan(h)));
entropy = sum(h);

[dict, avglen] = huffmandict(symbols, p);

% % Read in the picture name
% name = ('girlface.png');
% name = ['/Users/hughj/Pictures/', name];
% 
% % Read in the picture data
% pic = imread(name);
% pic =im2double(pic);
% 
% % Display original image in a figure window
% figure(1);
% imshow(pic);
% colormap(gray(256));
% shg;
% 
% entropy = entropy(pic);
% 
% symbols = 1:255;
% 
% p = histcounts(255*pic, (0:255));
% p = p/sum(p);
% 
% [dict, avglen] = huffmandict(symbols, p);