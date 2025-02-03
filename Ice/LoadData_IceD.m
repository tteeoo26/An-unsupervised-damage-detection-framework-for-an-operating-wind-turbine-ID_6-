%% load data-icing
% 29.05.2024
%%
clc
%clear all
close all
%% add path
addpath('D:/UCD Postdoc/Theo_Wedowind/MATLAB_aventa_rotor_icing');
%%
load('Aventa_Taggenberg_03_09_2022_stat.mat')
load('Aventa_Taggenberg_01_11_2022_stat.mat')
load('Aventa_Taggenberg_04_11_2022_stat.mat')
load('Aventa_Taggenberg_17_12_2022_stat.mat')
load('Aventa_Taggenberg_18_12_2022_stat.mat')
load('Aventa_Taggenberg_19_12_2022_stat.mat')
load('Aventa_Taggenberg_20_12_2022_stat.mat')



%% max
All.Icing.max=[Aventa_Taggenberg_03_09_2022_max;Aventa_Taggenberg_01_11_2022_max;Aventa_Taggenberg_04_11_2022_max;Aventa_Taggenberg_17_12_2022_max;...
    Aventa_Taggenberg_18_12_2022_max; Aventa_Taggenberg_19_12_2022_max; Aventa_Taggenberg_20_12_2022_max];

All.Icing.max(41,:) = [];
All.Icing.max(338,:) = [];
%% min
All.Icing.min=[Aventa_Taggenberg_03_09_2022_min;Aventa_Taggenberg_01_11_2022_min;Aventa_Taggenberg_04_11_2022_min;Aventa_Taggenberg_17_12_2022_min;...
    Aventa_Taggenberg_18_12_2022_min; Aventa_Taggenberg_19_12_2022_min; Aventa_Taggenberg_20_12_2022_min];

All.Icing.min(41,:) = [];
All.Icing.min(338,:) = [];
%% mean
All.Icing.mean=[Aventa_Taggenberg_03_09_2022_mean;Aventa_Taggenberg_01_11_2022_mean;Aventa_Taggenberg_04_11_2022_mean;Aventa_Taggenberg_17_12_2022_mean;...
    Aventa_Taggenberg_18_12_2022_mean; Aventa_Taggenberg_19_12_2022_mean; Aventa_Taggenberg_20_12_2022_mean];

All.Icing.mean(41,:) = [];
All.Icing.mean(338,:) = [];
%% skew
All.Icing.skew=[Aventa_Taggenberg_03_09_2022_skew;Aventa_Taggenberg_01_11_2022_skew;Aventa_Taggenberg_04_11_2022_skew;Aventa_Taggenberg_17_12_2022_skew;...
    Aventa_Taggenberg_18_12_2022_skew; Aventa_Taggenberg_19_12_2022_skew; Aventa_Taggenberg_20_12_2022_skew];

All.Icing.skew(41,:) = [];
All.Icing.skew(338,:) = [];
%% std
All.Icing.std=[Aventa_Taggenberg_03_09_2022_std;Aventa_Taggenberg_01_11_2022_std;Aventa_Taggenberg_04_11_2022_std;Aventa_Taggenberg_17_12_2022_std;...
    Aventa_Taggenberg_18_12_2022_std; Aventa_Taggenberg_19_12_2022_std; Aventa_Taggenberg_20_12_2022_std];

All.Icing.std(41,:) = [];
All.Icing.std(338,:) = [];
%%
IndexID={'max','min','mean','skew','std'};

ID=3;
for i= 2
figure
plot(cell2mat(table2array(All.Icing.(IndexID{ID})(:,i))))
xline(70,'-r',{'Icing'})
%xline(502,'b',{'23\_12\_2022'})
%xline(966,'b',{'21\_01\_2023'})
%
title(All.Icing.(IndexID{ID}).Properties.VariableNames(i))
ylabel((IndexID{ID}))
xlabel('sample')
end
%%

