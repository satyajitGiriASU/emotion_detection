clc all;
clear all;
close all;

load happy_stge_vel_E_final_a.mat
mat1 = E_final;
class1 = a;
clear E_final a;

load sad_stge_vel_E_final_a.mat
mat2 = E_final;
class2 = a;
clear E_final a;

load surprise_stge_vel_E_final_a.mat
mat3 = E_final;
class3 = a;
clear E_final a;

Mat = [mat1;mat2;mat3];
class = [string(class1);string(class2);string(class3)];

t = templateSVM(’Standardize’,1,’KernelFunction’,’linear’);
Mdl = fitcecoc(Mat, class, ’Coding’,’onevsall’,’Learners’,t,’OptimizeHyperparameters’,’auto’,’ClassNames’,{’happy’,’sad’, ’surprise’},’HyperparameterOptimizationOptions’,struct(’AcquisitionFunctionName’,.’expected-improvement-plus’)
CVMdl = crossval(Mdl);
oosLoss = kfoldLoss(CVMdl)
resubLoss(Mdl)
save(’stge_vel015_model.mat’,’Mdl’,’CVMdl’,’oosLoss’)