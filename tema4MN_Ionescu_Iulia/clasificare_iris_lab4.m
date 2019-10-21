clear; clc;
%% =========== Description ========================
% trainingIris - matrix of dim nxm where n is the number of measurement of
%                the petals and sepals and m is the dimension of this
%                measurements
% trainingLabel - vector of dim nx1 that contains the labels; 
%                 Semnification: 1- Iris Setosa; 2- Iris Versicolor
% testIris, testLabel are the data for testing the classifier.
% 
%% ============ Training Step =====================
%Load data to workspace. 
load('Iris_data_lab4');
ell =4;
features =[trainingIris, ones(50,1)];

%Finding the classifier by rezolving the CMMP problem 
classifier = features\trainingLabel; % replace it with the function write in lab
cp=classifier(1:ell);
dp=classifier(ell+1);
V=transpose(trainingIris);
size=size(trainingIris);
sizeN=size(1);
matrice_confuzie = zeros(2,1);%matricea de confuzie este un vector coloana pentru ca avem un singur vector
for i = 1 : sizeN        
  if sign(cp'*V(:,i) + dp) == 1
    matrice_confuzie(1,1) = matrice_confuzie(1,1) + 1;
  else
    matrice_confuzie(2,1) = matrice_confuzie(2,1) + 1;
  end

end
matrice_confuzie
%% ============ Testing Step ======================
test_label = testIris * classifier(1:end-1) + classifier(end);
%Determing the class label by looking at the most closed label
for i = 1:50
    if test_label(i) > 1.5
        predictedL(i,1) = 2;
    else
        predictedL(i,1) =1;
    end
end
% Testing how manny prediction were wrong
error = sum(predictedL ~= testLabel)