%% Icing Detection _Wedowind
% ramin.ghiasisangani@ucd.ie
% 29.05.2024
% updatad: 23.12.2024 remove common samples in icing and normal dataset
%% Load data
clc
%clear all
close all
%% Select Data
% To create ALLdata.mat run LoadData_IceD.m and LoadData_Normal.m or run below
% load
%load('ALLData.mat')
All.NormalIcing.mean=[table2array(All.Normal.mean(:,2:36));table2array(All.Icing.mean(70:end,2:36))];
%Data=cell2mat(All.NormalIcing.mean(:,[3,12,14,17,20,21,22,23,24]));
Data=cell2mat(All.NormalIcing.mean(:,[19,20,21,22,23,24,25])); %same as ImbalanceDetection v2 without windspeed

TrueLabel = categorical([zeros(483,1);ones(414,1)], [1, 0], ["Rotor_Icing", "Normal"]);
%% Detect Anomalies with Isolation Forest
[forest,tf_forest,s_forest] = iforest(Data(1:300,:),'ContaminationFraction',0.01);

[tfTest_forest,sTest_forest] = isanomaly(forest,Data(301:end,:));
pred.IF = categorical(tfTest_forest, [1, 0], ["Rotor_Icing", "Normal"]);

%% Plot confusion matrix: iForest
figure;
CMatrixIF=confusionchart(TrueLabel(301:end),pred.IF);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with Isolation Forest';
%% plot damage index: iForest
figure;
plot(sTest_forest)
xline(184,'-r',{'Icing'})
yline(forest.ScoreThreshold,'k',{'Threshold'})
xlabel('Sample')
ylabel('Damage Index: Output of iForest')
%% Plot confusion matrix_V2: iForest
figure
plotconfusion(TrueLabel(301:end),pred.IF)
title(['Isolation Forest']);
fontname('Times New Roman'); fontsize(15,"points");
