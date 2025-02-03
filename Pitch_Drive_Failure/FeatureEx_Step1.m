%% Feature extraction in time domain
% Based on Matlab toolbox
% pitch Drive Failure-step 1
% 13.12.2024
% ramin.ghiasisangani@ucd.ie
clc
clear all
%% load sample dataset
load('Aventa_Taggenberg_01_11_2022_V2.mat')
table1=Aventa_Taggenberg_01_11_2022_V2;
%% pitch_drive
A = {'Aventa_Taggenberg_22_01_2022_V2.mat','Aventa_Taggenberg_23_01_2022_V2.mat','Aventa_Taggenberg_06_02_2022_V2.mat',...
     'Aventa_Taggenberg_11_02_2022_V2.mat','Aventa_Taggenberg_14_02_2022_V2.mat','Aventa_Taggenberg_15_02_2022_V2.mat',...
     'Aventa_Taggenberg_16_02_2022_V2.mat','Aventa_Taggenberg_25_02_2022_V2.mat','Aventa_Taggenberg_27_02_2022_V2.mat'};

% Change directory to the appropriate location
cd('C:\Users\rghiasisan\OneDrive - University College Dublin\UCD Postdoc\Theo_Wedowind\WeDoWind_Ramin\MATLAB_aventa_failure_flexible_coupling_of_collective_pitch_drive')
addpath 'C:\Users\rghiasisan\OneDrive - University College Dublin\UCD Postdoc\Theo_Wedowind\WeDoWind_Ramin'

% Initialize cell arrays to store results
featureTablePitchD = struct();
outputTablePitchD = struct();
tic
for i=1:length(A)
    Filename_table = A{i};
    Filename_table_short = Filename_table(1:end-4); % Remove '.mat' extension
    
  
    % Load the file and extract the variable
    tempData = load(Filename_table, Filename_table_short);
    temp = tempData.(Filename_table_short);
    
    % Process the first two rows of the data (adding random values for missing columns compared to sample dataset)
    %temp = temp(1:2, :);
    temp = Setsamecolumn(table1, temp);
    
    % Compute features and store them dynamically in the structure
    [featureResults, outputResults] = diagnosticFeaturesV3(temp);
    
    % Use dynamic field names to store the results
    featureTablePitchD.(Filename_table_short) = featureResults;
    outputTablePitchD.(Filename_table_short) = outputResults;
end
toc

%Elapsed time is 4908.094801 seconds.


