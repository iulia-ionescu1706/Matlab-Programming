clear; clc;
%% =========== Description ====================
% features = n x m feature matrix where n is the number of img and m is the
%            dimension of the feature vector of one img
% labels = is the label vector; Semnification: 1- open eye; -1 - eye closed
% * The data base used gray images of 24x24 pixel.
%% ============ Training Step =====================
%Load data to workspace. 
%This data base contains 2 variables: features and labels
load('eye_data_lab4');

features =[features, ones(100,1)];
%Finding the classifier by rezolving the CMMP problem 
classifier = features\labels; % replace it with the function write in lab

%% ============ Testing Step ======================
%Read the image
testImg = imread('closed_eye_test1_lab4.jpg');% replace the name of the img
                                                    % with another image
%Pre-process step    
%testImgMat = imbinarize(testImg);
level=graythresh(testImg)
testImgMat=im2bw(testImg,level)

%Extract the feature vector from the image
%Default values for the paramters of the function:
% BlockSize =[2 2], CellSize = [8 8], BlockOverlap = 1  and NumBins =9
testFeatures = extractHOGFeatures(testImgMat);
%Test the image   
test_label = testFeatures * classifier(1:end-1) + classifier(end)
% Display image to check result    
imshow('open_eye_test4_lab4.jpg')% replace the name of the img
                                                    % with another image