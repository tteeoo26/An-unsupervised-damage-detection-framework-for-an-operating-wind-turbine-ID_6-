%% load data-Normal
% 29.05.2024
%%
clc
clear all
%% add path
addpath('C:/Users/rghiasisan/OneDrive - University College Dublin/UCD Postdoc/Theo_Wedowind/MATLAB_aventa_normal_operation_for_system_identification');
%%
load('Aventa_Taggenberg_24_03_2022_stat.mat')
load('Aventa_Taggenberg_08_04_2022_stat.mat')
load('Aventa_Taggenberg_07_05_2022_stat.mat')
load('Aventa_Taggenberg_20_06_2022_stat.mat')
load('Aventa_Taggenberg_07_08_2022_stat.mat')
load('Aventa_Taggenberg_17_08_2022_stat.mat')
load('Aventa_Taggenberg_03_09_2022_stat.mat')
load('Aventa_Taggenberg_14_10_2022_stat.mat')
load('Aventa_Taggenberg_01_11_2022_stat.mat')
load('Aventa_Taggenberg_04_11_2022_stat.mat')
%%
SIZe(1)=size(Aventa_Taggenberg_24_03_2022_max,1);
SIZe(2)=size(Aventa_Taggenberg_08_04_2022_max,1);
SIZe(3)=size(Aventa_Taggenberg_07_05_2022_max,1);
SIZe(4)=size(Aventa_Taggenberg_20_06_2022_max,1);
SIZe(5)=size(Aventa_Taggenberg_07_08_2022_max,1);
SIZe(6)=size(Aventa_Taggenberg_17_08_2022_max,1);
SIZe(7)=size(Aventa_Taggenberg_03_09_2022_max,1);
SIZe(8)=size(Aventa_Taggenberg_14_10_2022_max,1);
SIZe(9)=size(Aventa_Taggenberg_01_11_2022_max,1);
SIZe(10)=size(Aventa_Taggenberg_04_11_2022_max,1);
%% max
All.Normal.max=[Aventa_Taggenberg_24_03_2022_max;Aventa_Taggenberg_08_04_2022_max;Aventa_Taggenberg_07_05_2022_max;Aventa_Taggenberg_20_06_2022_max;...
    Aventa_Taggenberg_07_08_2022_max;Aventa_Taggenberg_17_08_2022_max;Aventa_Taggenberg_03_09_2022_max;Aventa_Taggenberg_14_10_2022_max;
    Aventa_Taggenberg_01_11_2022_max;Aventa_Taggenberg_04_11_2022_max];

All.Normal.max(191,:) = [];
All.Normal.max(239,:) = [];
All.Normal.max(407,:) = [];
All.Normal.max(455,:) = [];
%% min
All.Normal.min=[Aventa_Taggenberg_24_03_2022_min;Aventa_Taggenberg_08_04_2022_min;Aventa_Taggenberg_07_05_2022_min;Aventa_Taggenberg_20_06_2022_min;...
    Aventa_Taggenberg_07_08_2022_min;Aventa_Taggenberg_17_08_2022_min;Aventa_Taggenberg_03_09_2022_min;Aventa_Taggenberg_14_10_2022_min;
    Aventa_Taggenberg_01_11_2022_min;Aventa_Taggenberg_04_11_2022_min];

All.Normal.min(191,:) = [];
All.Normal.min(239,:) = [];
All.Normal.min(407,:) = [];
All.Normal.min(455,:) = [];
%% mean
All.Normal.mean=[Aventa_Taggenberg_24_03_2022_mean;Aventa_Taggenberg_08_04_2022_mean;Aventa_Taggenberg_07_05_2022_mean;Aventa_Taggenberg_20_06_2022_mean;...
    Aventa_Taggenberg_07_08_2022_mean;Aventa_Taggenberg_17_08_2022_mean;Aventa_Taggenberg_03_09_2022_mean;Aventa_Taggenberg_14_10_2022_mean;
    Aventa_Taggenberg_01_11_2022_mean;Aventa_Taggenberg_04_11_2022_mean];

All.Normal.mean(191,:) = [];
All.Normal.mean(239,:) = [];
All.Normal.mean(407,:) = [];
All.Normal.mean(455,:) = [];
%% skew
All.Normal.skew=[Aventa_Taggenberg_24_03_2022_skew;Aventa_Taggenberg_08_04_2022_skew;Aventa_Taggenberg_07_05_2022_skew;Aventa_Taggenberg_20_06_2022_skew;...
    Aventa_Taggenberg_07_08_2022_skew;Aventa_Taggenberg_17_08_2022_skew;Aventa_Taggenberg_03_09_2022_skew;Aventa_Taggenberg_14_10_2022_skew;
    Aventa_Taggenberg_01_11_2022_skew;Aventa_Taggenberg_04_11_2022_skew];

All.Normal.skew(191,:) = [];
All.Normal.skew(239,:) = [];
All.Normal.skew(407,:) = [];
All.Normal.skew(455,:) = [];
%% std
All.Normal.std=[Aventa_Taggenberg_24_03_2022_std;Aventa_Taggenberg_08_04_2022_std;Aventa_Taggenberg_07_05_2022_std;Aventa_Taggenberg_20_06_2022_std;...
    Aventa_Taggenberg_07_08_2022_std;Aventa_Taggenberg_17_08_2022_std;Aventa_Taggenberg_03_09_2022_std;Aventa_Taggenberg_14_10_2022_std;
    Aventa_Taggenberg_01_11_2022_std;Aventa_Taggenberg_04_11_2022_std];

All.Normal.std(191,:) = [];
All.Normal.std(239,:) = [];
All.Normal.std(407,:) = [];
All.Normal.std(455,:) = [];
%%
IndexID={'max','min','mean','skew','std'};

ID=3;
for i= 2:36
figure
plot(cell2mat(table2array(All.Normal.(IndexID{ID})(:,i))))

xline(67,'b',{'24\_03\_2022'})
xline(79,'b',{'08\_04\_2022'})
xline(145,'b',{'07\_05\_2022'})
xline(224,'b',{'20\_06\_2022'})
xline(261,'b',{'07\_08\_2022'})
xline(303,'b',{'17\_08\_2022'})
xline(333,'b',{'03\_09\_2022'})
xline(448,'b',{'13\_10\_2022'})
xline(473,'b',{'01\_11\_2022'})
xline(489,'b',{'04\_11\_2022'})
%
title(All.Normal.(IndexID{ID}).Properties.VariableNames(i))
ylabel((IndexID{ID}))
xlabel('sample')
end
%%
%close all