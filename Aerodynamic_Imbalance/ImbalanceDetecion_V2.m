%% Aerodynamic-Imbalance Detection _Wedowind+Just healthy data from normal Data
% ramin.ghiasisangani@ucd.ie
% 18.12.2024
clc
%clear all
close all
%% Select Data
% To create ALLdata.mat run LoadData_Imbalance.m and LoadData_Normal.m or run below
% load
%load('ALLData.mat')
All.NormalImbalance2.mean=[All.Normal.mean(:,:);All.Imbalance.mean(70:end,:)];
%% select data for ML model
Data=cell2mat(table2array(All.NormalImbalance2.mean(:,[19:25,33]))); %19:25+wind speed
%% plot features
for i= 1:size(Data,2)
figure
plot(Data(:,i))
xline(484,'r',{'Imbalance'})
xline((916),'-b',{'23\_12\_2022'})
xline((1060),'-b',{'29\_12\_2022'})
xline((1204),'-b',{'4\_1\_2023'})
xline((1236),'-b',{'15\_1\_2023'})
xline((1380),'-b',{'21\_1\_2023'})
yline(mean(Data(1:300,i)))
ylabel('Mean')
xlabel('sample')
title([All.NormalImbalance2.mean.Properties.VariableNames(i+1),i])
end

%% Detect Anomalies with Isolation Forest
[forest,tf_forest,s_forest] = iforest(Data(1:300,:),'ContaminationFraction',0.09);

[tfTest_forest,sTest_forest] = isanomaly(forest,Data(301:end,:));
%% plot damage index: iForest
figure
plot(sTest_forest)
xline(184,'r',{'Imbalance'})
xline((916-300),'-b',{'23\_12\_2022'})
xline((1060-300),'-b',{'29\_12\_2022'})
xline((1204-300),'-b',{'4\_1\_2023'})
xline((1236-300),'-b',{'15\_1\_2023'})
xline((1380-300),'-b',{'21\_1\_2023'})
yline(forest.ScoreThreshold,'k',{'Threshold'})
title('iForest')
xlabel('Sample')
ylabel('Damage Index: Output of iForest')
%% plot confusion matrix: iForest
TrueLabel = categorical([zeros(483,1);ones((1523-483),1)], [0, 1], ["Normal","Imbalance"]);
pred.IF = categorical(tfTest_forest, [1, 0], ["Imbalance", "Normal"]);
figure;
CMatrixIF=confusionchart(TrueLabel(301:end),pred.IF);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with Isolation Forest';
%% Detect Anomalies with OCSVM
[Mdl,tf_OCSVM,s_OCSVM] = ocsvm(Data(1:300,:),Standardize=true, ContaminationFraction=0.09);
[tfTest_OCSVM,sTest_OCSVM] = isanomaly(Mdl,Data(301:end,:));
%% plot damage index: OCSVM
figure
plot(sTest_OCSVM)
yline(Mdl.ScoreThreshold)
xline(184,'r',{'Imbalance'})
xline((916-300),'-b',{'23\_12\_2022'})
xline((1060-300),'-b',{'29\_12\_2022'})
xline((1204-300),'-b',{'4\_1\_2023'})
xline((1236-300),'-b',{'15\_1\_2023'})
xline((1380-300),'-b',{'21\_1\_2023'})
title('OCSVM')
%% Detect Anomalies with Local Outlier Factor

[LOFObj,tf_lof,s_lof] = lof(Data(1:300,:),'ContaminationFraction',0.09);
[tfTest_lof,sTest_lof] = isanomaly(LOFObj,Data(301:end,:));

%% plot damage index: LOF
figure
plot(sTest_lof)
xline(184,'r',{'Imbalance'})
xline((916-300),'-b',{'23\_12\_2022'})
xline((1060-300),'-b',{'29\_12\_2022'})
xline((1204-300),'-b',{'4\_1\_2023'})
xline((1236-300),'-b',{'15\_1\_2023'})
xline((1380-300),'-b',{'21\_1\_2023'})
yline(LOFObj.ScoreThreshold)
title('LOF')
%% Detect Anomalies with Mahalanobis Distance
[sigma,mu,s_mahal] = robustcov(Data(1:300,:),OutlierFraction=0.0);
[TF_mahal,~,U_mahal] = isoutlier(s_mahal,Percentiles=[0 90]); %Determine the threshold corresponding to the 95th percentile
sTest_mahal = pdist2(Data(301:end,:),mu,"mahalanobis",sigma);

%% plot damage index: MD
figure
plot(sTest_mahal)
xline(184,'r',{'Imbalance'})
yline(U_mahal)
xline((916-300),'-b',{'23\_12\_2022'})
xline((1060-300),'-b',{'29\_12\_2022'})
xline((1204-300),'-b',{'4\_1\_2023'})
xline((1236-300),'-b',{'15\_1\_2023'})
xline((1380-300),'-b',{'21\_1\_2023'})
title('MD')

tfTest_mahal = sTest_mahal > U_mahal;
pred.MD = categorical(tfTest_mahal, [1, 0], ["Imbalance", "Normal"]);
%%  plot confusion matrix: MD
figure;
CMatrixIF=confusionchart(TrueLabel(301:end),pred.MD);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with MD';
%% Detect Anomalies with DBSCAN
IdTrainEnd=300; %428
train_data = Data(1:IdTrainEnd,:);

% Create test data with multiple classes (+1, +2, +3)
test_data = Data(IdTrainEnd+1:end,:);
epsilon = 1.0; % The maximum distance to consider two points as part of the same cluster %1
minPts = 5;   % Minimum number of points in a cluster
positive_samples = train_data;

% Identify core points and cluster labels based on training data
[cluster_labels, corepts] = dbscan(positive_samples, epsilon, minPts);
distances = pdist2(test_data, positive_samples(corepts, :));
%% plot damage index: DBSCAN
figure
plot(distances(:,1))
xline(184,'r',{'Imbalance'})
xline((916-300),'-b',{'23\_12\_2022'})
xline((1060-300),'-b',{'29\_12\_2022'})
xline((1204-300),'-b',{'4\_1\_2023'})
xline((1236-300),'-b',{'15\_1\_2023'})
xline((1380-300),'-b',{'21\_1\_2023'})
title('DBSCAN')




