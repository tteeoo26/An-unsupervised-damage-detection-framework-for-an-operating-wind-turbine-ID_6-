%% Anomaly detection for WedoWind Challenge Using DBSCAN+Kmeans
% Pitch Drive Failure_step 3
% 17.12.2024
% ramin.ghiasisangani@ucd.ie
close all
% first Run FeatureClass_Step2.m
%% Create training data (class +1) with some anomalies
% SeF=[AllF.Pitchdrive.(70),AllF.Pitchdrive.(61),AllF.Pitchdrive.(62),AllF.Pitchdrive.(83),...
%     AllF.Pitchdrive.(64),AllF.Pitchdrive.(85),AllF.Pitchdrive.(86),...
%     AllF.Pitchdrive.(77),AllF.Pitchdrive.(78)]; %random Featureset
%SeFTS=AllF.Pitchdrive(:,1247:1259);
%SeF=table2array(SeFTS);
%% Select the sensor
SeF(:,4:8)=[]; % Just 'MSB_ACC_XX_01'
IdTrainEnd=428; %428
train_data = SeF(1:IdTrainEnd,:);
%% Create DBSCAN Model
% Create test data with multiple classes (+1, +2, +3)
test_data = SeF(IdTrainEnd+1:end,:);

% Training phase: Perform DBSCAN clustering on the training data (class +1)
epsilon = 1.0; % The maximum distance to consider two points as part of the same cluster %1
minPts = 5;   % Minimum number of points in a cluster

% Identify the training data with label +1
positive_samples = train_data;

% Identify core points and cluster labels based on training data
[cluster_labels, corepts] = dbscan(positive_samples, epsilon, minPts);

%% Calculate distances of test data points to the cluster formed during training
% Testing phase: Calculate the distance of test data to the cluster formed during training
% Points that are far from the cluster are considered anomalies

% Calculate distances of test data points to the cluster formed during training
distances = pdist2(test_data, positive_samples(corepts, :));


%% Clustring
IDcol=1;
Data=[(1:size(distances(:,IDcol),1))',distances(:,IDcol)];

%% plot the output of DBSCAN
DBSCAN_threshold = 0.1;
figure
plot(Data(:,end))
yline(DBSCAN_threshold)
xline((429-IdTrainEnd+1),'-b',{'11\_02\_2022'})
xline((573-IdTrainEnd+1),'-b',{'14\_02\_2022'})
xline((715-IdTrainEnd+1),'-r',{'15\_02\_2022'})
xline((859-IdTrainEnd+1),'-r',{'16\_02\_2022'})
xline((1001-IdTrainEnd+1),'-k',{'25\_02\_2022'})
xline((1145-IdTrainEnd+1),'-k',{'27\_02\_2022'})
title('DBSCAN\_06')
%% Confustion Matrix of DBSCAN
tfTest_DBSCAN = Data(:,end)  > DBSCAN_threshold;
pred.DBSCAN = categorical(tfTest_DBSCAN, [1, 0], ["PitchD", "Normal"]);

figure;
CMatrixIF=confusionchart(TrueLabel(IdTrainEnd+1:end),pred.DBSCAN);
CMatrixIF.ColumnSummary = 'column-normalized';
CMatrixIF.RowSummary = 'row-normalized';
CMatrixIF.Title = 'Anomaly Detection with DBSCAN';
%% Stack of 3 anomalyD model
% Gtest=tfTest_DBSCAN+tfTest_mahal+tfTest_forest;
% figure;
% plot(Gtest)
% yline(1.5)
% xline((429-IdTrainEnd+1),'-b',{'11\_02\_2022'})
% xline((573-IdTrainEnd+1),'-b',{'14\_02\_2022'})
% xline((715-IdTrainEnd+1),'-r',{'15\_02\_2022'})
% xline((859-IdTrainEnd+1),'-r',{'16\_02\_2022'})
% xline((1001-IdTrainEnd+1),'-k',{'25\_02\_2022'})
% xline((1145-IdTrainEnd+1),'-k',{'27\_02\_2022'})
% title('Stack\_06')
% %% Stack of 3 anomalyD model
% tfTest_G = Gtest  > 1.5;
% pred.G = categorical(tfTest_G, [1, 0], ["PitchD", "Normal"]);
% 
% figure;
% CMatrixIF=confusionchart(TrueLabel(IdTrainEnd+1:end),pred.G);
% CMatrixIF.ColumnSummary = 'column-normalized';
% CMatrixIF.RowSummary = 'row-normalized';
% CMatrixIF.Title = 'Anomaly Detection with Stack';
%% Apply Kmeans of output of DBSCAN
opts = statset('Display','final');
[idx,C] = kmeans(Data,3,'Distance','cityblock',...
    'Replicates',10,'Options',opts);
figure
plot(idx)
xline((429-IdTrainEnd+1),'-b',{'11\_02\_2022'})
xline((573-IdTrainEnd+1),'-b',{'14\_02\_2022'})
xline((715-IdTrainEnd+1),'-r',{'15\_02\_2022'})
xline((859-IdTrainEnd+1),'-r',{'16\_02\_2022'})
xline((1001-IdTrainEnd+1),'-k',{'25\_02\_2022'})
xline((1145-IdTrainEnd+1),'-k',{'27\_02\_2022'})

%% plot Cluster Assignments and Centroids
figure;
plot(Data(idx==1,1),Data(idx==1,2),'r.','MarkerSize',12)
hold on
plot(Data(idx==2,1),Data(idx==2,2),'b.','MarkerSize',12)
plot(Data(idx==3,1),Data(idx==3,2),'k.','MarkerSize',12)
plot(C(1,1),C(1,2),'kx',...
     'MarkerSize',15) 
plot(C(2,1),C(2,2),'kx',...
     'MarkerSize',15) 
plot(C(3,1),C(3,2),'kx',...
     'MarkerSize',15)
xline((429-IdTrainEnd+1),'-b',{'11\_02\_2022'})
xline((573-IdTrainEnd+1),'-b',{'14\_02\_2022'})
xline((715-IdTrainEnd+1),'-r',{'15\_02\_2022'})
xline((859-IdTrainEnd+1),'-r',{'16\_02\_2022'})
xline((1001-IdTrainEnd+1),'-k',{'25\_02\_2022'})
xline((1145-IdTrainEnd+1),'-k',{'27\_02\_2022'})

title 'Cluster Assignments and Centroids+Kmeans'
xlabel 'Sample';
ylabel 'DI'; 
legend('After','Before','PDFailure','Centroids','Location','NW')
hold off
%% Detect Anomaly based on cluster center of kmeans
[~,ID.Global] = maxk(C(:,2),3);
ID.PDFailure=ID.Global(1);
ID.After=ID.Global(2);
ID.Before=ID.Global(3);
isanomalyDBSCAN= (idx == ID.Before | idx == ID.After);
pred.DBSCAN = categorical(isanomalyDBSCAN, [1, 0], ["Normal","PitchD"]);
%% Confustion Matrix
ACC.DBSCAN=mean(pred.DBSCAN==TrueLabel(IdTrainEnd+1:end));
figure;
CmatriXkmeans=confusionchart(TrueLabel(IdTrainEnd+1:end), pred.DBSCAN);
CmatriXkmeans.ColumnSummary = 'column-normalized';
CmatriXkmeans.RowSummary = 'row-normalized';
CmatriXkmeans.Title = 'Anomaly Detection Using DBSCAN+Kmeans';