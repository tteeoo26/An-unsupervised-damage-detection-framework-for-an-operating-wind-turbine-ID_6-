%% load data-imbalance
% 29.05.2024
%%
clc
%clear all
close all
%% add path
addpath('D:/UCD Postdoc/Theo_Wedowind/MATLAB_aventa_blade_aerodynamic_imbalance');
%%

load('Aventa_Taggenberg_03_09_2022_stat.mat')
load('Aventa_Taggenberg_01_11_2022_stat.mat')
load('Aventa_Taggenberg_04_11_2022_stat.mat')
load('Aventa_Taggenberg_08_12_2022_stat.mat')
load('Aventa_Taggenberg_11_12_2022_stat.mat')
load('Aventa_Taggenberg_19_12_2022_stat.mat')
load('Aventa_Taggenberg_23_12_2022_stat.mat')
load('Aventa_Taggenberg_29_12_2022_stat.mat')
%2023
load('Aventa_Taggenberg_04_01_2023_stat.mat')
load('Aventa_Taggenberg_15_01_2023_stat.mat')
load('Aventa_Taggenberg_21_01_2023_stat.mat')

%% max
All.Imbalance.max=[Aventa_Taggenberg_03_09_2022_max;Aventa_Taggenberg_01_11_2022_max;Aventa_Taggenberg_04_11_2022_max;Aventa_Taggenberg_08_12_2022_max;...
    Aventa_Taggenberg_11_12_2022_max;Aventa_Taggenberg_19_12_2022_max;Aventa_Taggenberg_23_12_2022_max;Aventa_Taggenberg_29_12_2022_max;...
    Aventa_Taggenberg_04_01_2023_max;Aventa_Taggenberg_15_01_2023_max;Aventa_Taggenberg_21_01_2023_max];

All.Imbalance.max(41,:) = [];
All.Imbalance.max(290,:) = [];
All.Imbalance.max(434,:) = [];
All.Imbalance.max(578,:) = [];
All.Imbalance.max(722,:) = [];
All.Imbalance.max(794,:) = [];
%% min
All.Imbalance.min=[Aventa_Taggenberg_03_09_2022_min;Aventa_Taggenberg_01_11_2022_min;Aventa_Taggenberg_04_11_2022_min;Aventa_Taggenberg_08_12_2022_min;...
    Aventa_Taggenberg_11_12_2022_min;Aventa_Taggenberg_19_12_2022_min;Aventa_Taggenberg_23_12_2022_min;Aventa_Taggenberg_29_12_2022_min;...
    Aventa_Taggenberg_04_01_2023_min;Aventa_Taggenberg_15_01_2023_min;Aventa_Taggenberg_21_01_2023_min];

All.Imbalance.min(41,:) = [];
All.Imbalance.min(290,:) = [];
All.Imbalance.min(434,:) = [];
All.Imbalance.min(578,:) = [];
All.Imbalance.min(722,:) = [];
All.Imbalance.min(794,:) = [];
%% mean
All.Imbalance.mean=[Aventa_Taggenberg_03_09_2022_mean;Aventa_Taggenberg_01_11_2022_mean;Aventa_Taggenberg_04_11_2022_mean;Aventa_Taggenberg_08_12_2022_mean;...
    Aventa_Taggenberg_11_12_2022_mean;Aventa_Taggenberg_19_12_2022_mean;Aventa_Taggenberg_23_12_2022_mean;Aventa_Taggenberg_29_12_2022_mean;...
    Aventa_Taggenberg_04_01_2023_mean;Aventa_Taggenberg_15_01_2023_mean;Aventa_Taggenberg_21_01_2023_mean];

All.Imbalance.mean(41,:) = [];
All.Imbalance.mean(290,:) = [];
All.Imbalance.mean(434,:) = [];
All.Imbalance.mean(578,:) = [];
All.Imbalance.mean(722,:) = [];
All.Imbalance.mean(794,:) = [];
%% skew
All.Imbalance.skew=[Aventa_Taggenberg_03_09_2022_skew;Aventa_Taggenberg_01_11_2022_skew;Aventa_Taggenberg_04_11_2022_skew;Aventa_Taggenberg_08_12_2022_skew;...
    Aventa_Taggenberg_11_12_2022_skew;Aventa_Taggenberg_19_12_2022_skew;Aventa_Taggenberg_23_12_2022_skew;Aventa_Taggenberg_29_12_2022_skew;...
    Aventa_Taggenberg_04_01_2023_skew;Aventa_Taggenberg_15_01_2023_skew;Aventa_Taggenberg_21_01_2023_skew];

All.Imbalance.skew(41,:) = [];
All.Imbalance.skew(290,:) = [];
All.Imbalance.skew(434,:) = [];
All.Imbalance.skew(578,:) = [];
All.Imbalance.skew(722,:) = [];
All.Imbalance.skew(794,:) = [];

%% std
All.Imbalance.std=[Aventa_Taggenberg_03_09_2022_std;Aventa_Taggenberg_01_11_2022_std;Aventa_Taggenberg_04_11_2022_std;Aventa_Taggenberg_08_12_2022_std;...
    Aventa_Taggenberg_11_12_2022_std;Aventa_Taggenberg_19_12_2022_std;Aventa_Taggenberg_23_12_2022_std;Aventa_Taggenberg_29_12_2022_std;...
    Aventa_Taggenberg_04_01_2023_std;Aventa_Taggenberg_15_01_2023_std;Aventa_Taggenberg_21_01_2023_std];

All.Imbalance.std(41,:) = [];
All.Imbalance.std(290,:) = [];
All.Imbalance.std(434,:) = [];
All.Imbalance.std(578,:) = [];
All.Imbalance.std(722,:) = [];
All.Imbalance.std(794,:) = [];
%%
IndexID={'max','min','mean','skew','std'};

ID=3;
for i=3:10 %2:36
figure
plot(cell2mat(table2array(All.Imbalance.(IndexID{ID})(:,i))))
xline(70,'-r',{'Imblance'})
xline(502,'b',{'23\_12\_2022'})
xline(966,'b',{'21\_01\_2023'})
%
title(All.Imbalance.(IndexID{ID}).Properties.VariableNames(i))
ylabel((IndexID{ID}))
xlabel('sample')
end
%%
%close all