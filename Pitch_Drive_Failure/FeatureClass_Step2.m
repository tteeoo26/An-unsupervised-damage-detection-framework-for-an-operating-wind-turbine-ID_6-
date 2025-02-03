%% Feature plot and anomaly detection for Wedowind Challenge
% pitch Drive Failure-step 2
% Result of OC-SVM, Random Forest, Mahalanobis Distance (MD), and local outlier
% factor (LOF)
% 16.12.2024
% ramin.ghiasisangani@ucd.ie
%%
% First Run the FeatureEx_Step1 to extract the features
clc
clear all
close all
load('FeatureStruPitchD_v2.mat')
%%
% AllF.Pitchdrive=[featureTablePitchD.Aventa_Taggenberg_22_01_2022_V2;featureTablePitchD.Aventa_Taggenberg_23_01_2022_V2;featureTablePitchD.Aventa_Taggenberg_06_02_2022_V2;
%     featureTablePitchD.Aventa_Taggenberg_11_02_2022_V2;featureTablePitchD.Aventa_Taggenberg_14_02_2022_V2;featureTablePitchD.Aventa_Taggenberg_15_02_2022_V2;
%     featureTablePitchD.Aventa_Taggenberg_16_02_2022_V2;featureTablePitchD.Aventa_Taggenberg_25_02_2022_V2;featureTablePitchD.Aventa_Taggenberg_27_02_2022_V2];
%%
for i=1301:1302
figure
plot(AllF.Pitchdrive.(i))
xline(1,'-g',{'22\_01\_2022'})
xline(145,'-g',{'23\_01\_2022'})
xline(287,'-b',{'06\_02\_2022'})
xline(429,'-b',{'11\_02\_2022'})
xline(573,'-b',{'14\_02\_2022'})
xline(715,'-r',{'15\_02\_2022'})
xline(859,'-r',{'16\_02\_2022'})
xline(1001,'-k',{'25\_02\_2022'})
xline(1145,'-k',{'27\_02\_2022'})

xr2=xregion(289,720,FaceColor="b",EdgeColor=[0.4 0 0.7]);
xr3=xregion(721,1009,FaceColor="r",EdgeColor=[0.4 0 0.7]);
%
title([AllF.Pitchdrive.Properties.VariableNames(i),i])
%ylabel(i)
xlabel('sample')
%ylim([2.2 2.8])
end
%% select best features
SeF=[AllF.Pitchdrive.(379),AllF.Pitchdrive.(380),AllF.Pitchdrive.(381),AllF.Pitchdrive.(460),...
    AllF.Pitchdrive.(688),AllF.Pitchdrive.(775),AllF.Pitchdrive.(776),...
    AllF.Pitchdrive.(1201),AllF.Pitchdrive.(1251)];
SeFT=[AllF.Pitchdrive.Properties.VariableNames(379),AllF.Pitchdrive.Properties.VariableNames(380),AllF.Pitchdrive.Properties.VariableNames(381),AllF.Pitchdrive.Properties.VariableNames(460),...
    AllF.Pitchdrive.Properties.VariableNames(688),AllF.Pitchdrive.Properties.VariableNames(775),AllF.Pitchdrive.Properties.VariableNames(776),...
    AllF.Pitchdrive.Properties.VariableNames(1201),AllF.Pitchdrive.Properties.VariableNames(1251)];
%% create true label
TrueLabel = categorical([zeros(714,1);ones((1000-714),1);zeros(288,1)], [0,1], ["Normal","PitchD"]);
%% iforest: end date of train data: 14_02_2022_145
[forest,tf_forest,s_forest] = iforest(SeF(1:714,:),'ContaminationFraction',0.09);
[tfTest_forest,sTest_forest] = isanomaly(forest,SeF(715:end,:));
pred.IF = categorical(tfTest_forest, [1, 0], ["PitchD", "Normal"]);
figure;
CMatrixIF=confusionchart(TrueLabel(715:end),pred.IF);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with Isolation Forest';
%% plot damage index of isolation forest
figure
plot(sTest_forest)
yline(forest.ScoreThreshold)
xline((715-715),'-r',{'15\_02\_2022'})
xline((859-715),'-r',{'16\_02\_2022'})
xline((1001-715),'-k',{'25\_02\_2022'})
xline((1145-715),'-k',{'27\_02\_2022'})
title('iforest')
%
figure
plot(tfTest_forest)

%% iforest: end date of train data: 06_02_2022_145
[forest,tf_forest,s_forest] = iforest(SeF(1:428,:),'ContaminationFraction',0.09);
[tfTest_forest,sTest_forest] = isanomaly(forest,SeF(429:end,:));
pred.IF = categorical(tfTest_forest, [1, 0], ["PitchD", "Normal"]);
figure
plot(sTest_forest)
yline(forest.ScoreThreshold)
xline((429-429),'-b',{'11\_02\_2022'})
xline((573-429),'-b',{'14\_02\_2022'})
xline((715-429),'-r',{'15\_02\_2022'})
xline((859-429),'-r',{'16\_02\_2022'})
xline((1001-429),'-k',{'25\_02\_2022'})
xline((1145-429),'-k',{'27\_02\_2022'})
title('iforest\_06')
%% OCSVM
[Mdl,tf_OCSVM,s_OCSVM] = ocsvm(SeF(1:714,:),Standardize=true, ContaminationFraction=0.09);
[tfTest_OCSVM,sTest_OCSVM] = isanomaly(Mdl,SeF(715:end,:));

figure
plot(sTest_OCSVM)
yline(Mdl.ScoreThreshold)
xline((715-715),'-r',{'15\_02\_2022'})
xline((859-715),'-r',{'16\_02\_2022'})
xline((1001-715),'-k',{'25\_02\_2022'})
xline((1145-715),'-k',{'27\_02\_2022'})
title('OCSVM')
%% LOF
[LOFObj,tf_lof,s_lof] = lof(SeF(1:714,:),'ContaminationFraction',0.09);
[tfTest_lof,sTest_lof] = isanomaly(LOFObj,SeF(715:end,:));
figure
plot(sTest_lof)
yline(LOFObj.ScoreThreshold)
xline((715-715),'-r',{'15\_02\_2022'})
xline((859-715),'-r',{'16\_02\_2022'})
xline((1001-715),'-k',{'25\_02\_2022'})
xline((1145-715),'-k',{'27\_02\_2022'})
title('LOF')
%% Detect Anomalies with Mahalanobis Distance
[sigma,mu,s_mahal] = robustcov(SeF(1:714,:),OutlierFraction=0.09);
[TF_mahal,~,U_mahal] = isoutlier(s_mahal,Percentiles=[0 90]); %Determine the threshold corresponding to the 95th percentile


s_mahal_threshold = U_mahal;
sTest_mahal = pdist2(SeF(715:end,:),mu,"mahalanobis",sigma);
tfTest_mahal = sTest_mahal > s_mahal_threshold;
pred.MD = categorical(tfTest_mahal, [1, 0], ["PitchD", "Normal"]);

figure
plot(sTest_mahal)
yline(s_mahal_threshold)
xline((715-715),'-r',{'15\_02\_2022'})
xline((859-715),'-r',{'16\_02\_2022'})
xline((1001-715),'-k',{'25\_02\_2022'})
xline((1145-715),'-k',{'27\_02\_2022'})
title('MD')

figure;
CMatrixIF=confusionchart(TrueLabel(715:end),pred.MD);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with Mahalanobis Distance';

%% MD: end date of train data: 06_02_2022_145

[sigma,mu,s_mahal] = robustcov(SeF(1:428,:),OutlierFraction=0.09);
[TF_mahal,~,U_mahal] = isoutlier(s_mahal,Percentiles=[0 90]); %Determine the threshold corresponding to the 95th percentile


s_mahal_threshold = U_mahal;
sTest_mahal = pdist2(SeF(429:end,:),mu,"mahalanobis",sigma);
tfTest_mahal = sTest_mahal > s_mahal_threshold;
pred.MD = categorical(tfTest_mahal, [1, 0], ["PitchD", "Normal"]);


figure
plot(sTest_mahal)
yline(s_mahal_threshold)
xline((429-429),'-b',{'11\_02\_2022'})
xline((573-429),'-b',{'14\_02\_2022'})
xline((715-429),'-r',{'15\_02\_2022'})
xline((859-429),'-r',{'16\_02\_2022'})
xline((1001-429),'-k',{'25\_02\_2022'})
xline((1145-429),'-k',{'27\_02\_2022'})
title('MD\_06')
%% OCSVM: end date of train data: 06_02_2022_145
[Mdl,tf_OCSVM,s_OCSVM] = ocsvm(SeF(1:428,:),Standardize=true, ContaminationFraction=0.09);
[tfTest_OCSVM,sTest_OCSVM] = isanomaly(Mdl,SeF(429:end,:));

figure
plot(sTest_OCSVM)
yline(Mdl.ScoreThreshold)
xline((429-429),'-b',{'11\_02\_2022'})
xline((573-429),'-b',{'14\_02\_2022'})
xline((715-429),'-r',{'15\_02\_2022'})
xline((859-429),'-r',{'16\_02\_2022'})
xline((1001-429),'-k',{'25\_02\_2022'})
xline((1145-429),'-k',{'27\_02\_2022'})
title('OSCVM\_06')
%% LOF:end date of train data: 06_02_2022_145
[LOFObj,tf_lof,s_lof] = lof(SeF(1:428,:),'ContaminationFraction',0.09);
[tfTest_lof,sTest_lof] = isanomaly(LOFObj,SeF(429:end,:));

figure
plot(sTest_lof)
yline(LOFObj.ScoreThreshold)
xline((429-429),'-b',{'11\_02\_2022'})
xline((573-429),'-b',{'14\_02\_2022'})
xline((715-429),'-r',{'15\_02\_2022'})
xline((859-429),'-r',{'16\_02\_2022'})
xline((1001-429),'-k',{'25\_02\_2022'})
xline((1145-429),'-k',{'27\_02\_2022'})
title('LOF\_06')
%% Detect Anomalies with One-Class SVM
mdlSVM = fitcsvm(SeF(1:714,:),TrueLabel(1:714), 'Standardize', true, 'OutlierFraction', 0.00);
[~,scoreSVM] = predict(mdlSVM,SeF(715:end,:));
isanomalySVM = scoreSVM<0;

figure
plot(scoreSVM)
yline(0)
xline((715-715),'-r',{'15\_02\_2022'})
xline((859-715),'-r',{'16\_02\_2022'})
xline((1001-715),'-k',{'25\_02\_2022'})
xline((1145-715),'-k',{'27\_02\_2022'})
title('OCSVMv2')
%%
mdlSVM = fitcsvm(SeF(1:428,:),TrueLabel(1:428), 'Standardize', true, 'OutlierFraction', 0.00);
[~,scoreSVM] = predict(mdlSVM,SeF(429:end,:));
isanomalySVM = scoreSVM<0;

figure
plot(scoreSVM)
yline(0)
xline((429-429),'-b',{'11\_02\_2022'})
xline((573-429),'-b',{'14\_02\_2022'})
xline((715-429),'-r',{'15\_02\_2022'})
xline((859-429),'-r',{'16\_02\_2022'})
xline((1001-429),'-k',{'25\_02\_2022'})
xline((1145-429),'-k',{'27\_02\_2022'})
title('OCSVMv2\_06')