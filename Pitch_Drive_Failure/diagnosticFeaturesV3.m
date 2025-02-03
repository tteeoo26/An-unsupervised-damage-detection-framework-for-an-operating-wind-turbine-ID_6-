function [featureTable,outputTable] = diagnosticFeaturesV3(inputData)
%DIAGNOSTICFEATURES recreates results in Diagnostic Feature Designer.
%
% Input:
%  inputData: A table or a cell array of tables/matrices containing the
%  data as those imported into the app.
%
% Output:
%  featureTable: A table containing all features and condition variables.
%  outputTable: A table containing the computation results.
%
% This function computes features:
%  ATM_TEMP_01_tsmodel/Coef1
%  ATM_TEMP_01_tsmodel/Coef2
%  ATM_TEMP_01_tsmodel/Coef3
%  ATM_TEMP_01_tsmodel/Coef4
%  ATM_TEMP_01_tsmodel/Coef5
%  ATM_TEMP_01_tsmodel/Freq1
%  ATM_TEMP_01_tsmodel/Freq2
%  ATM_TEMP_01_tsmodel/Damp1
%  ATM_TEMP_01_tsmodel/Damp2
%  ATM_TEMP_01_tsmodel/MSE
%  ATM_TEMP_01_tsmodel/MAE
%  ATM_TEMP_01_tsmodel/AIC
%  ATM_TEMP_01_tsmodel/Mean
%  ATM_TEMP_01_tsmodel/Variance
%  ATM_TEMP_01_tsmodel/RMS
%  ATM_TEMP_01_tsmodel/Kurtosis
%  ATM_HUM_01_tsmodel/Coef1
%  ATM_HUM_01_tsmodel/Coef2
%  ATM_HUM_01_tsmodel/Coef3
%  ATM_HUM_01_tsmodel/Coef4
%  ATM_HUM_01_tsmodel/Coef5
%  ATM_HUM_01_tsmodel/Freq1
%  ATM_HUM_01_tsmodel/Freq2
%  ATM_HUM_01_tsmodel/Damp1
%  ATM_HUM_01_tsmodel/Damp2
%  ATM_HUM_01_tsmodel/MSE
%  ATM_HUM_01_tsmodel/MAE
%  ATM_HUM_01_tsmodel/AIC
%  ATM_HUM_01_tsmodel/Mean
%  ATM_HUM_01_tsmodel/Variance
%  ATM_HUM_01_tsmodel/RMS
%  ATM_HUM_01_tsmodel/Kurtosis
%  GEN_ACC_XX_01_tsmodel/Coef1
%  GEN_ACC_XX_01_tsmodel/Coef2
%  GEN_ACC_XX_01_tsmodel/Coef3
%  GEN_ACC_XX_01_tsmodel/Coef4
%  GEN_ACC_XX_01_tsmodel/Coef5
%  GEN_ACC_XX_01_tsmodel/Freq1
%  GEN_ACC_XX_01_tsmodel/Freq2
%  GEN_ACC_XX_01_tsmodel/Damp1
%  GEN_ACC_XX_01_tsmodel/Damp2
%  GEN_ACC_XX_01_tsmodel/MSE
%  GEN_ACC_XX_01_tsmodel/MAE
%  GEN_ACC_XX_01_tsmodel/AIC
%  GEN_ACC_XX_01_tsmodel/Mean
%  GEN_ACC_XX_01_tsmodel/Variance
%  GEN_ACC_XX_01_tsmodel/RMS
%  GEN_ACC_XX_01_tsmodel/Kurtosis
%  GEN_ACC_YY_01_tsmodel/Coef1
%  GEN_ACC_YY_01_tsmodel/Coef2
%  GEN_ACC_YY_01_tsmodel/Coef3
%  GEN_ACC_YY_01_tsmodel/Coef4
%  GEN_ACC_YY_01_tsmodel/Coef5
%  GEN_ACC_YY_01_tsmodel/Freq1
%  GEN_ACC_YY_01_tsmodel/Freq2
%  GEN_ACC_YY_01_tsmodel/Damp1
%  GEN_ACC_YY_01_tsmodel/Damp2
%  GEN_ACC_YY_01_tsmodel/MSE
%  GEN_ACC_YY_01_tsmodel/MAE
%  GEN_ACC_YY_01_tsmodel/AIC
%  GEN_ACC_YY_01_tsmodel/Mean
%  GEN_ACC_YY_01_tsmodel/Variance
%  GEN_ACC_YY_01_tsmodel/RMS
%  GEN_ACC_YY_01_tsmodel/Kurtosis
%  GEN_ACC_ZZ_01_tsmodel/Coef1
%  GEN_ACC_ZZ_01_tsmodel/Coef2
%  GEN_ACC_ZZ_01_tsmodel/Coef3
%  GEN_ACC_ZZ_01_tsmodel/Coef4
%  GEN_ACC_ZZ_01_tsmodel/Coef5
%  GEN_ACC_ZZ_01_tsmodel/Freq1
%  GEN_ACC_ZZ_01_tsmodel/Freq2
%  GEN_ACC_ZZ_01_tsmodel/Damp1
%  GEN_ACC_ZZ_01_tsmodel/Damp2
%  GEN_ACC_ZZ_01_tsmodel/MSE
%  GEN_ACC_ZZ_01_tsmodel/MAE
%  GEN_ACC_ZZ_01_tsmodel/AIC
%  GEN_ACC_ZZ_01_tsmodel/Mean
%  GEN_ACC_ZZ_01_tsmodel/Variance
%  GEN_ACC_ZZ_01_tsmodel/RMS
%  GEN_ACC_ZZ_01_tsmodel/Kurtosis
%  L1_FBSG_01_tsmodel/Coef1
%  L1_FBSG_01_tsmodel/Coef2
%  L1_FBSG_01_tsmodel/Coef3
%  L1_FBSG_01_tsmodel/Coef4
%  L1_FBSG_01_tsmodel/Coef5
%  L1_FBSG_01_tsmodel/Freq1
%  L1_FBSG_01_tsmodel/Freq2
%  L1_FBSG_01_tsmodel/Damp1
%  L1_FBSG_01_tsmodel/Damp2
%  L1_FBSG_01_tsmodel/MSE
%  L1_FBSG_01_tsmodel/MAE
%  L1_FBSG_01_tsmodel/AIC
%  L1_FBSG_01_tsmodel/Mean
%  L1_FBSG_01_tsmodel/Variance
%  L1_FBSG_01_tsmodel/RMS
%  L1_FBSG_01_tsmodel/Kurtosis
%  L1_FBSG_02_tsmodel/Coef1
%  L1_FBSG_02_tsmodel/Coef2
%  L1_FBSG_02_tsmodel/Coef3
%  L1_FBSG_02_tsmodel/Coef4
%  L1_FBSG_02_tsmodel/Coef5
%  L1_FBSG_02_tsmodel/Freq1
%  L1_FBSG_02_tsmodel/Freq2
%  L1_FBSG_02_tsmodel/Damp1
%  L1_FBSG_02_tsmodel/Damp2
%  L1_FBSG_02_tsmodel/MSE
%  L1_FBSG_02_tsmodel/MAE
%  L1_FBSG_02_tsmodel/AIC
%  L1_FBSG_02_tsmodel/Mean
%  L1_FBSG_02_tsmodel/Variance
%  L1_FBSG_02_tsmodel/RMS
%  L1_FBSG_02_tsmodel/Kurtosis
%  L3_ACC_XX_01_tsmodel/Coef1
%  L3_ACC_XX_01_tsmodel/Coef2
%  L3_ACC_XX_01_tsmodel/Coef3
%  L3_ACC_XX_01_tsmodel/Coef4
%  L3_ACC_XX_01_tsmodel/Coef5
%  L3_ACC_XX_01_tsmodel/Freq1
%  L3_ACC_XX_01_tsmodel/Freq2
%  L3_ACC_XX_01_tsmodel/Damp1
%  L3_ACC_XX_01_tsmodel/Damp2
%  L3_ACC_XX_01_tsmodel/MSE
%  L3_ACC_XX_01_tsmodel/MAE
%  L3_ACC_XX_01_tsmodel/AIC
%  L3_ACC_XX_01_tsmodel/Mean
%  L3_ACC_XX_01_tsmodel/Variance
%  L3_ACC_XX_01_tsmodel/RMS
%  L3_ACC_XX_01_tsmodel/Kurtosis
%  L3_ACC_XX_02_tsmodel/Coef1
%  L3_ACC_XX_02_tsmodel/Coef2
%  L3_ACC_XX_02_tsmodel/Coef3
%  L3_ACC_XX_02_tsmodel/Coef4
%  L3_ACC_XX_02_tsmodel/Coef5
%  L3_ACC_XX_02_tsmodel/Freq1
%  L3_ACC_XX_02_tsmodel/Freq2
%  L3_ACC_XX_02_tsmodel/Damp1
%  L3_ACC_XX_02_tsmodel/Damp2
%  L3_ACC_XX_02_tsmodel/MSE
%  L3_ACC_XX_02_tsmodel/MAE
%  L3_ACC_XX_02_tsmodel/AIC
%  L3_ACC_XX_02_tsmodel/Mean
%  L3_ACC_XX_02_tsmodel/Variance
%  L3_ACC_XX_02_tsmodel/RMS
%  L3_ACC_XX_02_tsmodel/Kurtosis
%  L3_ACC_YY_01_tsmodel/Coef1
%  L3_ACC_YY_01_tsmodel/Coef2
%  L3_ACC_YY_01_tsmodel/Coef3
%  L3_ACC_YY_01_tsmodel/Coef4
%  L3_ACC_YY_01_tsmodel/Coef5
%  L3_ACC_YY_01_tsmodel/Freq1
%  L3_ACC_YY_01_tsmodel/Freq2
%  L3_ACC_YY_01_tsmodel/Damp1
%  L3_ACC_YY_01_tsmodel/Damp2
%  L3_ACC_YY_01_tsmodel/MSE
%  L3_ACC_YY_01_tsmodel/MAE
%  L3_ACC_YY_01_tsmodel/AIC
%  L3_ACC_YY_01_tsmodel/Mean
%  L3_ACC_YY_01_tsmodel/Variance
%  L3_ACC_YY_01_tsmodel/RMS
%  L3_ACC_YY_01_tsmodel/Kurtosis
%  L3_ACC_YY_02_tsmodel/Coef1
%  L3_ACC_YY_02_tsmodel/Coef2
%  L3_ACC_YY_02_tsmodel/Coef3
%  L3_ACC_YY_02_tsmodel/Coef4
%  L3_ACC_YY_02_tsmodel/Coef5
%  L3_ACC_YY_02_tsmodel/Freq1
%  L3_ACC_YY_02_tsmodel/Freq2
%  L3_ACC_YY_02_tsmodel/Damp1
%  L3_ACC_YY_02_tsmodel/Damp2
%  L3_ACC_YY_02_tsmodel/MSE
%  L3_ACC_YY_02_tsmodel/MAE
%  L3_ACC_YY_02_tsmodel/AIC
%  L3_ACC_YY_02_tsmodel/Mean
%  L3_ACC_YY_02_tsmodel/Variance
%  L3_ACC_YY_02_tsmodel/RMS
%  L3_ACC_YY_02_tsmodel/Kurtosis
%  L4_ACC_XX_01_tsmodel/Coef1
%  L4_ACC_XX_01_tsmodel/Coef2
%  L4_ACC_XX_01_tsmodel/Coef3
%  L4_ACC_XX_01_tsmodel/Coef4
%  L4_ACC_XX_01_tsmodel/Coef5
%  L4_ACC_XX_01_tsmodel/Freq1
%  L4_ACC_XX_01_tsmodel/Freq2
%  L4_ACC_XX_01_tsmodel/Damp1
%  L4_ACC_XX_01_tsmodel/Damp2
%  L4_ACC_XX_01_tsmodel/MSE
%  L4_ACC_XX_01_tsmodel/MAE
%  L4_ACC_XX_01_tsmodel/AIC
%  L4_ACC_XX_01_tsmodel/Mean
%  L4_ACC_XX_01_tsmodel/Variance
%  L4_ACC_XX_01_tsmodel/RMS
%  L4_ACC_XX_01_tsmodel/Kurtosis
%  L4_ACC_XX_02_tsmodel/Coef1
%  L4_ACC_XX_02_tsmodel/Coef2
%  L4_ACC_XX_02_tsmodel/Coef3
%  L4_ACC_XX_02_tsmodel/Coef4
%  L4_ACC_XX_02_tsmodel/Coef5
%  L4_ACC_XX_02_tsmodel/Freq1
%  L4_ACC_XX_02_tsmodel/Freq2
%  L4_ACC_XX_02_tsmodel/Damp1
%  L4_ACC_XX_02_tsmodel/Damp2
%  L4_ACC_XX_02_tsmodel/MSE
%  L4_ACC_XX_02_tsmodel/MAE
%  L4_ACC_XX_02_tsmodel/AIC
%  L4_ACC_XX_02_tsmodel/Mean
%  L4_ACC_XX_02_tsmodel/Variance
%  L4_ACC_XX_02_tsmodel/RMS
%  L4_ACC_XX_02_tsmodel/Kurtosis
%  L4_ACC_YY_01_tsmodel/Coef1
%  L4_ACC_YY_01_tsmodel/Coef2
%  L4_ACC_YY_01_tsmodel/Coef3
%  L4_ACC_YY_01_tsmodel/Coef4
%  L4_ACC_YY_01_tsmodel/Coef5
%  L4_ACC_YY_01_tsmodel/Freq1
%  L4_ACC_YY_01_tsmodel/Freq2
%  L4_ACC_YY_01_tsmodel/Damp1
%  L4_ACC_YY_01_tsmodel/Damp2
%  L4_ACC_YY_01_tsmodel/MSE
%  L4_ACC_YY_01_tsmodel/MAE
%  L4_ACC_YY_01_tsmodel/AIC
%  L4_ACC_YY_01_tsmodel/Mean
%  L4_ACC_YY_01_tsmodel/Variance
%  L4_ACC_YY_01_tsmodel/RMS
%  L4_ACC_YY_01_tsmodel/Kurtosis
%  L4_ACC_YY_02_tsmodel/Coef1
%  L4_ACC_YY_02_tsmodel/Coef2
%  L4_ACC_YY_02_tsmodel/Coef3
%  L4_ACC_YY_02_tsmodel/Coef4
%  L4_ACC_YY_02_tsmodel/Coef5
%  L4_ACC_YY_02_tsmodel/Freq1
%  L4_ACC_YY_02_tsmodel/Freq2
%  L4_ACC_YY_02_tsmodel/Damp1
%  L4_ACC_YY_02_tsmodel/Damp2
%  L4_ACC_YY_02_tsmodel/MSE
%  L4_ACC_YY_02_tsmodel/MAE
%  L4_ACC_YY_02_tsmodel/AIC
%  L4_ACC_YY_02_tsmodel/Mean
%  L4_ACC_YY_02_tsmodel/Variance
%  L4_ACC_YY_02_tsmodel/RMS
%  L4_ACC_YY_02_tsmodel/Kurtosis
%  L4_INC_XX_01_tsmodel/Coef1
%  L4_INC_XX_01_tsmodel/Coef2
%  L4_INC_XX_01_tsmodel/Coef3
%  L4_INC_XX_01_tsmodel/Coef4
%  L4_INC_XX_01_tsmodel/Coef5
%  L4_INC_XX_01_tsmodel/Freq1
%  L4_INC_XX_01_tsmodel/Freq2
%  L4_INC_XX_01_tsmodel/Damp1
%  L4_INC_XX_01_tsmodel/Damp2
%  L4_INC_XX_01_tsmodel/MSE
%  L4_INC_XX_01_tsmodel/MAE
%  L4_INC_XX_01_tsmodel/AIC
%  L4_INC_XX_01_tsmodel/Mean
%  L4_INC_XX_01_tsmodel/Variance
%  L4_INC_XX_01_tsmodel/RMS
%  L4_INC_XX_01_tsmodel/Kurtosis
%  L4_INC_YY_01_tsmodel/Coef1
%  L4_INC_YY_01_tsmodel/Coef2
%  L4_INC_YY_01_tsmodel/Coef3
%  L4_INC_YY_01_tsmodel/Coef4
%  L4_INC_YY_01_tsmodel/Coef5
%  L4_INC_YY_01_tsmodel/Freq1
%  L4_INC_YY_01_tsmodel/Freq2
%  L4_INC_YY_01_tsmodel/Damp1
%  L4_INC_YY_01_tsmodel/Damp2
%  L4_INC_YY_01_tsmodel/MSE
%  L4_INC_YY_01_tsmodel/MAE
%  L4_INC_YY_01_tsmodel/AIC
%  L4_INC_YY_01_tsmodel/Mean
%  L4_INC_YY_01_tsmodel/Variance
%  L4_INC_YY_01_tsmodel/RMS
%  L4_INC_YY_01_tsmodel/Kurtosis
%  L5_ACC_XX_01_tsmodel/Coef1
%  L5_ACC_XX_01_tsmodel/Coef2
%  L5_ACC_XX_01_tsmodel/Coef3
%  L5_ACC_XX_01_tsmodel/Coef4
%  L5_ACC_XX_01_tsmodel/Coef5
%  L5_ACC_XX_01_tsmodel/Freq1
%  L5_ACC_XX_01_tsmodel/Freq2
%  L5_ACC_XX_01_tsmodel/Damp1
%  L5_ACC_XX_01_tsmodel/Damp2
%  L5_ACC_XX_01_tsmodel/MSE
%  L5_ACC_XX_01_tsmodel/MAE
%  L5_ACC_XX_01_tsmodel/AIC
%  L5_ACC_XX_01_tsmodel/Mean
%  L5_ACC_XX_01_tsmodel/Variance
%  L5_ACC_XX_01_tsmodel/RMS
%  L5_ACC_XX_01_tsmodel/Kurtosis
%  L5_ACC_XX_02_tsmodel/Coef1
%  L5_ACC_XX_02_tsmodel/Coef2
%  L5_ACC_XX_02_tsmodel/Coef3
%  L5_ACC_XX_02_tsmodel/Coef4
%  L5_ACC_XX_02_tsmodel/Coef5
%  L5_ACC_XX_02_tsmodel/Freq1
%  L5_ACC_XX_02_tsmodel/Freq2
%  L5_ACC_XX_02_tsmodel/Damp1
%  L5_ACC_XX_02_tsmodel/Damp2
%  L5_ACC_XX_02_tsmodel/MSE
%  L5_ACC_XX_02_tsmodel/MAE
%  L5_ACC_XX_02_tsmodel/AIC
%  L5_ACC_XX_02_tsmodel/Mean
%  L5_ACC_XX_02_tsmodel/Variance
%  L5_ACC_XX_02_tsmodel/RMS
%  L5_ACC_XX_02_tsmodel/Kurtosis
%  L5_ACC_YY_01_tsmodel/Coef1
%  L5_ACC_YY_01_tsmodel/Coef2
%  L5_ACC_YY_01_tsmodel/Coef3
%  L5_ACC_YY_01_tsmodel/Coef4
%  L5_ACC_YY_01_tsmodel/Coef5
%  L5_ACC_YY_01_tsmodel/Freq1
%  L5_ACC_YY_01_tsmodel/Freq2
%  L5_ACC_YY_01_tsmodel/Damp1
%  L5_ACC_YY_01_tsmodel/Damp2
%  L5_ACC_YY_01_tsmodel/MSE
%  L5_ACC_YY_01_tsmodel/MAE
%  L5_ACC_YY_01_tsmodel/AIC
%  L5_ACC_YY_01_tsmodel/Mean
%  L5_ACC_YY_01_tsmodel/Variance
%  L5_ACC_YY_01_tsmodel/RMS
%  L5_ACC_YY_01_tsmodel/Kurtosis
%  L5_ACC_YY_02_tsmodel/Coef1
%  L5_ACC_YY_02_tsmodel/Coef2
%  L5_ACC_YY_02_tsmodel/Coef3
%  L5_ACC_YY_02_tsmodel/Coef4
%  L5_ACC_YY_02_tsmodel/Coef5
%  L5_ACC_YY_02_tsmodel/Freq1
%  L5_ACC_YY_02_tsmodel/Freq2
%  L5_ACC_YY_02_tsmodel/Damp1
%  L5_ACC_YY_02_tsmodel/Damp2
%  L5_ACC_YY_02_tsmodel/MSE
%  L5_ACC_YY_02_tsmodel/MAE
%  L5_ACC_YY_02_tsmodel/AIC
%  L5_ACC_YY_02_tsmodel/Mean
%  L5_ACC_YY_02_tsmodel/Variance
%  L5_ACC_YY_02_tsmodel/RMS
%  L5_ACC_YY_02_tsmodel/Kurtosis
%  L5_INC_XX_01_tsmodel/Coef1
%  L5_INC_XX_01_tsmodel/Coef2
%  L5_INC_XX_01_tsmodel/Coef3
%  L5_INC_XX_01_tsmodel/Coef4
%  L5_INC_XX_01_tsmodel/Coef5
%  L5_INC_XX_01_tsmodel/Freq1
%  L5_INC_XX_01_tsmodel/Freq2
%  L5_INC_XX_01_tsmodel/Damp1
%  L5_INC_XX_01_tsmodel/Damp2
%  L5_INC_XX_01_tsmodel/MSE
%  L5_INC_XX_01_tsmodel/MAE
%  L5_INC_XX_01_tsmodel/AIC
%  L5_INC_XX_01_tsmodel/Mean
%  L5_INC_XX_01_tsmodel/Variance
%  L5_INC_XX_01_tsmodel/RMS
%  L5_INC_XX_01_tsmodel/Kurtosis
%  L5_INC_YY_01_tsmodel/Coef1
%  L5_INC_YY_01_tsmodel/Coef2
%  L5_INC_YY_01_tsmodel/Coef3
%  L5_INC_YY_01_tsmodel/Coef4
%  L5_INC_YY_01_tsmodel/Coef5
%  L5_INC_YY_01_tsmodel/Freq1
%  L5_INC_YY_01_tsmodel/Freq2
%  L5_INC_YY_01_tsmodel/Damp1
%  L5_INC_YY_01_tsmodel/Damp2
%  L5_INC_YY_01_tsmodel/MSE
%  L5_INC_YY_01_tsmodel/MAE
%  L5_INC_YY_01_tsmodel/AIC
%  L5_INC_YY_01_tsmodel/Mean
%  L5_INC_YY_01_tsmodel/Variance
%  L5_INC_YY_01_tsmodel/RMS
%  L5_INC_YY_01_tsmodel/Kurtosis
%  MSB_ACC_XX_01_tsmodel/Coef1
%  MSB_ACC_XX_01_tsmodel/Coef2
%  MSB_ACC_XX_01_tsmodel/Coef3
%  MSB_ACC_XX_01_tsmodel/Coef4
%  MSB_ACC_XX_01_tsmodel/Coef5
%  MSB_ACC_XX_01_tsmodel/Freq1
%  MSB_ACC_XX_01_tsmodel/Freq2
%  MSB_ACC_XX_01_tsmodel/Damp1
%  MSB_ACC_XX_01_tsmodel/Damp2
%  MSB_ACC_XX_01_tsmodel/MSE
%  MSB_ACC_XX_01_tsmodel/MAE
%  MSB_ACC_XX_01_tsmodel/AIC
%  MSB_ACC_XX_01_tsmodel/Mean
%  MSB_ACC_XX_01_tsmodel/Variance
%  MSB_ACC_XX_01_tsmodel/RMS
%  MSB_ACC_XX_01_tsmodel/Kurtosis
%  MSB_ACC_ZZ_02_tsmodel/Coef1
%  MSB_ACC_ZZ_02_tsmodel/Coef2
%  MSB_ACC_ZZ_02_tsmodel/Coef3
%  MSB_ACC_ZZ_02_tsmodel/Coef4
%  MSB_ACC_ZZ_02_tsmodel/Coef5
%  MSB_ACC_ZZ_02_tsmodel/Freq1
%  MSB_ACC_ZZ_02_tsmodel/Freq2
%  MSB_ACC_ZZ_02_tsmodel/Damp1
%  MSB_ACC_ZZ_02_tsmodel/Damp2
%  MSB_ACC_ZZ_02_tsmodel/MSE
%  MSB_ACC_ZZ_02_tsmodel/MAE
%  MSB_ACC_ZZ_02_tsmodel/AIC
%  MSB_ACC_ZZ_02_tsmodel/Mean
%  MSB_ACC_ZZ_02_tsmodel/Variance
%  MSB_ACC_ZZ_02_tsmodel/RMS
%  MSB_ACC_ZZ_02_tsmodel/Kurtosis
%  MSH_ACC_XX_01_tsmodel/Coef1
%  MSH_ACC_XX_01_tsmodel/Coef2
%  MSH_ACC_XX_01_tsmodel/Coef3
%  MSH_ACC_XX_01_tsmodel/Coef4
%  MSH_ACC_XX_01_tsmodel/Coef5
%  MSH_ACC_XX_01_tsmodel/Freq1
%  MSH_ACC_XX_01_tsmodel/Freq2
%  MSH_ACC_XX_01_tsmodel/Damp1
%  MSH_ACC_XX_01_tsmodel/Damp2
%  MSH_ACC_XX_01_tsmodel/MSE
%  MSH_ACC_XX_01_tsmodel/MAE
%  MSH_ACC_XX_01_tsmodel/AIC
%  MSH_ACC_XX_01_tsmodel/Mean
%  MSH_ACC_XX_01_tsmodel/Variance
%  MSH_ACC_XX_01_tsmodel/RMS
%  MSH_ACC_XX_01_tsmodel/Kurtosis
%  MSH_ACC_ZZ_01_tsmodel/Coef1
%  MSH_ACC_ZZ_01_tsmodel/Coef2
%  MSH_ACC_ZZ_01_tsmodel/Coef3
%  MSH_ACC_ZZ_01_tsmodel/Coef4
%  MSH_ACC_ZZ_01_tsmodel/Coef5
%  MSH_ACC_ZZ_01_tsmodel/Freq1
%  MSH_ACC_ZZ_01_tsmodel/Freq2
%  MSH_ACC_ZZ_01_tsmodel/Damp1
%  MSH_ACC_ZZ_01_tsmodel/Damp2
%  MSH_ACC_ZZ_01_tsmodel/MSE
%  MSH_ACC_ZZ_01_tsmodel/MAE
%  MSH_ACC_ZZ_01_tsmodel/AIC
%  MSH_ACC_ZZ_01_tsmodel/Mean
%  MSH_ACC_ZZ_01_tsmodel/Variance
%  MSH_ACC_ZZ_01_tsmodel/RMS
%  MSH_ACC_ZZ_01_tsmodel/Kurtosis
%  NMF_ACC_XX_02_tsmodel/Coef1
%  NMF_ACC_XX_02_tsmodel/Coef2
%  NMF_ACC_XX_02_tsmodel/Coef3
%  NMF_ACC_XX_02_tsmodel/Coef4
%  NMF_ACC_XX_02_tsmodel/Coef5
%  NMF_ACC_XX_02_tsmodel/Freq1
%  NMF_ACC_XX_02_tsmodel/Freq2
%  NMF_ACC_XX_02_tsmodel/Damp1
%  NMF_ACC_XX_02_tsmodel/Damp2
%  NMF_ACC_XX_02_tsmodel/MSE
%  NMF_ACC_XX_02_tsmodel/MAE
%  NMF_ACC_XX_02_tsmodel/AIC
%  NMF_ACC_XX_02_tsmodel/Mean
%  NMF_ACC_XX_02_tsmodel/Variance
%  NMF_ACC_XX_02_tsmodel/RMS
%  NMF_ACC_XX_02_tsmodel/Kurtosis
%  NMF_ACC_YY_01_tsmodel/Coef1
%  NMF_ACC_YY_01_tsmodel/Coef2
%  NMF_ACC_YY_01_tsmodel/Coef3
%  NMF_ACC_YY_01_tsmodel/Coef4
%  NMF_ACC_YY_01_tsmodel/Coef5
%  NMF_ACC_YY_01_tsmodel/Freq1
%  NMF_ACC_YY_01_tsmodel/Freq2
%  NMF_ACC_YY_01_tsmodel/Damp1
%  NMF_ACC_YY_01_tsmodel/Damp2
%  NMF_ACC_YY_01_tsmodel/MSE
%  NMF_ACC_YY_01_tsmodel/MAE
%  NMF_ACC_YY_01_tsmodel/AIC
%  NMF_ACC_YY_01_tsmodel/Mean
%  NMF_ACC_YY_01_tsmodel/Variance
%  NMF_ACC_YY_01_tsmodel/RMS
%  NMF_ACC_YY_01_tsmodel/Kurtosis
%  NMF_ACC_YY_02_tsmodel/Coef1
%  NMF_ACC_YY_02_tsmodel/Coef2
%  NMF_ACC_YY_02_tsmodel/Coef3
%  NMF_ACC_YY_02_tsmodel/Coef4
%  NMF_ACC_YY_02_tsmodel/Coef5
%  NMF_ACC_YY_02_tsmodel/Freq1
%  NMF_ACC_YY_02_tsmodel/Freq2
%  NMF_ACC_YY_02_tsmodel/Damp1
%  NMF_ACC_YY_02_tsmodel/Damp2
%  NMF_ACC_YY_02_tsmodel/MSE
%  NMF_ACC_YY_02_tsmodel/MAE
%  NMF_ACC_YY_02_tsmodel/AIC
%  NMF_ACC_YY_02_tsmodel/Mean
%  NMF_ACC_YY_02_tsmodel/Variance
%  NMF_ACC_YY_02_tsmodel/RMS
%  NMF_ACC_YY_02_tsmodel/Kurtosis
%  WM1_tsmodel/Coef1
%  WM1_tsmodel/Coef2
%  WM1_tsmodel/Coef3
%  WM1_tsmodel/Coef4
%  WM1_tsmodel/Coef5
%  WM1_tsmodel/Freq1
%  WM1_tsmodel/Freq2
%  WM1_tsmodel/Damp1
%  WM1_tsmodel/Damp2
%  WM1_tsmodel/MSE
%  WM1_tsmodel/MAE
%  WM1_tsmodel/AIC
%  WM1_tsmodel/Mean
%  WM1_tsmodel/Variance
%  WM1_tsmodel/RMS
%  WM1_tsmodel/Kurtosis
%  WM2_tsmodel/Coef1
%  WM2_tsmodel/Coef2
%  WM2_tsmodel/Coef3
%  WM2_tsmodel/Coef4
%  WM2_tsmodel/Coef5
%  WM2_tsmodel/Freq1
%  WM2_tsmodel/Freq2
%  WM2_tsmodel/Damp1
%  WM2_tsmodel/Damp2
%  WM2_tsmodel/MSE
%  WM2_tsmodel/MAE
%  WM2_tsmodel/AIC
%  WM2_tsmodel/Mean
%  WM2_tsmodel/Variance
%  WM2_tsmodel/RMS
%  WM2_tsmodel/Kurtosis
%  WM3_tsmodel/Coef1
%  WM3_tsmodel/Coef2
%  WM3_tsmodel/Coef3
%  WM3_tsmodel/Coef4
%  WM3_tsmodel/Coef5
%  WM3_tsmodel/Freq1
%  WM3_tsmodel/Freq2
%  WM3_tsmodel/Damp1
%  WM3_tsmodel/Damp2
%  WM3_tsmodel/MSE
%  WM3_tsmodel/MAE
%  WM3_tsmodel/AIC
%  WM3_tsmodel/Mean
%  WM3_tsmodel/Variance
%  WM3_tsmodel/RMS
%  WM3_tsmodel/Kurtosis
%  WM4_tsmodel/Coef1
%  WM4_tsmodel/Coef2
%  WM4_tsmodel/Coef3
%  WM4_tsmodel/Coef4
%  WM4_tsmodel/Coef5
%  WM4_tsmodel/Freq1
%  WM4_tsmodel/Freq2
%  WM4_tsmodel/Damp1
%  WM4_tsmodel/Damp2
%  WM4_tsmodel/MSE
%  WM4_tsmodel/MAE
%  WM4_tsmodel/AIC
%  WM4_tsmodel/Mean
%  WM4_tsmodel/Variance
%  WM4_tsmodel/RMS
%  WM4_tsmodel/Kurtosis
%  WM5_tsmodel/Coef1
%  WM5_tsmodel/Coef2
%  WM5_tsmodel/Coef3
%  WM5_tsmodel/Coef4
%  WM5_tsmodel/Coef5
%  WM5_tsmodel/Freq1
%  WM5_tsmodel/Freq2
%  WM5_tsmodel/Damp1
%  WM5_tsmodel/Damp2
%  WM5_tsmodel/MSE
%  WM5_tsmodel/MAE
%  WM5_tsmodel/AIC
%  WM5_tsmodel/Mean
%  WM5_tsmodel/Variance
%  WM5_tsmodel/RMS
%  WM5_tsmodel/Kurtosis
%  ATM_TEMP_01_tsfeat/Minimum
%  ATM_TEMP_01_tsfeat/Median
%  ATM_TEMP_01_tsfeat/Maximum
%  ATM_TEMP_01_tsfeat/Q1
%  ATM_TEMP_01_tsfeat/Q3
%  ATM_TEMP_01_tsfeat/IQR
%  ATM_TEMP_01_tsfeat/q1
%  ATM_TEMP_01_tsfeat/ACF1
%  ATM_TEMP_01_tsfeat/ssACF10
%  ATM_TEMP_01_tsfeat/PACF1
%  ATM_TEMP_01_tsfeat/ssPACF5
%  ATM_HUM_01_tsfeat/Minimum
%  ATM_HUM_01_tsfeat/Median
%  ATM_HUM_01_tsfeat/Maximum
%  ATM_HUM_01_tsfeat/Q1
%  ATM_HUM_01_tsfeat/Q3
%  ATM_HUM_01_tsfeat/IQR
%  ATM_HUM_01_tsfeat/q1
%  ATM_HUM_01_tsfeat/ACF1
%  ATM_HUM_01_tsfeat/ssACF10
%  ATM_HUM_01_tsfeat/PACF1
%  ATM_HUM_01_tsfeat/ssPACF5
%  GEN_ACC_XX_01_tsfeat/Minimum
%  GEN_ACC_XX_01_tsfeat/Median
%  GEN_ACC_XX_01_tsfeat/Maximum
%  GEN_ACC_XX_01_tsfeat/Q1
%  GEN_ACC_XX_01_tsfeat/Q3
%  GEN_ACC_XX_01_tsfeat/IQR
%  GEN_ACC_XX_01_tsfeat/q1
%  GEN_ACC_XX_01_tsfeat/ACF1
%  GEN_ACC_XX_01_tsfeat/ssACF10
%  GEN_ACC_XX_01_tsfeat/PACF1
%  GEN_ACC_XX_01_tsfeat/ssPACF5
%  GEN_ACC_YY_01_tsfeat/Minimum
%  GEN_ACC_YY_01_tsfeat/Median
%  GEN_ACC_YY_01_tsfeat/Maximum
%  GEN_ACC_YY_01_tsfeat/Q1
%  GEN_ACC_YY_01_tsfeat/Q3
%  GEN_ACC_YY_01_tsfeat/IQR
%  GEN_ACC_YY_01_tsfeat/q1
%  GEN_ACC_YY_01_tsfeat/ACF1
%  GEN_ACC_YY_01_tsfeat/ssACF10
%  GEN_ACC_YY_01_tsfeat/PACF1
%  GEN_ACC_YY_01_tsfeat/ssPACF5
%  GEN_ACC_ZZ_01_tsfeat/Minimum
%  GEN_ACC_ZZ_01_tsfeat/Median
%  GEN_ACC_ZZ_01_tsfeat/Maximum
%  GEN_ACC_ZZ_01_tsfeat/Q1
%  GEN_ACC_ZZ_01_tsfeat/Q3
%  GEN_ACC_ZZ_01_tsfeat/IQR
%  GEN_ACC_ZZ_01_tsfeat/q1
%  GEN_ACC_ZZ_01_tsfeat/ACF1
%  GEN_ACC_ZZ_01_tsfeat/ssACF10
%  GEN_ACC_ZZ_01_tsfeat/PACF1
%  GEN_ACC_ZZ_01_tsfeat/ssPACF5
%  L1_FBSG_01_tsfeat/Minimum
%  L1_FBSG_01_tsfeat/Median
%  L1_FBSG_01_tsfeat/Maximum
%  L1_FBSG_01_tsfeat/Q1
%  L1_FBSG_01_tsfeat/Q3
%  L1_FBSG_01_tsfeat/IQR
%  L1_FBSG_01_tsfeat/q1
%  L1_FBSG_01_tsfeat/ACF1
%  L1_FBSG_01_tsfeat/ssACF10
%  L1_FBSG_01_tsfeat/PACF1
%  L1_FBSG_01_tsfeat/ssPACF5
%  L1_FBSG_02_tsfeat/Minimum
%  L1_FBSG_02_tsfeat/Median
%  L1_FBSG_02_tsfeat/Maximum
%  L1_FBSG_02_tsfeat/Q1
%  L1_FBSG_02_tsfeat/Q3
%  L1_FBSG_02_tsfeat/IQR
%  L1_FBSG_02_tsfeat/q1
%  L1_FBSG_02_tsfeat/ACF1
%  L1_FBSG_02_tsfeat/ssACF10
%  L1_FBSG_02_tsfeat/PACF1
%  L1_FBSG_02_tsfeat/ssPACF5
%  L3_ACC_XX_01_tsfeat/Minimum
%  L3_ACC_XX_01_tsfeat/Median
%  L3_ACC_XX_01_tsfeat/Maximum
%  L3_ACC_XX_01_tsfeat/Q1
%  L3_ACC_XX_01_tsfeat/Q3
%  L3_ACC_XX_01_tsfeat/IQR
%  L3_ACC_XX_01_tsfeat/q1
%  L3_ACC_XX_01_tsfeat/ACF1
%  L3_ACC_XX_01_tsfeat/ssACF10
%  L3_ACC_XX_01_tsfeat/PACF1
%  L3_ACC_XX_01_tsfeat/ssPACF5
%  L3_ACC_XX_02_tsfeat/Minimum
%  L3_ACC_XX_02_tsfeat/Median
%  L3_ACC_XX_02_tsfeat/Maximum
%  L3_ACC_XX_02_tsfeat/Q1
%  L3_ACC_XX_02_tsfeat/Q3
%  L3_ACC_XX_02_tsfeat/IQR
%  L3_ACC_XX_02_tsfeat/q1
%  L3_ACC_XX_02_tsfeat/ACF1
%  L3_ACC_XX_02_tsfeat/ssACF10
%  L3_ACC_XX_02_tsfeat/PACF1
%  L3_ACC_XX_02_tsfeat/ssPACF5
%  L3_ACC_YY_01_tsfeat/Minimum
%  L3_ACC_YY_01_tsfeat/Median
%  L3_ACC_YY_01_tsfeat/Maximum
%  L3_ACC_YY_01_tsfeat/Q1
%  L3_ACC_YY_01_tsfeat/Q3
%  L3_ACC_YY_01_tsfeat/IQR
%  L3_ACC_YY_01_tsfeat/q1
%  L3_ACC_YY_01_tsfeat/ACF1
%  L3_ACC_YY_01_tsfeat/ssACF10
%  L3_ACC_YY_01_tsfeat/PACF1
%  L3_ACC_YY_01_tsfeat/ssPACF5
%  L3_ACC_YY_02_tsfeat/Minimum
%  L3_ACC_YY_02_tsfeat/Median
%  L3_ACC_YY_02_tsfeat/Maximum
%  L3_ACC_YY_02_tsfeat/Q1
%  L3_ACC_YY_02_tsfeat/Q3
%  L3_ACC_YY_02_tsfeat/IQR
%  L3_ACC_YY_02_tsfeat/q1
%  L3_ACC_YY_02_tsfeat/ACF1
%  L3_ACC_YY_02_tsfeat/ssACF10
%  L3_ACC_YY_02_tsfeat/PACF1
%  L3_ACC_YY_02_tsfeat/ssPACF5
%  L4_ACC_XX_01_tsfeat/Minimum
%  L4_ACC_XX_01_tsfeat/Median
%  L4_ACC_XX_01_tsfeat/Maximum
%  L4_ACC_XX_01_tsfeat/Q1
%  L4_ACC_XX_01_tsfeat/Q3
%  L4_ACC_XX_01_tsfeat/IQR
%  L4_ACC_XX_01_tsfeat/q1
%  L4_ACC_XX_01_tsfeat/ACF1
%  L4_ACC_XX_01_tsfeat/ssACF10
%  L4_ACC_XX_01_tsfeat/PACF1
%  L4_ACC_XX_01_tsfeat/ssPACF5
%  L4_ACC_XX_02_tsfeat/Minimum
%  L4_ACC_XX_02_tsfeat/Median
%  L4_ACC_XX_02_tsfeat/Maximum
%  L4_ACC_XX_02_tsfeat/Q1
%  L4_ACC_XX_02_tsfeat/Q3
%  L4_ACC_XX_02_tsfeat/IQR
%  L4_ACC_XX_02_tsfeat/q1
%  L4_ACC_XX_02_tsfeat/ACF1
%  L4_ACC_XX_02_tsfeat/ssACF10
%  L4_ACC_XX_02_tsfeat/PACF1
%  L4_ACC_XX_02_tsfeat/ssPACF5
%  L4_ACC_YY_01_tsfeat/Minimum
%  L4_ACC_YY_01_tsfeat/Median
%  L4_ACC_YY_01_tsfeat/Maximum
%  L4_ACC_YY_01_tsfeat/Q1
%  L4_ACC_YY_01_tsfeat/Q3
%  L4_ACC_YY_01_tsfeat/IQR
%  L4_ACC_YY_01_tsfeat/q1
%  L4_ACC_YY_01_tsfeat/ACF1
%  L4_ACC_YY_01_tsfeat/ssACF10
%  L4_ACC_YY_01_tsfeat/PACF1
%  L4_ACC_YY_01_tsfeat/ssPACF5
%  L4_ACC_YY_02_tsfeat/Minimum
%  L4_ACC_YY_02_tsfeat/Median
%  L4_ACC_YY_02_tsfeat/Maximum
%  L4_ACC_YY_02_tsfeat/Q1
%  L4_ACC_YY_02_tsfeat/Q3
%  L4_ACC_YY_02_tsfeat/IQR
%  L4_ACC_YY_02_tsfeat/q1
%  L4_ACC_YY_02_tsfeat/ACF1
%  L4_ACC_YY_02_tsfeat/ssACF10
%  L4_ACC_YY_02_tsfeat/PACF1
%  L4_ACC_YY_02_tsfeat/ssPACF5
%  L4_INC_XX_01_tsfeat/Minimum
%  L4_INC_XX_01_tsfeat/Median
%  L4_INC_XX_01_tsfeat/Maximum
%  L4_INC_XX_01_tsfeat/Q1
%  L4_INC_XX_01_tsfeat/Q3
%  L4_INC_XX_01_tsfeat/IQR
%  L4_INC_XX_01_tsfeat/q1
%  L4_INC_XX_01_tsfeat/ACF1
%  L4_INC_XX_01_tsfeat/ssACF10
%  L4_INC_XX_01_tsfeat/PACF1
%  L4_INC_XX_01_tsfeat/ssPACF5
%  L4_INC_YY_01_tsfeat/Minimum
%  L4_INC_YY_01_tsfeat/Median
%  L4_INC_YY_01_tsfeat/Maximum
%  L4_INC_YY_01_tsfeat/Q1
%  L4_INC_YY_01_tsfeat/Q3
%  L4_INC_YY_01_tsfeat/IQR
%  L4_INC_YY_01_tsfeat/q1
%  L4_INC_YY_01_tsfeat/ACF1
%  L4_INC_YY_01_tsfeat/ssACF10
%  L4_INC_YY_01_tsfeat/PACF1
%  L4_INC_YY_01_tsfeat/ssPACF5
%  L5_ACC_XX_01_tsfeat/Minimum
%  L5_ACC_XX_01_tsfeat/Median
%  L5_ACC_XX_01_tsfeat/Maximum
%  L5_ACC_XX_01_tsfeat/Q1
%  L5_ACC_XX_01_tsfeat/Q3
%  L5_ACC_XX_01_tsfeat/IQR
%  L5_ACC_XX_01_tsfeat/q1
%  L5_ACC_XX_01_tsfeat/ACF1
%  L5_ACC_XX_01_tsfeat/ssACF10
%  L5_ACC_XX_01_tsfeat/PACF1
%  L5_ACC_XX_01_tsfeat/ssPACF5
%  L5_ACC_XX_02_tsfeat/Minimum
%  L5_ACC_XX_02_tsfeat/Median
%  L5_ACC_XX_02_tsfeat/Maximum
%  L5_ACC_XX_02_tsfeat/Q1
%  L5_ACC_XX_02_tsfeat/Q3
%  L5_ACC_XX_02_tsfeat/IQR
%  L5_ACC_XX_02_tsfeat/q1
%  L5_ACC_XX_02_tsfeat/ACF1
%  L5_ACC_XX_02_tsfeat/ssACF10
%  L5_ACC_XX_02_tsfeat/PACF1
%  L5_ACC_XX_02_tsfeat/ssPACF5
%  L5_ACC_YY_01_tsfeat/Minimum
%  L5_ACC_YY_01_tsfeat/Median
%  L5_ACC_YY_01_tsfeat/Maximum
%  L5_ACC_YY_01_tsfeat/Q1
%  L5_ACC_YY_01_tsfeat/Q3
%  L5_ACC_YY_01_tsfeat/IQR
%  L5_ACC_YY_01_tsfeat/q1
%  L5_ACC_YY_01_tsfeat/ACF1
%  L5_ACC_YY_01_tsfeat/ssACF10
%  L5_ACC_YY_01_tsfeat/PACF1
%  L5_ACC_YY_01_tsfeat/ssPACF5
%  L5_ACC_YY_02_tsfeat/Minimum
%  L5_ACC_YY_02_tsfeat/Median
%  L5_ACC_YY_02_tsfeat/Maximum
%  L5_ACC_YY_02_tsfeat/Q1
%  L5_ACC_YY_02_tsfeat/Q3
%  L5_ACC_YY_02_tsfeat/IQR
%  L5_ACC_YY_02_tsfeat/q1
%  L5_ACC_YY_02_tsfeat/ACF1
%  L5_ACC_YY_02_tsfeat/ssACF10
%  L5_ACC_YY_02_tsfeat/PACF1
%  L5_ACC_YY_02_tsfeat/ssPACF5
%  L5_INC_XX_01_tsfeat/Minimum
%  L5_INC_XX_01_tsfeat/Median
%  L5_INC_XX_01_tsfeat/Maximum
%  L5_INC_XX_01_tsfeat/Q1
%  L5_INC_XX_01_tsfeat/Q3
%  L5_INC_XX_01_tsfeat/IQR
%  L5_INC_XX_01_tsfeat/q1
%  L5_INC_XX_01_tsfeat/ACF1
%  L5_INC_XX_01_tsfeat/ssACF10
%  L5_INC_XX_01_tsfeat/PACF1
%  L5_INC_XX_01_tsfeat/ssPACF5
%  L5_INC_YY_01_tsfeat/Minimum
%  L5_INC_YY_01_tsfeat/Median
%  L5_INC_YY_01_tsfeat/Maximum
%  L5_INC_YY_01_tsfeat/Q1
%  L5_INC_YY_01_tsfeat/Q3
%  L5_INC_YY_01_tsfeat/IQR
%  L5_INC_YY_01_tsfeat/q1
%  L5_INC_YY_01_tsfeat/ACF1
%  L5_INC_YY_01_tsfeat/ssACF10
%  L5_INC_YY_01_tsfeat/PACF1
%  L5_INC_YY_01_tsfeat/ssPACF5
%  MSB_ACC_XX_01_tsfeat/Minimum
%  MSB_ACC_XX_01_tsfeat/Median
%  MSB_ACC_XX_01_tsfeat/Maximum
%  MSB_ACC_XX_01_tsfeat/Q1
%  MSB_ACC_XX_01_tsfeat/Q3
%  MSB_ACC_XX_01_tsfeat/IQR
%  MSB_ACC_XX_01_tsfeat/q1
%  MSB_ACC_XX_01_tsfeat/ACF1
%  MSB_ACC_XX_01_tsfeat/ssACF10
%  MSB_ACC_XX_01_tsfeat/PACF1
%  MSB_ACC_XX_01_tsfeat/ssPACF5
%  MSB_ACC_ZZ_02_tsfeat/Minimum
%  MSB_ACC_ZZ_02_tsfeat/Median
%  MSB_ACC_ZZ_02_tsfeat/Maximum
%  MSB_ACC_ZZ_02_tsfeat/Q1
%  MSB_ACC_ZZ_02_tsfeat/Q3
%  MSB_ACC_ZZ_02_tsfeat/IQR
%  MSB_ACC_ZZ_02_tsfeat/q1
%  MSB_ACC_ZZ_02_tsfeat/ACF1
%  MSB_ACC_ZZ_02_tsfeat/ssACF10
%  MSB_ACC_ZZ_02_tsfeat/PACF1
%  MSB_ACC_ZZ_02_tsfeat/ssPACF5
%  MSH_ACC_XX_01_tsfeat/Minimum
%  MSH_ACC_XX_01_tsfeat/Median
%  MSH_ACC_XX_01_tsfeat/Maximum
%  MSH_ACC_XX_01_tsfeat/Q1
%  MSH_ACC_XX_01_tsfeat/Q3
%  MSH_ACC_XX_01_tsfeat/IQR
%  MSH_ACC_XX_01_tsfeat/q1
%  MSH_ACC_XX_01_tsfeat/ACF1
%  MSH_ACC_XX_01_tsfeat/ssACF10
%  MSH_ACC_XX_01_tsfeat/PACF1
%  MSH_ACC_XX_01_tsfeat/ssPACF5
%  MSH_ACC_ZZ_01_tsfeat/Minimum
%  MSH_ACC_ZZ_01_tsfeat/Median
%  MSH_ACC_ZZ_01_tsfeat/Maximum
%  MSH_ACC_ZZ_01_tsfeat/Q1
%  MSH_ACC_ZZ_01_tsfeat/Q3
%  MSH_ACC_ZZ_01_tsfeat/IQR
%  MSH_ACC_ZZ_01_tsfeat/q1
%  MSH_ACC_ZZ_01_tsfeat/ACF1
%  MSH_ACC_ZZ_01_tsfeat/ssACF10
%  MSH_ACC_ZZ_01_tsfeat/PACF1
%  MSH_ACC_ZZ_01_tsfeat/ssPACF5
%  NMF_ACC_XX_02_tsfeat/Minimum
%  NMF_ACC_XX_02_tsfeat/Median
%  NMF_ACC_XX_02_tsfeat/Maximum
%  NMF_ACC_XX_02_tsfeat/Q1
%  NMF_ACC_XX_02_tsfeat/Q3
%  NMF_ACC_XX_02_tsfeat/IQR
%  NMF_ACC_XX_02_tsfeat/q1
%  NMF_ACC_XX_02_tsfeat/ACF1
%  NMF_ACC_XX_02_tsfeat/ssACF10
%  NMF_ACC_XX_02_tsfeat/PACF1
%  NMF_ACC_XX_02_tsfeat/ssPACF5
%  NMF_ACC_YY_01_tsfeat/Minimum
%  NMF_ACC_YY_01_tsfeat/Median
%  NMF_ACC_YY_01_tsfeat/Maximum
%  NMF_ACC_YY_01_tsfeat/Q1
%  NMF_ACC_YY_01_tsfeat/Q3
%  NMF_ACC_YY_01_tsfeat/IQR
%  NMF_ACC_YY_01_tsfeat/q1
%  NMF_ACC_YY_01_tsfeat/ACF1
%  NMF_ACC_YY_01_tsfeat/ssACF10
%  NMF_ACC_YY_01_tsfeat/PACF1
%  NMF_ACC_YY_01_tsfeat/ssPACF5
%  NMF_ACC_YY_02_tsfeat/Minimum
%  NMF_ACC_YY_02_tsfeat/Median
%  NMF_ACC_YY_02_tsfeat/Maximum
%  NMF_ACC_YY_02_tsfeat/Q1
%  NMF_ACC_YY_02_tsfeat/Q3
%  NMF_ACC_YY_02_tsfeat/IQR
%  NMF_ACC_YY_02_tsfeat/q1
%  NMF_ACC_YY_02_tsfeat/ACF1
%  NMF_ACC_YY_02_tsfeat/ssACF10
%  NMF_ACC_YY_02_tsfeat/PACF1
%  NMF_ACC_YY_02_tsfeat/ssPACF5
%  WM1_tsfeat/Minimum
%  WM1_tsfeat/Median
%  WM1_tsfeat/Maximum
%  WM1_tsfeat/Q1
%  WM1_tsfeat/Q3
%  WM1_tsfeat/IQR
%  WM1_tsfeat/q1
%  WM1_tsfeat/ACF1
%  WM1_tsfeat/ssACF10
%  WM1_tsfeat/PACF1
%  WM1_tsfeat/ssPACF5
%  WM2_tsfeat/Minimum
%  WM2_tsfeat/Median
%  WM2_tsfeat/Maximum
%  WM2_tsfeat/Q1
%  WM2_tsfeat/Q3
%  WM2_tsfeat/IQR
%  WM2_tsfeat/q1
%  WM2_tsfeat/ACF1
%  WM2_tsfeat/ssACF10
%  WM2_tsfeat/PACF1
%  WM2_tsfeat/ssPACF5
%  WM3_tsfeat/Minimum
%  WM3_tsfeat/Median
%  WM3_tsfeat/Maximum
%  WM3_tsfeat/Q1
%  WM3_tsfeat/Q3
%  WM3_tsfeat/IQR
%  WM3_tsfeat/q1
%  WM3_tsfeat/ACF1
%  WM3_tsfeat/ssACF10
%  WM3_tsfeat/PACF1
%  WM3_tsfeat/ssPACF5
%  WM4_tsfeat/Minimum
%  WM4_tsfeat/Median
%  WM4_tsfeat/Maximum
%  WM4_tsfeat/Q1
%  WM4_tsfeat/Q3
%  WM4_tsfeat/IQR
%  WM4_tsfeat/q1
%  WM4_tsfeat/ACF1
%  WM4_tsfeat/ssACF10
%  WM4_tsfeat/PACF1
%  WM4_tsfeat/ssPACF5
%  WM5_tsfeat/Minimum
%  WM5_tsfeat/Median
%  WM5_tsfeat/Maximum
%  WM5_tsfeat/Q1
%  WM5_tsfeat/Q3
%  WM5_tsfeat/IQR
%  WM5_tsfeat/q1
%  WM5_tsfeat/ACF1
%  WM5_tsfeat/ssACF10
%  WM5_tsfeat/PACF1
%  WM5_tsfeat/ssPACF5
%  ATM_TEMP_01_sigstats/ClearanceFactor
%  ATM_TEMP_01_sigstats/CrestFactor
%  ATM_TEMP_01_sigstats/ImpulseFactor
%  ATM_TEMP_01_sigstats/Kurtosis
%  ATM_TEMP_01_sigstats/Mean
%  ATM_TEMP_01_sigstats/PeakValue
%  ATM_TEMP_01_sigstats/RMS
%  ATM_TEMP_01_sigstats/SINAD
%  ATM_TEMP_01_sigstats/SNR
%  ATM_TEMP_01_sigstats/ShapeFactor
%  ATM_TEMP_01_sigstats/Skewness
%  ATM_TEMP_01_sigstats/Std
%  ATM_TEMP_01_sigstats/THD
%  ATM_HUM_01_sigstats/ClearanceFactor
%  ATM_HUM_01_sigstats/CrestFactor
%  ATM_HUM_01_sigstats/ImpulseFactor
%  ATM_HUM_01_sigstats/Kurtosis
%  ATM_HUM_01_sigstats/Mean
%  ATM_HUM_01_sigstats/PeakValue
%  ATM_HUM_01_sigstats/RMS
%  ATM_HUM_01_sigstats/SINAD
%  ATM_HUM_01_sigstats/SNR
%  ATM_HUM_01_sigstats/ShapeFactor
%  ATM_HUM_01_sigstats/Skewness
%  ATM_HUM_01_sigstats/Std
%  ATM_HUM_01_sigstats/THD
%  GEN_ACC_XX_01_sigstats/ClearanceFactor
%  GEN_ACC_XX_01_sigstats/CrestFactor
%  GEN_ACC_XX_01_sigstats/ImpulseFactor
%  GEN_ACC_XX_01_sigstats/Kurtosis
%  GEN_ACC_XX_01_sigstats/Mean
%  GEN_ACC_XX_01_sigstats/PeakValue
%  GEN_ACC_XX_01_sigstats/RMS
%  GEN_ACC_XX_01_sigstats/SINAD
%  GEN_ACC_XX_01_sigstats/SNR
%  GEN_ACC_XX_01_sigstats/ShapeFactor
%  GEN_ACC_XX_01_sigstats/Skewness
%  GEN_ACC_XX_01_sigstats/Std
%  GEN_ACC_XX_01_sigstats/THD
%  GEN_ACC_YY_01_sigstats/ClearanceFactor
%  GEN_ACC_YY_01_sigstats/CrestFactor
%  GEN_ACC_YY_01_sigstats/ImpulseFactor
%  GEN_ACC_YY_01_sigstats/Kurtosis
%  GEN_ACC_YY_01_sigstats/Mean
%  GEN_ACC_YY_01_sigstats/PeakValue
%  GEN_ACC_YY_01_sigstats/RMS
%  GEN_ACC_YY_01_sigstats/SINAD
%  GEN_ACC_YY_01_sigstats/SNR
%  GEN_ACC_YY_01_sigstats/ShapeFactor
%  GEN_ACC_YY_01_sigstats/Skewness
%  GEN_ACC_YY_01_sigstats/Std
%  GEN_ACC_YY_01_sigstats/THD
%  GEN_ACC_ZZ_01_sigstats/ClearanceFactor
%  GEN_ACC_ZZ_01_sigstats/CrestFactor
%  GEN_ACC_ZZ_01_sigstats/ImpulseFactor
%  GEN_ACC_ZZ_01_sigstats/Kurtosis
%  GEN_ACC_ZZ_01_sigstats/Mean
%  GEN_ACC_ZZ_01_sigstats/PeakValue
%  GEN_ACC_ZZ_01_sigstats/RMS
%  GEN_ACC_ZZ_01_sigstats/SINAD
%  GEN_ACC_ZZ_01_sigstats/SNR
%  GEN_ACC_ZZ_01_sigstats/ShapeFactor
%  GEN_ACC_ZZ_01_sigstats/Skewness
%  GEN_ACC_ZZ_01_sigstats/Std
%  GEN_ACC_ZZ_01_sigstats/THD
%  L1_FBSG_01_sigstats/ClearanceFactor
%  L1_FBSG_01_sigstats/CrestFactor
%  L1_FBSG_01_sigstats/ImpulseFactor
%  L1_FBSG_01_sigstats/Kurtosis
%  L1_FBSG_01_sigstats/Mean
%  L1_FBSG_01_sigstats/PeakValue
%  L1_FBSG_01_sigstats/RMS
%  L1_FBSG_01_sigstats/SINAD
%  L1_FBSG_01_sigstats/SNR
%  L1_FBSG_01_sigstats/ShapeFactor
%  L1_FBSG_01_sigstats/Skewness
%  L1_FBSG_01_sigstats/Std
%  L1_FBSG_01_sigstats/THD
%  L1_FBSG_02_sigstats/ClearanceFactor
%  L1_FBSG_02_sigstats/CrestFactor
%  L1_FBSG_02_sigstats/ImpulseFactor
%  L1_FBSG_02_sigstats/Kurtosis
%  L1_FBSG_02_sigstats/Mean
%  L1_FBSG_02_sigstats/PeakValue
%  L1_FBSG_02_sigstats/RMS
%  L1_FBSG_02_sigstats/SINAD
%  L1_FBSG_02_sigstats/SNR
%  L1_FBSG_02_sigstats/ShapeFactor
%  L1_FBSG_02_sigstats/Skewness
%  L1_FBSG_02_sigstats/Std
%  L1_FBSG_02_sigstats/THD
%  L3_ACC_XX_01_sigstats/ClearanceFactor
%  L3_ACC_XX_01_sigstats/CrestFactor
%  L3_ACC_XX_01_sigstats/ImpulseFactor
%  L3_ACC_XX_01_sigstats/Kurtosis
%  L3_ACC_XX_01_sigstats/Mean
%  L3_ACC_XX_01_sigstats/PeakValue
%  L3_ACC_XX_01_sigstats/RMS
%  L3_ACC_XX_01_sigstats/SINAD
%  L3_ACC_XX_01_sigstats/SNR
%  L3_ACC_XX_01_sigstats/ShapeFactor
%  L3_ACC_XX_01_sigstats/Skewness
%  L3_ACC_XX_01_sigstats/Std
%  L3_ACC_XX_01_sigstats/THD
%  L3_ACC_XX_02_sigstats/ClearanceFactor
%  L3_ACC_XX_02_sigstats/CrestFactor
%  L3_ACC_XX_02_sigstats/ImpulseFactor
%  L3_ACC_XX_02_sigstats/Kurtosis
%  L3_ACC_XX_02_sigstats/Mean
%  L3_ACC_XX_02_sigstats/PeakValue
%  L3_ACC_XX_02_sigstats/RMS
%  L3_ACC_XX_02_sigstats/SINAD
%  L3_ACC_XX_02_sigstats/SNR
%  L3_ACC_XX_02_sigstats/ShapeFactor
%  L3_ACC_XX_02_sigstats/Skewness
%  L3_ACC_XX_02_sigstats/Std
%  L3_ACC_XX_02_sigstats/THD
%  L3_ACC_YY_01_sigstats/ClearanceFactor
%  L3_ACC_YY_01_sigstats/CrestFactor
%  L3_ACC_YY_01_sigstats/ImpulseFactor
%  L3_ACC_YY_01_sigstats/Kurtosis
%  L3_ACC_YY_01_sigstats/Mean
%  L3_ACC_YY_01_sigstats/PeakValue
%  L3_ACC_YY_01_sigstats/RMS
%  L3_ACC_YY_01_sigstats/SINAD
%  L3_ACC_YY_01_sigstats/SNR
%  L3_ACC_YY_01_sigstats/ShapeFactor
%  L3_ACC_YY_01_sigstats/Skewness
%  L3_ACC_YY_01_sigstats/Std
%  L3_ACC_YY_01_sigstats/THD
%  L3_ACC_YY_02_sigstats/ClearanceFactor
%  L3_ACC_YY_02_sigstats/CrestFactor
%  L3_ACC_YY_02_sigstats/ImpulseFactor
%  L3_ACC_YY_02_sigstats/Kurtosis
%  L3_ACC_YY_02_sigstats/Mean
%  L3_ACC_YY_02_sigstats/PeakValue
%  L3_ACC_YY_02_sigstats/RMS
%  L3_ACC_YY_02_sigstats/SINAD
%  L3_ACC_YY_02_sigstats/SNR
%  L3_ACC_YY_02_sigstats/ShapeFactor
%  L3_ACC_YY_02_sigstats/Skewness
%  L3_ACC_YY_02_sigstats/Std
%  L3_ACC_YY_02_sigstats/THD
%  L4_ACC_XX_01_sigstats/ClearanceFactor
%  L4_ACC_XX_01_sigstats/CrestFactor
%  L4_ACC_XX_01_sigstats/ImpulseFactor
%  L4_ACC_XX_01_sigstats/Kurtosis
%  L4_ACC_XX_01_sigstats/Mean
%  L4_ACC_XX_01_sigstats/PeakValue
%  L4_ACC_XX_01_sigstats/RMS
%  L4_ACC_XX_01_sigstats/SINAD
%  L4_ACC_XX_01_sigstats/SNR
%  L4_ACC_XX_01_sigstats/ShapeFactor
%  L4_ACC_XX_01_sigstats/Skewness
%  L4_ACC_XX_01_sigstats/Std
%  L4_ACC_XX_01_sigstats/THD
%  L4_ACC_XX_02_sigstats/ClearanceFactor
%  L4_ACC_XX_02_sigstats/CrestFactor
%  L4_ACC_XX_02_sigstats/ImpulseFactor
%  L4_ACC_XX_02_sigstats/Kurtosis
%  L4_ACC_XX_02_sigstats/Mean
%  L4_ACC_XX_02_sigstats/PeakValue
%  L4_ACC_XX_02_sigstats/RMS
%  L4_ACC_XX_02_sigstats/SINAD
%  L4_ACC_XX_02_sigstats/SNR
%  L4_ACC_XX_02_sigstats/ShapeFactor
%  L4_ACC_XX_02_sigstats/Skewness
%  L4_ACC_XX_02_sigstats/Std
%  L4_ACC_XX_02_sigstats/THD
%  L4_ACC_YY_01_sigstats/ClearanceFactor
%  L4_ACC_YY_01_sigstats/CrestFactor
%  L4_ACC_YY_01_sigstats/ImpulseFactor
%  L4_ACC_YY_01_sigstats/Kurtosis
%  L4_ACC_YY_01_sigstats/Mean
%  L4_ACC_YY_01_sigstats/PeakValue
%  L4_ACC_YY_01_sigstats/RMS
%  L4_ACC_YY_01_sigstats/SINAD
%  L4_ACC_YY_01_sigstats/SNR
%  L4_ACC_YY_01_sigstats/ShapeFactor
%  L4_ACC_YY_01_sigstats/Skewness
%  L4_ACC_YY_01_sigstats/Std
%  L4_ACC_YY_01_sigstats/THD
%  L4_ACC_YY_02_sigstats/ClearanceFactor
%  L4_ACC_YY_02_sigstats/CrestFactor
%  L4_ACC_YY_02_sigstats/ImpulseFactor
%  L4_ACC_YY_02_sigstats/Kurtosis
%  L4_ACC_YY_02_sigstats/Mean
%  L4_ACC_YY_02_sigstats/PeakValue
%  L4_ACC_YY_02_sigstats/RMS
%  L4_ACC_YY_02_sigstats/SINAD
%  L4_ACC_YY_02_sigstats/SNR
%  L4_ACC_YY_02_sigstats/ShapeFactor
%  L4_ACC_YY_02_sigstats/Skewness
%  L4_ACC_YY_02_sigstats/Std
%  L4_ACC_YY_02_sigstats/THD
%  L4_INC_XX_01_sigstats/ClearanceFactor
%  L4_INC_XX_01_sigstats/CrestFactor
%  L4_INC_XX_01_sigstats/ImpulseFactor
%  L4_INC_XX_01_sigstats/Kurtosis
%  L4_INC_XX_01_sigstats/Mean
%  L4_INC_XX_01_sigstats/PeakValue
%  L4_INC_XX_01_sigstats/RMS
%  L4_INC_XX_01_sigstats/SINAD
%  L4_INC_XX_01_sigstats/SNR
%  L4_INC_XX_01_sigstats/ShapeFactor
%  L4_INC_XX_01_sigstats/Skewness
%  L4_INC_XX_01_sigstats/Std
%  L4_INC_XX_01_sigstats/THD
%  L4_INC_YY_01_sigstats/ClearanceFactor
%  L4_INC_YY_01_sigstats/CrestFactor
%  L4_INC_YY_01_sigstats/ImpulseFactor
%  L4_INC_YY_01_sigstats/Kurtosis
%  L4_INC_YY_01_sigstats/Mean
%  L4_INC_YY_01_sigstats/PeakValue
%  L4_INC_YY_01_sigstats/RMS
%  L4_INC_YY_01_sigstats/SINAD
%  L4_INC_YY_01_sigstats/SNR
%  L4_INC_YY_01_sigstats/ShapeFactor
%  L4_INC_YY_01_sigstats/Skewness
%  L4_INC_YY_01_sigstats/Std
%  L4_INC_YY_01_sigstats/THD
%  L5_ACC_XX_01_sigstats/ClearanceFactor
%  L5_ACC_XX_01_sigstats/CrestFactor
%  L5_ACC_XX_01_sigstats/ImpulseFactor
%  L5_ACC_XX_01_sigstats/Kurtosis
%  L5_ACC_XX_01_sigstats/Mean
%  L5_ACC_XX_01_sigstats/PeakValue
%  L5_ACC_XX_01_sigstats/RMS
%  L5_ACC_XX_01_sigstats/SINAD
%  L5_ACC_XX_01_sigstats/SNR
%  L5_ACC_XX_01_sigstats/ShapeFactor
%  L5_ACC_XX_01_sigstats/Skewness
%  L5_ACC_XX_01_sigstats/Std
%  L5_ACC_XX_01_sigstats/THD
%  L5_ACC_XX_02_sigstats/ClearanceFactor
%  L5_ACC_XX_02_sigstats/CrestFactor
%  L5_ACC_XX_02_sigstats/ImpulseFactor
%  L5_ACC_XX_02_sigstats/Kurtosis
%  L5_ACC_XX_02_sigstats/Mean
%  L5_ACC_XX_02_sigstats/PeakValue
%  L5_ACC_XX_02_sigstats/RMS
%  L5_ACC_XX_02_sigstats/SINAD
%  L5_ACC_XX_02_sigstats/SNR
%  L5_ACC_XX_02_sigstats/ShapeFactor
%  L5_ACC_XX_02_sigstats/Skewness
%  L5_ACC_XX_02_sigstats/Std
%  L5_ACC_XX_02_sigstats/THD
%  L5_ACC_YY_01_sigstats/ClearanceFactor
%  L5_ACC_YY_01_sigstats/CrestFactor
%  L5_ACC_YY_01_sigstats/ImpulseFactor
%  L5_ACC_YY_01_sigstats/Kurtosis
%  L5_ACC_YY_01_sigstats/Mean
%  L5_ACC_YY_01_sigstats/PeakValue
%  L5_ACC_YY_01_sigstats/RMS
%  L5_ACC_YY_01_sigstats/SINAD
%  L5_ACC_YY_01_sigstats/SNR
%  L5_ACC_YY_01_sigstats/ShapeFactor
%  L5_ACC_YY_01_sigstats/Skewness
%  L5_ACC_YY_01_sigstats/Std
%  L5_ACC_YY_01_sigstats/THD
%  L5_ACC_YY_02_sigstats/ClearanceFactor
%  L5_ACC_YY_02_sigstats/CrestFactor
%  L5_ACC_YY_02_sigstats/ImpulseFactor
%  L5_ACC_YY_02_sigstats/Kurtosis
%  L5_ACC_YY_02_sigstats/Mean
%  L5_ACC_YY_02_sigstats/PeakValue
%  L5_ACC_YY_02_sigstats/RMS
%  L5_ACC_YY_02_sigstats/SINAD
%  L5_ACC_YY_02_sigstats/SNR
%  L5_ACC_YY_02_sigstats/ShapeFactor
%  L5_ACC_YY_02_sigstats/Skewness
%  L5_ACC_YY_02_sigstats/Std
%  L5_ACC_YY_02_sigstats/THD
%  L5_INC_XX_01_sigstats/ClearanceFactor
%  L5_INC_XX_01_sigstats/CrestFactor
%  L5_INC_XX_01_sigstats/ImpulseFactor
%  L5_INC_XX_01_sigstats/Kurtosis
%  L5_INC_XX_01_sigstats/Mean
%  L5_INC_XX_01_sigstats/PeakValue
%  L5_INC_XX_01_sigstats/RMS
%  L5_INC_XX_01_sigstats/SINAD
%  L5_INC_XX_01_sigstats/SNR
%  L5_INC_XX_01_sigstats/ShapeFactor
%  L5_INC_XX_01_sigstats/Skewness
%  L5_INC_XX_01_sigstats/Std
%  L5_INC_XX_01_sigstats/THD
%  L5_INC_YY_01_sigstats/ClearanceFactor
%  L5_INC_YY_01_sigstats/CrestFactor
%  L5_INC_YY_01_sigstats/ImpulseFactor
%  L5_INC_YY_01_sigstats/Kurtosis
%  L5_INC_YY_01_sigstats/Mean
%  L5_INC_YY_01_sigstats/PeakValue
%  L5_INC_YY_01_sigstats/RMS
%  L5_INC_YY_01_sigstats/SINAD
%  L5_INC_YY_01_sigstats/SNR
%  L5_INC_YY_01_sigstats/ShapeFactor
%  L5_INC_YY_01_sigstats/Skewness
%  L5_INC_YY_01_sigstats/Std
%  L5_INC_YY_01_sigstats/THD
%  MSB_ACC_XX_01_sigstats/ClearanceFactor
%  MSB_ACC_XX_01_sigstats/CrestFactor
%  MSB_ACC_XX_01_sigstats/ImpulseFactor
%  MSB_ACC_XX_01_sigstats/Kurtosis
%  MSB_ACC_XX_01_sigstats/Mean
%  MSB_ACC_XX_01_sigstats/PeakValue
%  MSB_ACC_XX_01_sigstats/RMS
%  MSB_ACC_XX_01_sigstats/SINAD
%  MSB_ACC_XX_01_sigstats/SNR
%  MSB_ACC_XX_01_sigstats/ShapeFactor
%  MSB_ACC_XX_01_sigstats/Skewness
%  MSB_ACC_XX_01_sigstats/Std
%  MSB_ACC_XX_01_sigstats/THD
%  MSB_ACC_ZZ_02_sigstats/ClearanceFactor
%  MSB_ACC_ZZ_02_sigstats/CrestFactor
%  MSB_ACC_ZZ_02_sigstats/ImpulseFactor
%  MSB_ACC_ZZ_02_sigstats/Kurtosis
%  MSB_ACC_ZZ_02_sigstats/Mean
%  MSB_ACC_ZZ_02_sigstats/PeakValue
%  MSB_ACC_ZZ_02_sigstats/RMS
%  MSB_ACC_ZZ_02_sigstats/SINAD
%  MSB_ACC_ZZ_02_sigstats/SNR
%  MSB_ACC_ZZ_02_sigstats/ShapeFactor
%  MSB_ACC_ZZ_02_sigstats/Skewness
%  MSB_ACC_ZZ_02_sigstats/Std
%  MSB_ACC_ZZ_02_sigstats/THD
%  MSH_ACC_XX_01_sigstats/ClearanceFactor
%  MSH_ACC_XX_01_sigstats/CrestFactor
%  MSH_ACC_XX_01_sigstats/ImpulseFactor
%  MSH_ACC_XX_01_sigstats/Kurtosis
%  MSH_ACC_XX_01_sigstats/Mean
%  MSH_ACC_XX_01_sigstats/PeakValue
%  MSH_ACC_XX_01_sigstats/RMS
%  MSH_ACC_XX_01_sigstats/SINAD
%  MSH_ACC_XX_01_sigstats/SNR
%  MSH_ACC_XX_01_sigstats/ShapeFactor
%  MSH_ACC_XX_01_sigstats/Skewness
%  MSH_ACC_XX_01_sigstats/Std
%  MSH_ACC_XX_01_sigstats/THD
%  MSH_ACC_ZZ_01_sigstats/ClearanceFactor
%  MSH_ACC_ZZ_01_sigstats/CrestFactor
%  MSH_ACC_ZZ_01_sigstats/ImpulseFactor
%  MSH_ACC_ZZ_01_sigstats/Kurtosis
%  MSH_ACC_ZZ_01_sigstats/Mean
%  MSH_ACC_ZZ_01_sigstats/PeakValue
%  MSH_ACC_ZZ_01_sigstats/RMS
%  MSH_ACC_ZZ_01_sigstats/SINAD
%  MSH_ACC_ZZ_01_sigstats/SNR
%  MSH_ACC_ZZ_01_sigstats/ShapeFactor
%  MSH_ACC_ZZ_01_sigstats/Skewness
%  MSH_ACC_ZZ_01_sigstats/Std
%  MSH_ACC_ZZ_01_sigstats/THD
%  NMF_ACC_XX_02_sigstats/ClearanceFactor
%  NMF_ACC_XX_02_sigstats/CrestFactor
%  NMF_ACC_XX_02_sigstats/ImpulseFactor
%  NMF_ACC_XX_02_sigstats/Kurtosis
%  NMF_ACC_XX_02_sigstats/Mean
%  NMF_ACC_XX_02_sigstats/PeakValue
%  NMF_ACC_XX_02_sigstats/RMS
%  NMF_ACC_XX_02_sigstats/SINAD
%  NMF_ACC_XX_02_sigstats/SNR
%  NMF_ACC_XX_02_sigstats/ShapeFactor
%  NMF_ACC_XX_02_sigstats/Skewness
%  NMF_ACC_XX_02_sigstats/Std
%  NMF_ACC_XX_02_sigstats/THD
%  NMF_ACC_YY_01_sigstats/ClearanceFactor
%  NMF_ACC_YY_01_sigstats/CrestFactor
%  NMF_ACC_YY_01_sigstats/ImpulseFactor
%  NMF_ACC_YY_01_sigstats/Kurtosis
%  NMF_ACC_YY_01_sigstats/Mean
%  NMF_ACC_YY_01_sigstats/PeakValue
%  NMF_ACC_YY_01_sigstats/RMS
%  NMF_ACC_YY_01_sigstats/SINAD
%  NMF_ACC_YY_01_sigstats/SNR
%  NMF_ACC_YY_01_sigstats/ShapeFactor
%  NMF_ACC_YY_01_sigstats/Skewness
%  NMF_ACC_YY_01_sigstats/Std
%  NMF_ACC_YY_01_sigstats/THD
%  NMF_ACC_YY_02_sigstats/ClearanceFactor
%  NMF_ACC_YY_02_sigstats/CrestFactor
%  NMF_ACC_YY_02_sigstats/ImpulseFactor
%  NMF_ACC_YY_02_sigstats/Kurtosis
%  NMF_ACC_YY_02_sigstats/Mean
%  NMF_ACC_YY_02_sigstats/PeakValue
%  NMF_ACC_YY_02_sigstats/RMS
%  NMF_ACC_YY_02_sigstats/SINAD
%  NMF_ACC_YY_02_sigstats/SNR
%  NMF_ACC_YY_02_sigstats/ShapeFactor
%  NMF_ACC_YY_02_sigstats/Skewness
%  NMF_ACC_YY_02_sigstats/Std
%  NMF_ACC_YY_02_sigstats/THD
%  WM1_sigstats/ClearanceFactor
%  WM1_sigstats/CrestFactor
%  WM1_sigstats/ImpulseFactor
%  WM1_sigstats/Kurtosis
%  WM1_sigstats/Mean
%  WM1_sigstats/PeakValue
%  WM1_sigstats/RMS
%  WM1_sigstats/SINAD
%  WM1_sigstats/SNR
%  WM1_sigstats/ShapeFactor
%  WM1_sigstats/Skewness
%  WM1_sigstats/Std
%  WM1_sigstats/THD
%  WM2_sigstats/ClearanceFactor
%  WM2_sigstats/CrestFactor
%  WM2_sigstats/ImpulseFactor
%  WM2_sigstats/Kurtosis
%  WM2_sigstats/Mean
%  WM2_sigstats/PeakValue
%  WM2_sigstats/RMS
%  WM2_sigstats/SINAD
%  WM2_sigstats/SNR
%  WM2_sigstats/ShapeFactor
%  WM2_sigstats/Skewness
%  WM2_sigstats/Std
%  WM2_sigstats/THD
%  WM3_sigstats/ClearanceFactor
%  WM3_sigstats/CrestFactor
%  WM3_sigstats/ImpulseFactor
%  WM3_sigstats/Kurtosis
%  WM3_sigstats/Mean
%  WM3_sigstats/PeakValue
%  WM3_sigstats/RMS
%  WM3_sigstats/SINAD
%  WM3_sigstats/SNR
%  WM3_sigstats/ShapeFactor
%  WM3_sigstats/Skewness
%  WM3_sigstats/Std
%  WM3_sigstats/THD
%  WM4_sigstats/ClearanceFactor
%  WM4_sigstats/CrestFactor
%  WM4_sigstats/ImpulseFactor
%  WM4_sigstats/Kurtosis
%  WM4_sigstats/Mean
%  WM4_sigstats/PeakValue
%  WM4_sigstats/RMS
%  WM4_sigstats/SINAD
%  WM4_sigstats/SNR
%  WM4_sigstats/ShapeFactor
%  WM4_sigstats/Skewness
%  WM4_sigstats/Std
%  WM4_sigstats/THD
%  WM5_sigstats/ClearanceFactor
%  WM5_sigstats/CrestFactor
%  WM5_sigstats/ImpulseFactor
%  WM5_sigstats/Kurtosis
%  WM5_sigstats/Mean
%  WM5_sigstats/PeakValue
%  WM5_sigstats/RMS
%  WM5_sigstats/SINAD
%  WM5_sigstats/SNR
%  WM5_sigstats/ShapeFactor
%  WM5_sigstats/Skewness
%  WM5_sigstats/Std
%  WM5_sigstats/THD
%
% Organization of the function:
% 1. Compute signals/spectra/features
% 2. Extract computed features into a table
%
% Modify the function to add or remove data processing, feature generation
% or ranking operations.

% Auto-generated by MATLAB on 03-Nov-2024 19:54:23

% Create output ensemble.
outputEnsemble = workspaceEnsemble(inputData,'DataVariables',["ATM_TEMP_01";"ATM_HUM_01";"GEN_ACC_XX_01";"GEN_ACC_YY_01";"GEN_ACC_ZZ_01";"L1_FBSG_01";"L1_FBSG_02";"L3_ACC_XX_01";"L3_ACC_XX_02";"L3_ACC_YY_01";"L3_ACC_YY_02";"L4_ACC_XX_01";"L4_ACC_XX_02";"L4_ACC_YY_01";"L4_ACC_YY_02";"L4_INC_XX_01";"L4_INC_YY_01";"L5_ACC_XX_01";"L5_ACC_XX_02";"L5_ACC_YY_01";"L5_ACC_YY_02";"L5_INC_XX_01";"L5_INC_YY_01";"MSB_ACC_XX_01";"MSB_ACC_ZZ_02";"MSH_ACC_XX_01";"MSH_ACC_ZZ_01";"NMF_ACC_XX_02";"NMF_ACC_YY_01";"NMF_ACC_YY_02";"WM1";"WM2";"WM3";"WM4";"WM5"],'ConditionVariables',["TIME";"STATE"]);

% Reset the ensemble to read from the beginning of the ensemble.
reset(outputEnsemble);

% Append new signal or feature names to DataVariables.
outputEnsemble.DataVariables = unique([outputEnsemble.DataVariables;"ATM_TEMP_01_tsmodel";"ATM_HUM_01_tsmodel";"GEN_ACC_XX_01_tsmodel";"GEN_ACC_YY_01_tsmodel";"GEN_ACC_ZZ_01_tsmodel";"L1_FBSG_01_tsmodel";"L1_FBSG_02_tsmodel";"L3_ACC_XX_01_tsmodel";"L3_ACC_XX_02_tsmodel";"L3_ACC_YY_01_tsmodel";"L3_ACC_YY_02_tsmodel";"L4_ACC_XX_01_tsmodel";"L4_ACC_XX_02_tsmodel";"L4_ACC_YY_01_tsmodel";"L4_ACC_YY_02_tsmodel";"L4_INC_XX_01_tsmodel";"L4_INC_YY_01_tsmodel";"L5_ACC_XX_01_tsmodel";"L5_ACC_XX_02_tsmodel";"L5_ACC_YY_01_tsmodel";"L5_ACC_YY_02_tsmodel";"L5_INC_XX_01_tsmodel";"L5_INC_YY_01_tsmodel";"MSB_ACC_XX_01_tsmodel";"MSB_ACC_ZZ_02_tsmodel";"MSH_ACC_XX_01_tsmodel";"MSH_ACC_ZZ_01_tsmodel";"NMF_ACC_XX_02_tsmodel";"NMF_ACC_YY_01_tsmodel";"NMF_ACC_YY_02_tsmodel";"WM1_tsmodel";"WM2_tsmodel";"WM3_tsmodel";"WM4_tsmodel";"WM5_tsmodel";"ATM_TEMP_01_tsfeat";"ATM_HUM_01_tsfeat";"GEN_ACC_XX_01_tsfeat";"GEN_ACC_YY_01_tsfeat";"GEN_ACC_ZZ_01_tsfeat";"L1_FBSG_01_tsfeat";"L1_FBSG_02_tsfeat";"L3_ACC_XX_01_tsfeat";"L3_ACC_XX_02_tsfeat";"L3_ACC_YY_01_tsfeat";"L3_ACC_YY_02_tsfeat";"L4_ACC_XX_01_tsfeat";"L4_ACC_XX_02_tsfeat";"L4_ACC_YY_01_tsfeat";"L4_ACC_YY_02_tsfeat";"L4_INC_XX_01_tsfeat";"L4_INC_YY_01_tsfeat";"L5_ACC_XX_01_tsfeat";"L5_ACC_XX_02_tsfeat";"L5_ACC_YY_01_tsfeat";"L5_ACC_YY_02_tsfeat";"L5_INC_XX_01_tsfeat";"L5_INC_YY_01_tsfeat";"MSB_ACC_XX_01_tsfeat";"MSB_ACC_ZZ_02_tsfeat";"MSH_ACC_XX_01_tsfeat";"MSH_ACC_ZZ_01_tsfeat";"NMF_ACC_XX_02_tsfeat";"NMF_ACC_YY_01_tsfeat";"NMF_ACC_YY_02_tsfeat";"WM1_tsfeat";"WM2_tsfeat";"WM3_tsfeat";"WM4_tsfeat";"WM5_tsfeat";"ATM_TEMP_01_sigstats";"ATM_HUM_01_sigstats";"GEN_ACC_XX_01_sigstats";"GEN_ACC_YY_01_sigstats";"GEN_ACC_ZZ_01_sigstats";"L1_FBSG_01_sigstats";"L1_FBSG_02_sigstats";"L3_ACC_XX_01_sigstats";"L3_ACC_XX_02_sigstats";"L3_ACC_YY_01_sigstats";"L3_ACC_YY_02_sigstats";"L4_ACC_XX_01_sigstats";"L4_ACC_XX_02_sigstats";"L4_ACC_YY_01_sigstats";"L4_ACC_YY_02_sigstats";"L4_INC_XX_01_sigstats";"L4_INC_YY_01_sigstats";"L5_ACC_XX_01_sigstats";"L5_ACC_XX_02_sigstats";"L5_ACC_YY_01_sigstats";"L5_ACC_YY_02_sigstats";"L5_INC_XX_01_sigstats";"L5_INC_YY_01_sigstats";"MSB_ACC_XX_01_sigstats";"MSB_ACC_ZZ_02_sigstats";"MSH_ACC_XX_01_sigstats";"MSH_ACC_ZZ_01_sigstats";"NMF_ACC_XX_02_sigstats";"NMF_ACC_YY_01_sigstats";"NMF_ACC_YY_02_sigstats";"WM1_sigstats";"WM2_sigstats";"WM3_sigstats";"WM4_sigstats";"WM5_sigstats"],'stable');

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = ["ATM_TEMP_01","ATM_HUM_01","GEN_ACC_XX_01","GEN_ACC_YY_01","GEN_ACC_ZZ_01","L1_FBSG_01","L1_FBSG_02","L3_ACC_XX_01","L3_ACC_XX_02","L3_ACC_YY_01","L3_ACC_YY_02","L4_ACC_XX_01","L4_ACC_XX_02","L4_ACC_YY_01","L4_ACC_YY_02","L4_INC_XX_01","L4_INC_YY_01","L5_ACC_XX_01","L5_ACC_XX_02","L5_ACC_YY_01","L5_ACC_YY_02","L5_INC_XX_01","L5_INC_YY_01","MSB_ACC_XX_01","MSB_ACC_ZZ_02","MSH_ACC_XX_01","MSH_ACC_ZZ_01","NMF_ACC_XX_02","NMF_ACC_YY_01","NMF_ACC_YY_02","WM1","WM2","WM3","WM4","WM5"];

% Initialize a cell array to store all the results.
allMembersResult = {};

% Loop through all ensemble members to read and write data.
while hasdata(outputEnsemble)
    % Read one member.
    member = read(outputEnsemble);

    % Get all input variables.
    ATM_TEMP_01 = readMemberData(member,"ATM_TEMP_01","Col1");
    iv = (0:1:(height(ATM_TEMP_01)-1)*1)';
    ATM_TEMP_01.Sample = iv;
    ATM_HUM_01 = readMemberData(member,"ATM_HUM_01","Col1");
    iv = (0:1:(height(ATM_HUM_01)-1)*1)';
    ATM_HUM_01.Sample = iv;
    GEN_ACC_XX_01 = readMemberData(member,"GEN_ACC_XX_01","Col1");
    iv = (0:1:(height(GEN_ACC_XX_01)-1)*1)';
    GEN_ACC_XX_01.Sample = iv;
    GEN_ACC_YY_01 = readMemberData(member,"GEN_ACC_YY_01","Col1");
    iv = (0:1:(height(GEN_ACC_YY_01)-1)*1)';
    GEN_ACC_YY_01.Sample = iv;
    GEN_ACC_ZZ_01 = readMemberData(member,"GEN_ACC_ZZ_01","Col1");
    iv = (0:1:(height(GEN_ACC_ZZ_01)-1)*1)';
    GEN_ACC_ZZ_01.Sample = iv;
    L1_FBSG_01 = readMemberData(member,"L1_FBSG_01","Col1");
    iv = (0:1:(height(L1_FBSG_01)-1)*1)';
    L1_FBSG_01.Sample = iv;
    L1_FBSG_02 = readMemberData(member,"L1_FBSG_02","Col1");
    iv = (0:1:(height(L1_FBSG_02)-1)*1)';
    L1_FBSG_02.Sample = iv;
    L3_ACC_XX_01 = readMemberData(member,"L3_ACC_XX_01","Col1");
    iv = (0:1:(height(L3_ACC_XX_01)-1)*1)';
    L3_ACC_XX_01.Sample = iv;
    L3_ACC_XX_02 = readMemberData(member,"L3_ACC_XX_02","Col1");
    iv = (0:1:(height(L3_ACC_XX_02)-1)*1)';
    L3_ACC_XX_02.Sample = iv;
    L3_ACC_YY_01 = readMemberData(member,"L3_ACC_YY_01","Col1");
    iv = (0:1:(height(L3_ACC_YY_01)-1)*1)';
    L3_ACC_YY_01.Sample = iv;
    L3_ACC_YY_02 = readMemberData(member,"L3_ACC_YY_02","Col1");
    iv = (0:1:(height(L3_ACC_YY_02)-1)*1)';
    L3_ACC_YY_02.Sample = iv;
    L4_ACC_XX_01 = readMemberData(member,"L4_ACC_XX_01","Col1");
    iv = (0:1:(height(L4_ACC_XX_01)-1)*1)';
    L4_ACC_XX_01.Sample = iv;
    L4_ACC_XX_02 = readMemberData(member,"L4_ACC_XX_02","Col1");
    iv = (0:1:(height(L4_ACC_XX_02)-1)*1)';
    L4_ACC_XX_02.Sample = iv;
    L4_ACC_YY_01 = readMemberData(member,"L4_ACC_YY_01","Col1");
    iv = (0:1:(height(L4_ACC_YY_01)-1)*1)';
    L4_ACC_YY_01.Sample = iv;
    L4_ACC_YY_02 = readMemberData(member,"L4_ACC_YY_02","Col1");
    iv = (0:1:(height(L4_ACC_YY_02)-1)*1)';
    L4_ACC_YY_02.Sample = iv;
    L4_INC_XX_01 = readMemberData(member,"L4_INC_XX_01","Col1");
    iv = (0:1:(height(L4_INC_XX_01)-1)*1)';
    L4_INC_XX_01.Sample = iv;
    L4_INC_YY_01 = readMemberData(member,"L4_INC_YY_01","Col1");
    iv = (0:1:(height(L4_INC_YY_01)-1)*1)';
    L4_INC_YY_01.Sample = iv;
    L5_ACC_XX_01 = readMemberData(member,"L5_ACC_XX_01","Col1");
    iv = (0:1:(height(L5_ACC_XX_01)-1)*1)';
    L5_ACC_XX_01.Sample = iv;
    L5_ACC_XX_02 = readMemberData(member,"L5_ACC_XX_02","Col1");
    iv = (0:1:(height(L5_ACC_XX_02)-1)*1)';
    L5_ACC_XX_02.Sample = iv;
    L5_ACC_YY_01 = readMemberData(member,"L5_ACC_YY_01","Col1");
    iv = (0:1:(height(L5_ACC_YY_01)-1)*1)';
    L5_ACC_YY_01.Sample = iv;
    L5_ACC_YY_02 = readMemberData(member,"L5_ACC_YY_02","Col1");
    iv = (0:1:(height(L5_ACC_YY_02)-1)*1)';
    L5_ACC_YY_02.Sample = iv;
    L5_INC_XX_01 = readMemberData(member,"L5_INC_XX_01","Col1");
    iv = (0:1:(height(L5_INC_XX_01)-1)*1)';
    L5_INC_XX_01.Sample = iv;
    L5_INC_YY_01 = readMemberData(member,"L5_INC_YY_01","Col1");
    iv = (0:1:(height(L5_INC_YY_01)-1)*1)';
    L5_INC_YY_01.Sample = iv;
    MSB_ACC_XX_01 = readMemberData(member,"MSB_ACC_XX_01","Col1");
    iv = (0:1:(height(MSB_ACC_XX_01)-1)*1)';
    MSB_ACC_XX_01.Sample = iv;
    MSB_ACC_ZZ_02 = readMemberData(member,"MSB_ACC_ZZ_02","Col1");
    iv = (0:1:(height(MSB_ACC_ZZ_02)-1)*1)';
    MSB_ACC_ZZ_02.Sample = iv;
    MSH_ACC_XX_01 = readMemberData(member,"MSH_ACC_XX_01","Col1");
    iv = (0:1:(height(MSH_ACC_XX_01)-1)*1)';
    MSH_ACC_XX_01.Sample = iv;
    MSH_ACC_ZZ_01 = readMemberData(member,"MSH_ACC_ZZ_01","Col1");
    iv = (0:1:(height(MSH_ACC_ZZ_01)-1)*1)';
    MSH_ACC_ZZ_01.Sample = iv;
    NMF_ACC_XX_02 = readMemberData(member,"NMF_ACC_XX_02","Col1");
    iv = (0:1:(height(NMF_ACC_XX_02)-1)*1)';
    NMF_ACC_XX_02.Sample = iv;
    NMF_ACC_YY_01 = readMemberData(member,"NMF_ACC_YY_01","Col1");
    iv = (0:1:(height(NMF_ACC_YY_01)-1)*1)';
    NMF_ACC_YY_01.Sample = iv;
    NMF_ACC_YY_02 = readMemberData(member,"NMF_ACC_YY_02","Col1");
    iv = (0:1:(height(NMF_ACC_YY_02)-1)*1)';
    NMF_ACC_YY_02.Sample = iv;
    WM1 = readMemberData(member,"WM1","Col1");
    iv = (0:1:(height(WM1)-1)*1)';
    WM1.Sample = iv;
    WM2 = readMemberData(member,"WM2","Col1");
    iv = (0:1:(height(WM2)-1)*1)';
    WM2.Sample = iv;
    WM3 = readMemberData(member,"WM3","Col1");
    iv = (0:1:(height(WM3)-1)*1)';
    WM3.Sample = iv;
    WM4 = readMemberData(member,"WM4","Col1");
    iv = (0:1:(height(WM4)-1)*1)';
    WM4.Sample = iv;
    WM5 = readMemberData(member,"WM5","Col1");
    iv = (0:1:(height(WM5)-1)*1)';
    WM5.Sample = iv;

    % Initialize a table to store results.
    memberResult = table;

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = ATM_TEMP_01.Col1;
        t = ATM_TEMP_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        ATM_TEMP_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        ATM_TEMP_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_TEMP_01_tsmodel},'VariableNames',{'ATM_TEMP_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = ATM_HUM_01.Col1;
        t = ATM_HUM_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        ATM_HUM_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        ATM_HUM_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_HUM_01_tsmodel},'VariableNames',{'ATM_HUM_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = GEN_ACC_XX_01.Col1;
        t = GEN_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_XX_01_tsmodel},'VariableNames',{'GEN_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = GEN_ACC_YY_01.Col1;
        t = GEN_ACC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_YY_01_tsmodel},'VariableNames',{'GEN_ACC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = GEN_ACC_ZZ_01.Col1;
        t = GEN_ACC_ZZ_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_ZZ_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        GEN_ACC_ZZ_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_ZZ_01_tsmodel},'VariableNames',{'GEN_ACC_ZZ_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L1_FBSG_01.Col1;
        t = L1_FBSG_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L1_FBSG_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L1_FBSG_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_01_tsmodel},'VariableNames',{'L1_FBSG_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L1_FBSG_02.Col1;
        t = L1_FBSG_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L1_FBSG_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L1_FBSG_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_02_tsmodel},'VariableNames',{'L1_FBSG_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L3_ACC_XX_01.Col1;
        t = L3_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_01_tsmodel},'VariableNames',{'L3_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L3_ACC_XX_02.Col1;
        t = L3_ACC_XX_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_02_tsmodel},'VariableNames',{'L3_ACC_XX_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L3_ACC_YY_01.Col1;
        t = L3_ACC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_01_tsmodel},'VariableNames',{'L3_ACC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L3_ACC_YY_02.Col1;
        t = L3_ACC_YY_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L3_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_02_tsmodel},'VariableNames',{'L3_ACC_YY_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_ACC_XX_01.Col1;
        t = L4_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_01_tsmodel},'VariableNames',{'L4_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_ACC_XX_02.Col1;
        t = L4_ACC_XX_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_02_tsmodel},'VariableNames',{'L4_ACC_XX_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_ACC_YY_01.Col1;
        t = L4_ACC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_01_tsmodel},'VariableNames',{'L4_ACC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_ACC_YY_02.Col1;
        t = L4_ACC_YY_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_02_tsmodel},'VariableNames',{'L4_ACC_YY_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_INC_XX_01.Col1;
        t = L4_INC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_INC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_INC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_XX_01_tsmodel},'VariableNames',{'L4_INC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L4_INC_YY_01.Col1;
        t = L4_INC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_INC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L4_INC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_YY_01_tsmodel},'VariableNames',{'L4_INC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_ACC_XX_01.Col1;
        t = L5_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_01_tsmodel},'VariableNames',{'L5_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_ACC_XX_02.Col1;
        t = L5_ACC_XX_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_02_tsmodel},'VariableNames',{'L5_ACC_XX_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_ACC_YY_01.Col1;
        t = L5_ACC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_01_tsmodel},'VariableNames',{'L5_ACC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_ACC_YY_02.Col1;
        t = L5_ACC_YY_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_02_tsmodel},'VariableNames',{'L5_ACC_YY_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_INC_XX_01.Col1;
        t = L5_INC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_INC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_INC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_XX_01_tsmodel},'VariableNames',{'L5_INC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = L5_INC_YY_01.Col1;
        t = L5_INC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_INC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        L5_INC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_YY_01_tsmodel},'VariableNames',{'L5_INC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = MSB_ACC_XX_01.Col1;
        t = MSB_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSB_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSB_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_XX_01_tsmodel},'VariableNames',{'MSB_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = MSB_ACC_ZZ_02.Col1;
        t = MSB_ACC_ZZ_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSB_ACC_ZZ_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSB_ACC_ZZ_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_ZZ_02_tsmodel},'VariableNames',{'MSB_ACC_ZZ_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = MSH_ACC_XX_01.Col1;
        t = MSH_ACC_XX_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSH_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSH_ACC_XX_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_XX_01_tsmodel},'VariableNames',{'MSH_ACC_XX_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = MSH_ACC_ZZ_01.Col1;
        t = MSH_ACC_ZZ_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSH_ACC_ZZ_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        MSH_ACC_ZZ_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_ZZ_01_tsmodel},'VariableNames',{'MSH_ACC_ZZ_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = NMF_ACC_XX_02.Col1;
        t = NMF_ACC_XX_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_XX_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_XX_02_tsmodel},'VariableNames',{'NMF_ACC_XX_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = NMF_ACC_YY_01.Col1;
        t = NMF_ACC_YY_01.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_YY_01_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_01_tsmodel},'VariableNames',{'NMF_ACC_YY_01_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = NMF_ACC_YY_02.Col1;
        t = NMF_ACC_YY_02.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        NMF_ACC_YY_02_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_02_tsmodel},'VariableNames',{'NMF_ACC_YY_02_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = WM1.Col1;
        t = WM1.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM1_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM1_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM1_tsmodel},'VariableNames',{'WM1_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = WM2.Col1;
        t = WM2.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM2_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM2_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM2_tsmodel},'VariableNames',{'WM2_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = WM3.Col1;
        t = WM3.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM3_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM3_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM3_tsmodel},'VariableNames',{'WM3_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = WM4.Col1;
        t = WM4.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM4_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM4_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM4_tsmodel},'VariableNames',{'WM4_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesModelFeatures
    try
        % Compute model-based time series features.
        x = WM5.Col1;
        t = WM5.Sample;
        y = x - mean(x,'omitnan');
        N = numel(x);

        % Estimate autoregressive model.
        p = 5;
        R = xcorr(y,p,'biased');
        R(1:p) = [];
        [a,Ep] = levinson(R,p);

        % Compute effective sampling rate.
        tNumeric = time2num(t,"seconds");
        Fs = effectivefs(tNumeric);

        % Compute model poles.
        r = sort(roots(a),'descend');
        s = Fs*log(r);
        Fn = abs(s)/2/pi;
        Zn = -real(s)./abs(s);

        % Estimate process noise.
        w = filter(a,1,y);

        % Estimate model residuals.
        e = filter(a,1,x);

        % Extract individual feature values.
        Coef1 = a(2);
        Coef2 = a(3);
        Coef3 = a(4);
        Coef4 = a(5);
        Coef5 = a(6);
        Freq1 = Fn(1);
        Freq2 = Fn(2);
        Damp1 = Zn(1);
        Damp2 = Zn(2);
        MSE = var(w,'omitnan');
        MAE = mean(abs(w),'omitnan');
        AIC = log(Ep) + 2*p/N;
        Mean = mean(e,'omitnan');
        Variance = var(e,'omitnan');
        RMS = rms(e,'omitnan');
        Kurtosis = kurtosis(e);

        % Concatenate signal features.
        featureValues = [Coef1,Coef2,Coef3,Coef4,Coef5,Freq1,Freq2,Damp1,Damp2,MSE,MAE,AIC,Mean,Variance,RMS,Kurtosis];

        % Store computed features in a table.
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM5_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,16);
        featureNames = {'Coef1','Coef2','Coef3','Coef4','Coef5','Freq1','Freq2','Damp1','Damp2','MSE','MAE','AIC','Mean','Variance','RMS','Kurtosis'};
        WM5_tsmodel = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM5_tsmodel},'VariableNames',{'WM5_tsmodel'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = ATM_TEMP_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        ATM_TEMP_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        ATM_TEMP_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_TEMP_01_tsfeat},'VariableNames',{'ATM_TEMP_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = ATM_HUM_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        ATM_HUM_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        ATM_HUM_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_HUM_01_tsfeat},'VariableNames',{'ATM_HUM_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = GEN_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_XX_01_tsfeat},'VariableNames',{'GEN_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = GEN_ACC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_YY_01_tsfeat},'VariableNames',{'GEN_ACC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = GEN_ACC_ZZ_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_ZZ_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        GEN_ACC_ZZ_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_ZZ_01_tsfeat},'VariableNames',{'GEN_ACC_ZZ_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L1_FBSG_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L1_FBSG_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L1_FBSG_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_01_tsfeat},'VariableNames',{'L1_FBSG_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L1_FBSG_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L1_FBSG_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L1_FBSG_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_02_tsfeat},'VariableNames',{'L1_FBSG_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L3_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_01_tsfeat},'VariableNames',{'L3_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L3_ACC_XX_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_02_tsfeat},'VariableNames',{'L3_ACC_XX_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L3_ACC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_01_tsfeat},'VariableNames',{'L3_ACC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L3_ACC_YY_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L3_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_02_tsfeat},'VariableNames',{'L3_ACC_YY_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_01_tsfeat},'VariableNames',{'L4_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_ACC_XX_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_02_tsfeat},'VariableNames',{'L4_ACC_XX_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_ACC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_01_tsfeat},'VariableNames',{'L4_ACC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_ACC_YY_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_02_tsfeat},'VariableNames',{'L4_ACC_YY_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_INC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_INC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_INC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_XX_01_tsfeat},'VariableNames',{'L4_INC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L4_INC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_INC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L4_INC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_YY_01_tsfeat},'VariableNames',{'L4_INC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_01_tsfeat},'VariableNames',{'L5_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_ACC_XX_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_02_tsfeat},'VariableNames',{'L5_ACC_XX_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_ACC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_01_tsfeat},'VariableNames',{'L5_ACC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_ACC_YY_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_02_tsfeat},'VariableNames',{'L5_ACC_YY_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_INC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_INC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_INC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_XX_01_tsfeat},'VariableNames',{'L5_INC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = L5_INC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_INC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        L5_INC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_YY_01_tsfeat},'VariableNames',{'L5_INC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = MSB_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSB_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSB_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_XX_01_tsfeat},'VariableNames',{'MSB_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = MSB_ACC_ZZ_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSB_ACC_ZZ_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSB_ACC_ZZ_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_ZZ_02_tsfeat},'VariableNames',{'MSB_ACC_ZZ_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = MSH_ACC_XX_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSH_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSH_ACC_XX_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_XX_01_tsfeat},'VariableNames',{'MSH_ACC_XX_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = MSH_ACC_ZZ_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSH_ACC_ZZ_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        MSH_ACC_ZZ_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_ZZ_01_tsfeat},'VariableNames',{'MSH_ACC_ZZ_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = NMF_ACC_XX_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_XX_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_XX_02_tsfeat},'VariableNames',{'NMF_ACC_XX_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = NMF_ACC_YY_01.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_YY_01_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_01_tsfeat},'VariableNames',{'NMF_ACC_YY_01_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = NMF_ACC_YY_02.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        NMF_ACC_YY_02_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_02_tsfeat},'VariableNames',{'NMF_ACC_YY_02_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = WM1.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM1_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM1_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM1_tsfeat},'VariableNames',{'WM1_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = WM2.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM2_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM2_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM2_tsfeat},'VariableNames',{'WM2_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = WM3.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM3_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM3_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM3_tsfeat},'VariableNames',{'WM3_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = WM4.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM4_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM4_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM4_tsfeat},'VariableNames',{'WM4_tsfeat'})]; %#ok<AGROW>

    %% TimeSeriesFeatures
    try
        % Compute time series features.
        inputSignal = WM5.Col1;
        quartiles = quantile(inputSignal, [0.25 0.5 0.75]);
        quantiles = quantile(inputSignal, 0.95);

        N = 10;
        acf = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        acf = acf(N+2:end)';

        N = 5;
        rho = xcorr(inputSignal-mean(inputSignal), N, 'coeff');
        rho = rho(N+1:end);
        pacf = zeros(1,N);
        for L = 1:N
            a_hat = levinson(rho(1:L+1), L+1);
            pacf(L) = -a_hat(end);
        end

        % Extract individual feature values.
        Minimum = min(inputSignal);
        Median = median(inputSignal, 'omitnan');
        Maximum = max(inputSignal);
        Q1 = quartiles(1);
        Q3 = quartiles(3);
        IQR = quartiles(3)-quartiles(1);
        q1 = quantiles(1);
        ACF1 = acf(1);
        ssACF10 = sum(acf(1:10).^2);
        PACF1 = pacf(1);
        ssPACF5 = sum(pacf(1:5).^2);

        % Concatenate signal features.
        featureValues = [Minimum,Median,Maximum,Q1,Q3,IQR,q1,ACF1,ssACF10,PACF1,ssPACF5];

        % Store computed features in a table.
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM5_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,11);
        featureNames = {'Minimum','Median','Maximum','Q1','Q3','IQR','q1','ACF1','ssACF10','PACF1','ssPACF5'};
        WM5_tsfeat = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM5_tsfeat},'VariableNames',{'WM5_tsfeat'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = ATM_TEMP_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        ATM_TEMP_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        ATM_TEMP_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_TEMP_01_sigstats},'VariableNames',{'ATM_TEMP_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = ATM_HUM_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        ATM_HUM_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        ATM_HUM_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({ATM_HUM_01_sigstats},'VariableNames',{'ATM_HUM_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = GEN_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_XX_01_sigstats},'VariableNames',{'GEN_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = GEN_ACC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_YY_01_sigstats},'VariableNames',{'GEN_ACC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = GEN_ACC_ZZ_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_ZZ_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        GEN_ACC_ZZ_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({GEN_ACC_ZZ_01_sigstats},'VariableNames',{'GEN_ACC_ZZ_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L1_FBSG_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L1_FBSG_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L1_FBSG_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_01_sigstats},'VariableNames',{'L1_FBSG_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L1_FBSG_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L1_FBSG_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L1_FBSG_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L1_FBSG_02_sigstats},'VariableNames',{'L1_FBSG_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L3_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_01_sigstats},'VariableNames',{'L3_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L3_ACC_XX_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_XX_02_sigstats},'VariableNames',{'L3_ACC_XX_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L3_ACC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_01_sigstats},'VariableNames',{'L3_ACC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L3_ACC_YY_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L3_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L3_ACC_YY_02_sigstats},'VariableNames',{'L3_ACC_YY_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_01_sigstats},'VariableNames',{'L4_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_ACC_XX_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_XX_02_sigstats},'VariableNames',{'L4_ACC_XX_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_ACC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_01_sigstats},'VariableNames',{'L4_ACC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_ACC_YY_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_ACC_YY_02_sigstats},'VariableNames',{'L4_ACC_YY_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_INC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_INC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_INC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_XX_01_sigstats},'VariableNames',{'L4_INC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L4_INC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_INC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L4_INC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L4_INC_YY_01_sigstats},'VariableNames',{'L4_INC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_01_sigstats},'VariableNames',{'L5_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_ACC_XX_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_XX_02_sigstats},'VariableNames',{'L5_ACC_XX_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_ACC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_01_sigstats},'VariableNames',{'L5_ACC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_ACC_YY_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_ACC_YY_02_sigstats},'VariableNames',{'L5_ACC_YY_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_INC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_INC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_INC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_XX_01_sigstats},'VariableNames',{'L5_INC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = L5_INC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_INC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        L5_INC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({L5_INC_YY_01_sigstats},'VariableNames',{'L5_INC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = MSB_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSB_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSB_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_XX_01_sigstats},'VariableNames',{'MSB_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = MSB_ACC_ZZ_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSB_ACC_ZZ_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSB_ACC_ZZ_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSB_ACC_ZZ_02_sigstats},'VariableNames',{'MSB_ACC_ZZ_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = MSH_ACC_XX_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSH_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSH_ACC_XX_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_XX_01_sigstats},'VariableNames',{'MSH_ACC_XX_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = MSH_ACC_ZZ_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSH_ACC_ZZ_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        MSH_ACC_ZZ_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({MSH_ACC_ZZ_01_sigstats},'VariableNames',{'MSH_ACC_ZZ_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = NMF_ACC_XX_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_XX_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_XX_02_sigstats},'VariableNames',{'NMF_ACC_XX_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = NMF_ACC_YY_01.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_YY_01_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_01_sigstats},'VariableNames',{'NMF_ACC_YY_01_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = NMF_ACC_YY_02.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        NMF_ACC_YY_02_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({NMF_ACC_YY_02_sigstats},'VariableNames',{'NMF_ACC_YY_02_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = WM1.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM1_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM1_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM1_sigstats},'VariableNames',{'WM1_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = WM2.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM2_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM2_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM2_sigstats},'VariableNames',{'WM2_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = WM3.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM3_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM3_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM3_sigstats},'VariableNames',{'WM3_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = WM4.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM4_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM4_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM4_sigstats},'VariableNames',{'WM4_sigstats'})]; %#ok<AGROW>

    %% SignalFeatures
    try
        % Compute signal features.
        inputSignal = WM5.Col1;
        ClearanceFactor = max(abs(inputSignal))/(mean(sqrt(abs(inputSignal)))^2);
        CrestFactor = peak2rms(inputSignal);
        ImpulseFactor = max(abs(inputSignal))/mean(abs(inputSignal));
        Kurtosis = kurtosis(inputSignal);
        Mean = mean(inputSignal,'omitnan');
        PeakValue = max(abs(inputSignal));
        RMS = rms(inputSignal,'omitnan');
        SINAD = sinad(inputSignal);
        SNR = snr(inputSignal);
        ShapeFactor = rms(inputSignal,'omitnan')/mean(abs(inputSignal),'omitnan');
        Skewness = skewness(inputSignal);
        Std = std(inputSignal,'omitnan');
        THD = thd(inputSignal);

        % Concatenate signal features.
        featureValues = [ClearanceFactor,CrestFactor,ImpulseFactor,Kurtosis,Mean,PeakValue,RMS,SINAD,SNR,ShapeFactor,Skewness,Std,THD];

        % Store computed features in a table.
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM5_sigstats = array2table(featureValues,'VariableNames',featureNames);
    catch
        % Store computed features in a table.
        featureValues = NaN(1,13);
        featureNames = {'ClearanceFactor','CrestFactor','ImpulseFactor','Kurtosis','Mean','PeakValue','RMS','SINAD','SNR','ShapeFactor','Skewness','Std','THD'};
        WM5_sigstats = array2table(featureValues,'VariableNames',featureNames);
    end

    % Append computed results to the member table.
    memberResult = [memberResult, ...
        table({WM5_sigstats},'VariableNames',{'WM5_sigstats'})]; %#ok<AGROW>

    % Append all member results to the cell array.
    allMembersResult = [allMembersResult; {memberResult}]; %#ok<AGROW>
end

% Write the results for all members to the ensemble.
writeToMembers(outputEnsemble,allMembersResult)

% Gather all features into a table.
selectedFeatureNames = ["ATM_TEMP_01_tsmodel/Coef1","ATM_TEMP_01_tsmodel/Coef2","ATM_TEMP_01_tsmodel/Coef3","ATM_TEMP_01_tsmodel/Coef4","ATM_TEMP_01_tsmodel/Coef5","ATM_TEMP_01_tsmodel/Freq1","ATM_TEMP_01_tsmodel/Freq2","ATM_TEMP_01_tsmodel/Damp1","ATM_TEMP_01_tsmodel/Damp2","ATM_TEMP_01_tsmodel/MSE","ATM_TEMP_01_tsmodel/MAE","ATM_TEMP_01_tsmodel/AIC","ATM_TEMP_01_tsmodel/Mean","ATM_TEMP_01_tsmodel/Variance","ATM_TEMP_01_tsmodel/RMS","ATM_TEMP_01_tsmodel/Kurtosis","ATM_HUM_01_tsmodel/Coef1","ATM_HUM_01_tsmodel/Coef2","ATM_HUM_01_tsmodel/Coef3","ATM_HUM_01_tsmodel/Coef4","ATM_HUM_01_tsmodel/Coef5","ATM_HUM_01_tsmodel/Freq1","ATM_HUM_01_tsmodel/Freq2","ATM_HUM_01_tsmodel/Damp1","ATM_HUM_01_tsmodel/Damp2","ATM_HUM_01_tsmodel/MSE","ATM_HUM_01_tsmodel/MAE","ATM_HUM_01_tsmodel/AIC","ATM_HUM_01_tsmodel/Mean","ATM_HUM_01_tsmodel/Variance","ATM_HUM_01_tsmodel/RMS","ATM_HUM_01_tsmodel/Kurtosis","GEN_ACC_XX_01_tsmodel/Coef1","GEN_ACC_XX_01_tsmodel/Coef2","GEN_ACC_XX_01_tsmodel/Coef3","GEN_ACC_XX_01_tsmodel/Coef4","GEN_ACC_XX_01_tsmodel/Coef5","GEN_ACC_XX_01_tsmodel/Freq1","GEN_ACC_XX_01_tsmodel/Freq2","GEN_ACC_XX_01_tsmodel/Damp1","GEN_ACC_XX_01_tsmodel/Damp2","GEN_ACC_XX_01_tsmodel/MSE","GEN_ACC_XX_01_tsmodel/MAE","GEN_ACC_XX_01_tsmodel/AIC","GEN_ACC_XX_01_tsmodel/Mean","GEN_ACC_XX_01_tsmodel/Variance","GEN_ACC_XX_01_tsmodel/RMS","GEN_ACC_XX_01_tsmodel/Kurtosis","GEN_ACC_YY_01_tsmodel/Coef1","GEN_ACC_YY_01_tsmodel/Coef2","GEN_ACC_YY_01_tsmodel/Coef3","GEN_ACC_YY_01_tsmodel/Coef4","GEN_ACC_YY_01_tsmodel/Coef5","GEN_ACC_YY_01_tsmodel/Freq1","GEN_ACC_YY_01_tsmodel/Freq2","GEN_ACC_YY_01_tsmodel/Damp1","GEN_ACC_YY_01_tsmodel/Damp2","GEN_ACC_YY_01_tsmodel/MSE","GEN_ACC_YY_01_tsmodel/MAE","GEN_ACC_YY_01_tsmodel/AIC","GEN_ACC_YY_01_tsmodel/Mean","GEN_ACC_YY_01_tsmodel/Variance","GEN_ACC_YY_01_tsmodel/RMS","GEN_ACC_YY_01_tsmodel/Kurtosis","GEN_ACC_ZZ_01_tsmodel/Coef1","GEN_ACC_ZZ_01_tsmodel/Coef2","GEN_ACC_ZZ_01_tsmodel/Coef3","GEN_ACC_ZZ_01_tsmodel/Coef4","GEN_ACC_ZZ_01_tsmodel/Coef5","GEN_ACC_ZZ_01_tsmodel/Freq1","GEN_ACC_ZZ_01_tsmodel/Freq2","GEN_ACC_ZZ_01_tsmodel/Damp1","GEN_ACC_ZZ_01_tsmodel/Damp2","GEN_ACC_ZZ_01_tsmodel/MSE","GEN_ACC_ZZ_01_tsmodel/MAE","GEN_ACC_ZZ_01_tsmodel/AIC","GEN_ACC_ZZ_01_tsmodel/Mean","GEN_ACC_ZZ_01_tsmodel/Variance","GEN_ACC_ZZ_01_tsmodel/RMS","GEN_ACC_ZZ_01_tsmodel/Kurtosis","L1_FBSG_01_tsmodel/Coef1","L1_FBSG_01_tsmodel/Coef2","L1_FBSG_01_tsmodel/Coef3","L1_FBSG_01_tsmodel/Coef4","L1_FBSG_01_tsmodel/Coef5","L1_FBSG_01_tsmodel/Freq1","L1_FBSG_01_tsmodel/Freq2","L1_FBSG_01_tsmodel/Damp1","L1_FBSG_01_tsmodel/Damp2","L1_FBSG_01_tsmodel/MSE","L1_FBSG_01_tsmodel/MAE","L1_FBSG_01_tsmodel/AIC","L1_FBSG_01_tsmodel/Mean","L1_FBSG_01_tsmodel/Variance","L1_FBSG_01_tsmodel/RMS","L1_FBSG_01_tsmodel/Kurtosis","L1_FBSG_02_tsmodel/Coef1","L1_FBSG_02_tsmodel/Coef2","L1_FBSG_02_tsmodel/Coef3","L1_FBSG_02_tsmodel/Coef4","L1_FBSG_02_tsmodel/Coef5","L1_FBSG_02_tsmodel/Freq1","L1_FBSG_02_tsmodel/Freq2","L1_FBSG_02_tsmodel/Damp1","L1_FBSG_02_tsmodel/Damp2","L1_FBSG_02_tsmodel/MSE","L1_FBSG_02_tsmodel/MAE","L1_FBSG_02_tsmodel/AIC","L1_FBSG_02_tsmodel/Mean","L1_FBSG_02_tsmodel/Variance","L1_FBSG_02_tsmodel/RMS","L1_FBSG_02_tsmodel/Kurtosis","L3_ACC_XX_01_tsmodel/Coef1","L3_ACC_XX_01_tsmodel/Coef2","L3_ACC_XX_01_tsmodel/Coef3","L3_ACC_XX_01_tsmodel/Coef4","L3_ACC_XX_01_tsmodel/Coef5","L3_ACC_XX_01_tsmodel/Freq1","L3_ACC_XX_01_tsmodel/Freq2","L3_ACC_XX_01_tsmodel/Damp1","L3_ACC_XX_01_tsmodel/Damp2","L3_ACC_XX_01_tsmodel/MSE","L3_ACC_XX_01_tsmodel/MAE","L3_ACC_XX_01_tsmodel/AIC","L3_ACC_XX_01_tsmodel/Mean","L3_ACC_XX_01_tsmodel/Variance","L3_ACC_XX_01_tsmodel/RMS","L3_ACC_XX_01_tsmodel/Kurtosis","L3_ACC_XX_02_tsmodel/Coef1","L3_ACC_XX_02_tsmodel/Coef2","L3_ACC_XX_02_tsmodel/Coef3","L3_ACC_XX_02_tsmodel/Coef4","L3_ACC_XX_02_tsmodel/Coef5","L3_ACC_XX_02_tsmodel/Freq1","L3_ACC_XX_02_tsmodel/Freq2","L3_ACC_XX_02_tsmodel/Damp1","L3_ACC_XX_02_tsmodel/Damp2","L3_ACC_XX_02_tsmodel/MSE","L3_ACC_XX_02_tsmodel/MAE","L3_ACC_XX_02_tsmodel/AIC","L3_ACC_XX_02_tsmodel/Mean","L3_ACC_XX_02_tsmodel/Variance","L3_ACC_XX_02_tsmodel/RMS","L3_ACC_XX_02_tsmodel/Kurtosis","L3_ACC_YY_01_tsmodel/Coef1","L3_ACC_YY_01_tsmodel/Coef2","L3_ACC_YY_01_tsmodel/Coef3","L3_ACC_YY_01_tsmodel/Coef4","L3_ACC_YY_01_tsmodel/Coef5","L3_ACC_YY_01_tsmodel/Freq1","L3_ACC_YY_01_tsmodel/Freq2","L3_ACC_YY_01_tsmodel/Damp1","L3_ACC_YY_01_tsmodel/Damp2","L3_ACC_YY_01_tsmodel/MSE","L3_ACC_YY_01_tsmodel/MAE","L3_ACC_YY_01_tsmodel/AIC","L3_ACC_YY_01_tsmodel/Mean","L3_ACC_YY_01_tsmodel/Variance","L3_ACC_YY_01_tsmodel/RMS","L3_ACC_YY_01_tsmodel/Kurtosis","L3_ACC_YY_02_tsmodel/Coef1","L3_ACC_YY_02_tsmodel/Coef2","L3_ACC_YY_02_tsmodel/Coef3","L3_ACC_YY_02_tsmodel/Coef4","L3_ACC_YY_02_tsmodel/Coef5","L3_ACC_YY_02_tsmodel/Freq1","L3_ACC_YY_02_tsmodel/Freq2","L3_ACC_YY_02_tsmodel/Damp1","L3_ACC_YY_02_tsmodel/Damp2","L3_ACC_YY_02_tsmodel/MSE","L3_ACC_YY_02_tsmodel/MAE","L3_ACC_YY_02_tsmodel/AIC","L3_ACC_YY_02_tsmodel/Mean","L3_ACC_YY_02_tsmodel/Variance","L3_ACC_YY_02_tsmodel/RMS","L3_ACC_YY_02_tsmodel/Kurtosis","L4_ACC_XX_01_tsmodel/Coef1","L4_ACC_XX_01_tsmodel/Coef2","L4_ACC_XX_01_tsmodel/Coef3","L4_ACC_XX_01_tsmodel/Coef4","L4_ACC_XX_01_tsmodel/Coef5","L4_ACC_XX_01_tsmodel/Freq1","L4_ACC_XX_01_tsmodel/Freq2","L4_ACC_XX_01_tsmodel/Damp1","L4_ACC_XX_01_tsmodel/Damp2","L4_ACC_XX_01_tsmodel/MSE","L4_ACC_XX_01_tsmodel/MAE","L4_ACC_XX_01_tsmodel/AIC","L4_ACC_XX_01_tsmodel/Mean","L4_ACC_XX_01_tsmodel/Variance","L4_ACC_XX_01_tsmodel/RMS","L4_ACC_XX_01_tsmodel/Kurtosis","L4_ACC_XX_02_tsmodel/Coef1","L4_ACC_XX_02_tsmodel/Coef2","L4_ACC_XX_02_tsmodel/Coef3","L4_ACC_XX_02_tsmodel/Coef4","L4_ACC_XX_02_tsmodel/Coef5","L4_ACC_XX_02_tsmodel/Freq1","L4_ACC_XX_02_tsmodel/Freq2","L4_ACC_XX_02_tsmodel/Damp1","L4_ACC_XX_02_tsmodel/Damp2","L4_ACC_XX_02_tsmodel/MSE","L4_ACC_XX_02_tsmodel/MAE","L4_ACC_XX_02_tsmodel/AIC","L4_ACC_XX_02_tsmodel/Mean","L4_ACC_XX_02_tsmodel/Variance","L4_ACC_XX_02_tsmodel/RMS","L4_ACC_XX_02_tsmodel/Kurtosis","L4_ACC_YY_01_tsmodel/Coef1","L4_ACC_YY_01_tsmodel/Coef2","L4_ACC_YY_01_tsmodel/Coef3","L4_ACC_YY_01_tsmodel/Coef4","L4_ACC_YY_01_tsmodel/Coef5","L4_ACC_YY_01_tsmodel/Freq1","L4_ACC_YY_01_tsmodel/Freq2","L4_ACC_YY_01_tsmodel/Damp1","L4_ACC_YY_01_tsmodel/Damp2","L4_ACC_YY_01_tsmodel/MSE","L4_ACC_YY_01_tsmodel/MAE","L4_ACC_YY_01_tsmodel/AIC","L4_ACC_YY_01_tsmodel/Mean","L4_ACC_YY_01_tsmodel/Variance","L4_ACC_YY_01_tsmodel/RMS","L4_ACC_YY_01_tsmodel/Kurtosis","L4_ACC_YY_02_tsmodel/Coef1","L4_ACC_YY_02_tsmodel/Coef2","L4_ACC_YY_02_tsmodel/Coef3","L4_ACC_YY_02_tsmodel/Coef4","L4_ACC_YY_02_tsmodel/Coef5","L4_ACC_YY_02_tsmodel/Freq1","L4_ACC_YY_02_tsmodel/Freq2","L4_ACC_YY_02_tsmodel/Damp1","L4_ACC_YY_02_tsmodel/Damp2","L4_ACC_YY_02_tsmodel/MSE","L4_ACC_YY_02_tsmodel/MAE","L4_ACC_YY_02_tsmodel/AIC","L4_ACC_YY_02_tsmodel/Mean","L4_ACC_YY_02_tsmodel/Variance","L4_ACC_YY_02_tsmodel/RMS","L4_ACC_YY_02_tsmodel/Kurtosis","L4_INC_XX_01_tsmodel/Coef1","L4_INC_XX_01_tsmodel/Coef2","L4_INC_XX_01_tsmodel/Coef3","L4_INC_XX_01_tsmodel/Coef4","L4_INC_XX_01_tsmodel/Coef5","L4_INC_XX_01_tsmodel/Freq1","L4_INC_XX_01_tsmodel/Freq2","L4_INC_XX_01_tsmodel/Damp1","L4_INC_XX_01_tsmodel/Damp2","L4_INC_XX_01_tsmodel/MSE","L4_INC_XX_01_tsmodel/MAE","L4_INC_XX_01_tsmodel/AIC","L4_INC_XX_01_tsmodel/Mean","L4_INC_XX_01_tsmodel/Variance","L4_INC_XX_01_tsmodel/RMS","L4_INC_XX_01_tsmodel/Kurtosis","L4_INC_YY_01_tsmodel/Coef1","L4_INC_YY_01_tsmodel/Coef2","L4_INC_YY_01_tsmodel/Coef3","L4_INC_YY_01_tsmodel/Coef4","L4_INC_YY_01_tsmodel/Coef5","L4_INC_YY_01_tsmodel/Freq1","L4_INC_YY_01_tsmodel/Freq2","L4_INC_YY_01_tsmodel/Damp1","L4_INC_YY_01_tsmodel/Damp2","L4_INC_YY_01_tsmodel/MSE","L4_INC_YY_01_tsmodel/MAE","L4_INC_YY_01_tsmodel/AIC","L4_INC_YY_01_tsmodel/Mean","L4_INC_YY_01_tsmodel/Variance","L4_INC_YY_01_tsmodel/RMS","L4_INC_YY_01_tsmodel/Kurtosis","L5_ACC_XX_01_tsmodel/Coef1","L5_ACC_XX_01_tsmodel/Coef2","L5_ACC_XX_01_tsmodel/Coef3","L5_ACC_XX_01_tsmodel/Coef4","L5_ACC_XX_01_tsmodel/Coef5","L5_ACC_XX_01_tsmodel/Freq1","L5_ACC_XX_01_tsmodel/Freq2","L5_ACC_XX_01_tsmodel/Damp1","L5_ACC_XX_01_tsmodel/Damp2","L5_ACC_XX_01_tsmodel/MSE","L5_ACC_XX_01_tsmodel/MAE","L5_ACC_XX_01_tsmodel/AIC","L5_ACC_XX_01_tsmodel/Mean","L5_ACC_XX_01_tsmodel/Variance","L5_ACC_XX_01_tsmodel/RMS","L5_ACC_XX_01_tsmodel/Kurtosis","L5_ACC_XX_02_tsmodel/Coef1","L5_ACC_XX_02_tsmodel/Coef2","L5_ACC_XX_02_tsmodel/Coef3","L5_ACC_XX_02_tsmodel/Coef4","L5_ACC_XX_02_tsmodel/Coef5","L5_ACC_XX_02_tsmodel/Freq1","L5_ACC_XX_02_tsmodel/Freq2","L5_ACC_XX_02_tsmodel/Damp1","L5_ACC_XX_02_tsmodel/Damp2","L5_ACC_XX_02_tsmodel/MSE","L5_ACC_XX_02_tsmodel/MAE","L5_ACC_XX_02_tsmodel/AIC","L5_ACC_XX_02_tsmodel/Mean","L5_ACC_XX_02_tsmodel/Variance","L5_ACC_XX_02_tsmodel/RMS","L5_ACC_XX_02_tsmodel/Kurtosis","L5_ACC_YY_01_tsmodel/Coef1","L5_ACC_YY_01_tsmodel/Coef2","L5_ACC_YY_01_tsmodel/Coef3","L5_ACC_YY_01_tsmodel/Coef4","L5_ACC_YY_01_tsmodel/Coef5","L5_ACC_YY_01_tsmodel/Freq1","L5_ACC_YY_01_tsmodel/Freq2","L5_ACC_YY_01_tsmodel/Damp1","L5_ACC_YY_01_tsmodel/Damp2","L5_ACC_YY_01_tsmodel/MSE","L5_ACC_YY_01_tsmodel/MAE","L5_ACC_YY_01_tsmodel/AIC","L5_ACC_YY_01_tsmodel/Mean","L5_ACC_YY_01_tsmodel/Variance","L5_ACC_YY_01_tsmodel/RMS","L5_ACC_YY_01_tsmodel/Kurtosis","L5_ACC_YY_02_tsmodel/Coef1","L5_ACC_YY_02_tsmodel/Coef2","L5_ACC_YY_02_tsmodel/Coef3","L5_ACC_YY_02_tsmodel/Coef4","L5_ACC_YY_02_tsmodel/Coef5","L5_ACC_YY_02_tsmodel/Freq1","L5_ACC_YY_02_tsmodel/Freq2","L5_ACC_YY_02_tsmodel/Damp1","L5_ACC_YY_02_tsmodel/Damp2","L5_ACC_YY_02_tsmodel/MSE","L5_ACC_YY_02_tsmodel/MAE","L5_ACC_YY_02_tsmodel/AIC","L5_ACC_YY_02_tsmodel/Mean","L5_ACC_YY_02_tsmodel/Variance","L5_ACC_YY_02_tsmodel/RMS","L5_ACC_YY_02_tsmodel/Kurtosis","L5_INC_XX_01_tsmodel/Coef1","L5_INC_XX_01_tsmodel/Coef2","L5_INC_XX_01_tsmodel/Coef3","L5_INC_XX_01_tsmodel/Coef4","L5_INC_XX_01_tsmodel/Coef5","L5_INC_XX_01_tsmodel/Freq1","L5_INC_XX_01_tsmodel/Freq2","L5_INC_XX_01_tsmodel/Damp1","L5_INC_XX_01_tsmodel/Damp2","L5_INC_XX_01_tsmodel/MSE","L5_INC_XX_01_tsmodel/MAE","L5_INC_XX_01_tsmodel/AIC","L5_INC_XX_01_tsmodel/Mean","L5_INC_XX_01_tsmodel/Variance","L5_INC_XX_01_tsmodel/RMS","L5_INC_XX_01_tsmodel/Kurtosis","L5_INC_YY_01_tsmodel/Coef1","L5_INC_YY_01_tsmodel/Coef2","L5_INC_YY_01_tsmodel/Coef3","L5_INC_YY_01_tsmodel/Coef4","L5_INC_YY_01_tsmodel/Coef5","L5_INC_YY_01_tsmodel/Freq1","L5_INC_YY_01_tsmodel/Freq2","L5_INC_YY_01_tsmodel/Damp1","L5_INC_YY_01_tsmodel/Damp2","L5_INC_YY_01_tsmodel/MSE","L5_INC_YY_01_tsmodel/MAE","L5_INC_YY_01_tsmodel/AIC","L5_INC_YY_01_tsmodel/Mean","L5_INC_YY_01_tsmodel/Variance","L5_INC_YY_01_tsmodel/RMS","L5_INC_YY_01_tsmodel/Kurtosis","MSB_ACC_XX_01_tsmodel/Coef1","MSB_ACC_XX_01_tsmodel/Coef2","MSB_ACC_XX_01_tsmodel/Coef3","MSB_ACC_XX_01_tsmodel/Coef4","MSB_ACC_XX_01_tsmodel/Coef5","MSB_ACC_XX_01_tsmodel/Freq1","MSB_ACC_XX_01_tsmodel/Freq2","MSB_ACC_XX_01_tsmodel/Damp1","MSB_ACC_XX_01_tsmodel/Damp2","MSB_ACC_XX_01_tsmodel/MSE","MSB_ACC_XX_01_tsmodel/MAE","MSB_ACC_XX_01_tsmodel/AIC","MSB_ACC_XX_01_tsmodel/Mean","MSB_ACC_XX_01_tsmodel/Variance","MSB_ACC_XX_01_tsmodel/RMS","MSB_ACC_XX_01_tsmodel/Kurtosis","MSB_ACC_ZZ_02_tsmodel/Coef1","MSB_ACC_ZZ_02_tsmodel/Coef2","MSB_ACC_ZZ_02_tsmodel/Coef3","MSB_ACC_ZZ_02_tsmodel/Coef4","MSB_ACC_ZZ_02_tsmodel/Coef5","MSB_ACC_ZZ_02_tsmodel/Freq1","MSB_ACC_ZZ_02_tsmodel/Freq2","MSB_ACC_ZZ_02_tsmodel/Damp1","MSB_ACC_ZZ_02_tsmodel/Damp2","MSB_ACC_ZZ_02_tsmodel/MSE","MSB_ACC_ZZ_02_tsmodel/MAE","MSB_ACC_ZZ_02_tsmodel/AIC","MSB_ACC_ZZ_02_tsmodel/Mean","MSB_ACC_ZZ_02_tsmodel/Variance","MSB_ACC_ZZ_02_tsmodel/RMS","MSB_ACC_ZZ_02_tsmodel/Kurtosis","MSH_ACC_XX_01_tsmodel/Coef1","MSH_ACC_XX_01_tsmodel/Coef2","MSH_ACC_XX_01_tsmodel/Coef3","MSH_ACC_XX_01_tsmodel/Coef4","MSH_ACC_XX_01_tsmodel/Coef5","MSH_ACC_XX_01_tsmodel/Freq1","MSH_ACC_XX_01_tsmodel/Freq2","MSH_ACC_XX_01_tsmodel/Damp1","MSH_ACC_XX_01_tsmodel/Damp2","MSH_ACC_XX_01_tsmodel/MSE","MSH_ACC_XX_01_tsmodel/MAE","MSH_ACC_XX_01_tsmodel/AIC","MSH_ACC_XX_01_tsmodel/Mean","MSH_ACC_XX_01_tsmodel/Variance","MSH_ACC_XX_01_tsmodel/RMS","MSH_ACC_XX_01_tsmodel/Kurtosis","MSH_ACC_ZZ_01_tsmodel/Coef1","MSH_ACC_ZZ_01_tsmodel/Coef2","MSH_ACC_ZZ_01_tsmodel/Coef3","MSH_ACC_ZZ_01_tsmodel/Coef4","MSH_ACC_ZZ_01_tsmodel/Coef5","MSH_ACC_ZZ_01_tsmodel/Freq1","MSH_ACC_ZZ_01_tsmodel/Freq2","MSH_ACC_ZZ_01_tsmodel/Damp1","MSH_ACC_ZZ_01_tsmodel/Damp2","MSH_ACC_ZZ_01_tsmodel/MSE","MSH_ACC_ZZ_01_tsmodel/MAE","MSH_ACC_ZZ_01_tsmodel/AIC","MSH_ACC_ZZ_01_tsmodel/Mean","MSH_ACC_ZZ_01_tsmodel/Variance","MSH_ACC_ZZ_01_tsmodel/RMS","MSH_ACC_ZZ_01_tsmodel/Kurtosis","NMF_ACC_XX_02_tsmodel/Coef1","NMF_ACC_XX_02_tsmodel/Coef2","NMF_ACC_XX_02_tsmodel/Coef3","NMF_ACC_XX_02_tsmodel/Coef4","NMF_ACC_XX_02_tsmodel/Coef5","NMF_ACC_XX_02_tsmodel/Freq1","NMF_ACC_XX_02_tsmodel/Freq2","NMF_ACC_XX_02_tsmodel/Damp1","NMF_ACC_XX_02_tsmodel/Damp2","NMF_ACC_XX_02_tsmodel/MSE","NMF_ACC_XX_02_tsmodel/MAE","NMF_ACC_XX_02_tsmodel/AIC","NMF_ACC_XX_02_tsmodel/Mean","NMF_ACC_XX_02_tsmodel/Variance","NMF_ACC_XX_02_tsmodel/RMS","NMF_ACC_XX_02_tsmodel/Kurtosis","NMF_ACC_YY_01_tsmodel/Coef1","NMF_ACC_YY_01_tsmodel/Coef2","NMF_ACC_YY_01_tsmodel/Coef3","NMF_ACC_YY_01_tsmodel/Coef4","NMF_ACC_YY_01_tsmodel/Coef5","NMF_ACC_YY_01_tsmodel/Freq1","NMF_ACC_YY_01_tsmodel/Freq2","NMF_ACC_YY_01_tsmodel/Damp1","NMF_ACC_YY_01_tsmodel/Damp2","NMF_ACC_YY_01_tsmodel/MSE","NMF_ACC_YY_01_tsmodel/MAE","NMF_ACC_YY_01_tsmodel/AIC","NMF_ACC_YY_01_tsmodel/Mean","NMF_ACC_YY_01_tsmodel/Variance","NMF_ACC_YY_01_tsmodel/RMS","NMF_ACC_YY_01_tsmodel/Kurtosis","NMF_ACC_YY_02_tsmodel/Coef1","NMF_ACC_YY_02_tsmodel/Coef2","NMF_ACC_YY_02_tsmodel/Coef3","NMF_ACC_YY_02_tsmodel/Coef4","NMF_ACC_YY_02_tsmodel/Coef5","NMF_ACC_YY_02_tsmodel/Freq1","NMF_ACC_YY_02_tsmodel/Freq2","NMF_ACC_YY_02_tsmodel/Damp1","NMF_ACC_YY_02_tsmodel/Damp2","NMF_ACC_YY_02_tsmodel/MSE","NMF_ACC_YY_02_tsmodel/MAE","NMF_ACC_YY_02_tsmodel/AIC","NMF_ACC_YY_02_tsmodel/Mean","NMF_ACC_YY_02_tsmodel/Variance","NMF_ACC_YY_02_tsmodel/RMS","NMF_ACC_YY_02_tsmodel/Kurtosis","WM1_tsmodel/Coef1","WM1_tsmodel/Coef2","WM1_tsmodel/Coef3","WM1_tsmodel/Coef4","WM1_tsmodel/Coef5","WM1_tsmodel/Freq1","WM1_tsmodel/Freq2","WM1_tsmodel/Damp1","WM1_tsmodel/Damp2","WM1_tsmodel/MSE","WM1_tsmodel/MAE","WM1_tsmodel/AIC","WM1_tsmodel/Mean","WM1_tsmodel/Variance","WM1_tsmodel/RMS","WM1_tsmodel/Kurtosis","WM2_tsmodel/Coef1","WM2_tsmodel/Coef2","WM2_tsmodel/Coef3","WM2_tsmodel/Coef4","WM2_tsmodel/Coef5","WM2_tsmodel/Freq1","WM2_tsmodel/Freq2","WM2_tsmodel/Damp1","WM2_tsmodel/Damp2","WM2_tsmodel/MSE","WM2_tsmodel/MAE","WM2_tsmodel/AIC","WM2_tsmodel/Mean","WM2_tsmodel/Variance","WM2_tsmodel/RMS","WM2_tsmodel/Kurtosis","WM3_tsmodel/Coef1","WM3_tsmodel/Coef2","WM3_tsmodel/Coef3","WM3_tsmodel/Coef4","WM3_tsmodel/Coef5","WM3_tsmodel/Freq1","WM3_tsmodel/Freq2","WM3_tsmodel/Damp1","WM3_tsmodel/Damp2","WM3_tsmodel/MSE","WM3_tsmodel/MAE","WM3_tsmodel/AIC","WM3_tsmodel/Mean","WM3_tsmodel/Variance","WM3_tsmodel/RMS","WM3_tsmodel/Kurtosis","WM4_tsmodel/Coef1","WM4_tsmodel/Coef2","WM4_tsmodel/Coef3","WM4_tsmodel/Coef4","WM4_tsmodel/Coef5","WM4_tsmodel/Freq1","WM4_tsmodel/Freq2","WM4_tsmodel/Damp1","WM4_tsmodel/Damp2","WM4_tsmodel/MSE","WM4_tsmodel/MAE","WM4_tsmodel/AIC","WM4_tsmodel/Mean","WM4_tsmodel/Variance","WM4_tsmodel/RMS","WM4_tsmodel/Kurtosis","WM5_tsmodel/Coef1","WM5_tsmodel/Coef2","WM5_tsmodel/Coef3","WM5_tsmodel/Coef4","WM5_tsmodel/Coef5","WM5_tsmodel/Freq1","WM5_tsmodel/Freq2","WM5_tsmodel/Damp1","WM5_tsmodel/Damp2","WM5_tsmodel/MSE","WM5_tsmodel/MAE","WM5_tsmodel/AIC","WM5_tsmodel/Mean","WM5_tsmodel/Variance","WM5_tsmodel/RMS","WM5_tsmodel/Kurtosis","ATM_TEMP_01_tsfeat/Minimum","ATM_TEMP_01_tsfeat/Median","ATM_TEMP_01_tsfeat/Maximum","ATM_TEMP_01_tsfeat/Q1","ATM_TEMP_01_tsfeat/Q3","ATM_TEMP_01_tsfeat/IQR","ATM_TEMP_01_tsfeat/q1","ATM_TEMP_01_tsfeat/ACF1","ATM_TEMP_01_tsfeat/ssACF10","ATM_TEMP_01_tsfeat/PACF1","ATM_TEMP_01_tsfeat/ssPACF5","ATM_HUM_01_tsfeat/Minimum","ATM_HUM_01_tsfeat/Median","ATM_HUM_01_tsfeat/Maximum","ATM_HUM_01_tsfeat/Q1","ATM_HUM_01_tsfeat/Q3","ATM_HUM_01_tsfeat/IQR","ATM_HUM_01_tsfeat/q1","ATM_HUM_01_tsfeat/ACF1","ATM_HUM_01_tsfeat/ssACF10","ATM_HUM_01_tsfeat/PACF1","ATM_HUM_01_tsfeat/ssPACF5","GEN_ACC_XX_01_tsfeat/Minimum","GEN_ACC_XX_01_tsfeat/Median","GEN_ACC_XX_01_tsfeat/Maximum","GEN_ACC_XX_01_tsfeat/Q1","GEN_ACC_XX_01_tsfeat/Q3","GEN_ACC_XX_01_tsfeat/IQR","GEN_ACC_XX_01_tsfeat/q1","GEN_ACC_XX_01_tsfeat/ACF1","GEN_ACC_XX_01_tsfeat/ssACF10","GEN_ACC_XX_01_tsfeat/PACF1","GEN_ACC_XX_01_tsfeat/ssPACF5","GEN_ACC_YY_01_tsfeat/Minimum","GEN_ACC_YY_01_tsfeat/Median","GEN_ACC_YY_01_tsfeat/Maximum","GEN_ACC_YY_01_tsfeat/Q1","GEN_ACC_YY_01_tsfeat/Q3","GEN_ACC_YY_01_tsfeat/IQR","GEN_ACC_YY_01_tsfeat/q1","GEN_ACC_YY_01_tsfeat/ACF1","GEN_ACC_YY_01_tsfeat/ssACF10","GEN_ACC_YY_01_tsfeat/PACF1","GEN_ACC_YY_01_tsfeat/ssPACF5","GEN_ACC_ZZ_01_tsfeat/Minimum","GEN_ACC_ZZ_01_tsfeat/Median","GEN_ACC_ZZ_01_tsfeat/Maximum","GEN_ACC_ZZ_01_tsfeat/Q1","GEN_ACC_ZZ_01_tsfeat/Q3","GEN_ACC_ZZ_01_tsfeat/IQR","GEN_ACC_ZZ_01_tsfeat/q1","GEN_ACC_ZZ_01_tsfeat/ACF1","GEN_ACC_ZZ_01_tsfeat/ssACF10","GEN_ACC_ZZ_01_tsfeat/PACF1","GEN_ACC_ZZ_01_tsfeat/ssPACF5","L1_FBSG_01_tsfeat/Minimum","L1_FBSG_01_tsfeat/Median","L1_FBSG_01_tsfeat/Maximum","L1_FBSG_01_tsfeat/Q1","L1_FBSG_01_tsfeat/Q3","L1_FBSG_01_tsfeat/IQR","L1_FBSG_01_tsfeat/q1","L1_FBSG_01_tsfeat/ACF1","L1_FBSG_01_tsfeat/ssACF10","L1_FBSG_01_tsfeat/PACF1","L1_FBSG_01_tsfeat/ssPACF5","L1_FBSG_02_tsfeat/Minimum","L1_FBSG_02_tsfeat/Median","L1_FBSG_02_tsfeat/Maximum","L1_FBSG_02_tsfeat/Q1","L1_FBSG_02_tsfeat/Q3","L1_FBSG_02_tsfeat/IQR","L1_FBSG_02_tsfeat/q1","L1_FBSG_02_tsfeat/ACF1","L1_FBSG_02_tsfeat/ssACF10","L1_FBSG_02_tsfeat/PACF1","L1_FBSG_02_tsfeat/ssPACF5","L3_ACC_XX_01_tsfeat/Minimum","L3_ACC_XX_01_tsfeat/Median","L3_ACC_XX_01_tsfeat/Maximum","L3_ACC_XX_01_tsfeat/Q1","L3_ACC_XX_01_tsfeat/Q3","L3_ACC_XX_01_tsfeat/IQR","L3_ACC_XX_01_tsfeat/q1","L3_ACC_XX_01_tsfeat/ACF1","L3_ACC_XX_01_tsfeat/ssACF10","L3_ACC_XX_01_tsfeat/PACF1","L3_ACC_XX_01_tsfeat/ssPACF5","L3_ACC_XX_02_tsfeat/Minimum","L3_ACC_XX_02_tsfeat/Median","L3_ACC_XX_02_tsfeat/Maximum","L3_ACC_XX_02_tsfeat/Q1","L3_ACC_XX_02_tsfeat/Q3","L3_ACC_XX_02_tsfeat/IQR","L3_ACC_XX_02_tsfeat/q1","L3_ACC_XX_02_tsfeat/ACF1","L3_ACC_XX_02_tsfeat/ssACF10","L3_ACC_XX_02_tsfeat/PACF1","L3_ACC_XX_02_tsfeat/ssPACF5","L3_ACC_YY_01_tsfeat/Minimum","L3_ACC_YY_01_tsfeat/Median","L3_ACC_YY_01_tsfeat/Maximum","L3_ACC_YY_01_tsfeat/Q1","L3_ACC_YY_01_tsfeat/Q3","L3_ACC_YY_01_tsfeat/IQR","L3_ACC_YY_01_tsfeat/q1","L3_ACC_YY_01_tsfeat/ACF1","L3_ACC_YY_01_tsfeat/ssACF10","L3_ACC_YY_01_tsfeat/PACF1","L3_ACC_YY_01_tsfeat/ssPACF5","L3_ACC_YY_02_tsfeat/Minimum","L3_ACC_YY_02_tsfeat/Median","L3_ACC_YY_02_tsfeat/Maximum","L3_ACC_YY_02_tsfeat/Q1","L3_ACC_YY_02_tsfeat/Q3","L3_ACC_YY_02_tsfeat/IQR","L3_ACC_YY_02_tsfeat/q1","L3_ACC_YY_02_tsfeat/ACF1","L3_ACC_YY_02_tsfeat/ssACF10","L3_ACC_YY_02_tsfeat/PACF1","L3_ACC_YY_02_tsfeat/ssPACF5","L4_ACC_XX_01_tsfeat/Minimum","L4_ACC_XX_01_tsfeat/Median","L4_ACC_XX_01_tsfeat/Maximum","L4_ACC_XX_01_tsfeat/Q1","L4_ACC_XX_01_tsfeat/Q3","L4_ACC_XX_01_tsfeat/IQR","L4_ACC_XX_01_tsfeat/q1","L4_ACC_XX_01_tsfeat/ACF1","L4_ACC_XX_01_tsfeat/ssACF10","L4_ACC_XX_01_tsfeat/PACF1","L4_ACC_XX_01_tsfeat/ssPACF5","L4_ACC_XX_02_tsfeat/Minimum","L4_ACC_XX_02_tsfeat/Median","L4_ACC_XX_02_tsfeat/Maximum","L4_ACC_XX_02_tsfeat/Q1","L4_ACC_XX_02_tsfeat/Q3","L4_ACC_XX_02_tsfeat/IQR","L4_ACC_XX_02_tsfeat/q1","L4_ACC_XX_02_tsfeat/ACF1","L4_ACC_XX_02_tsfeat/ssACF10","L4_ACC_XX_02_tsfeat/PACF1","L4_ACC_XX_02_tsfeat/ssPACF5","L4_ACC_YY_01_tsfeat/Minimum","L4_ACC_YY_01_tsfeat/Median","L4_ACC_YY_01_tsfeat/Maximum","L4_ACC_YY_01_tsfeat/Q1","L4_ACC_YY_01_tsfeat/Q3","L4_ACC_YY_01_tsfeat/IQR","L4_ACC_YY_01_tsfeat/q1","L4_ACC_YY_01_tsfeat/ACF1","L4_ACC_YY_01_tsfeat/ssACF10","L4_ACC_YY_01_tsfeat/PACF1","L4_ACC_YY_01_tsfeat/ssPACF5","L4_ACC_YY_02_tsfeat/Minimum","L4_ACC_YY_02_tsfeat/Median","L4_ACC_YY_02_tsfeat/Maximum","L4_ACC_YY_02_tsfeat/Q1","L4_ACC_YY_02_tsfeat/Q3","L4_ACC_YY_02_tsfeat/IQR","L4_ACC_YY_02_tsfeat/q1","L4_ACC_YY_02_tsfeat/ACF1","L4_ACC_YY_02_tsfeat/ssACF10","L4_ACC_YY_02_tsfeat/PACF1","L4_ACC_YY_02_tsfeat/ssPACF5","L4_INC_XX_01_tsfeat/Minimum","L4_INC_XX_01_tsfeat/Median","L4_INC_XX_01_tsfeat/Maximum","L4_INC_XX_01_tsfeat/Q1","L4_INC_XX_01_tsfeat/Q3","L4_INC_XX_01_tsfeat/IQR","L4_INC_XX_01_tsfeat/q1","L4_INC_XX_01_tsfeat/ACF1","L4_INC_XX_01_tsfeat/ssACF10","L4_INC_XX_01_tsfeat/PACF1","L4_INC_XX_01_tsfeat/ssPACF5","L4_INC_YY_01_tsfeat/Minimum","L4_INC_YY_01_tsfeat/Median","L4_INC_YY_01_tsfeat/Maximum","L4_INC_YY_01_tsfeat/Q1","L4_INC_YY_01_tsfeat/Q3","L4_INC_YY_01_tsfeat/IQR","L4_INC_YY_01_tsfeat/q1","L4_INC_YY_01_tsfeat/ACF1","L4_INC_YY_01_tsfeat/ssACF10","L4_INC_YY_01_tsfeat/PACF1","L4_INC_YY_01_tsfeat/ssPACF5","L5_ACC_XX_01_tsfeat/Minimum","L5_ACC_XX_01_tsfeat/Median","L5_ACC_XX_01_tsfeat/Maximum","L5_ACC_XX_01_tsfeat/Q1","L5_ACC_XX_01_tsfeat/Q3","L5_ACC_XX_01_tsfeat/IQR","L5_ACC_XX_01_tsfeat/q1","L5_ACC_XX_01_tsfeat/ACF1","L5_ACC_XX_01_tsfeat/ssACF10","L5_ACC_XX_01_tsfeat/PACF1","L5_ACC_XX_01_tsfeat/ssPACF5","L5_ACC_XX_02_tsfeat/Minimum","L5_ACC_XX_02_tsfeat/Median","L5_ACC_XX_02_tsfeat/Maximum","L5_ACC_XX_02_tsfeat/Q1","L5_ACC_XX_02_tsfeat/Q3","L5_ACC_XX_02_tsfeat/IQR","L5_ACC_XX_02_tsfeat/q1","L5_ACC_XX_02_tsfeat/ACF1","L5_ACC_XX_02_tsfeat/ssACF10","L5_ACC_XX_02_tsfeat/PACF1","L5_ACC_XX_02_tsfeat/ssPACF5","L5_ACC_YY_01_tsfeat/Minimum","L5_ACC_YY_01_tsfeat/Median","L5_ACC_YY_01_tsfeat/Maximum","L5_ACC_YY_01_tsfeat/Q1","L5_ACC_YY_01_tsfeat/Q3","L5_ACC_YY_01_tsfeat/IQR","L5_ACC_YY_01_tsfeat/q1","L5_ACC_YY_01_tsfeat/ACF1","L5_ACC_YY_01_tsfeat/ssACF10","L5_ACC_YY_01_tsfeat/PACF1","L5_ACC_YY_01_tsfeat/ssPACF5","L5_ACC_YY_02_tsfeat/Minimum","L5_ACC_YY_02_tsfeat/Median","L5_ACC_YY_02_tsfeat/Maximum","L5_ACC_YY_02_tsfeat/Q1","L5_ACC_YY_02_tsfeat/Q3","L5_ACC_YY_02_tsfeat/IQR","L5_ACC_YY_02_tsfeat/q1","L5_ACC_YY_02_tsfeat/ACF1","L5_ACC_YY_02_tsfeat/ssACF10","L5_ACC_YY_02_tsfeat/PACF1","L5_ACC_YY_02_tsfeat/ssPACF5","L5_INC_XX_01_tsfeat/Minimum","L5_INC_XX_01_tsfeat/Median","L5_INC_XX_01_tsfeat/Maximum","L5_INC_XX_01_tsfeat/Q1","L5_INC_XX_01_tsfeat/Q3","L5_INC_XX_01_tsfeat/IQR","L5_INC_XX_01_tsfeat/q1","L5_INC_XX_01_tsfeat/ACF1","L5_INC_XX_01_tsfeat/ssACF10","L5_INC_XX_01_tsfeat/PACF1","L5_INC_XX_01_tsfeat/ssPACF5","L5_INC_YY_01_tsfeat/Minimum","L5_INC_YY_01_tsfeat/Median","L5_INC_YY_01_tsfeat/Maximum","L5_INC_YY_01_tsfeat/Q1","L5_INC_YY_01_tsfeat/Q3","L5_INC_YY_01_tsfeat/IQR","L5_INC_YY_01_tsfeat/q1","L5_INC_YY_01_tsfeat/ACF1","L5_INC_YY_01_tsfeat/ssACF10","L5_INC_YY_01_tsfeat/PACF1","L5_INC_YY_01_tsfeat/ssPACF5","MSB_ACC_XX_01_tsfeat/Minimum","MSB_ACC_XX_01_tsfeat/Median","MSB_ACC_XX_01_tsfeat/Maximum","MSB_ACC_XX_01_tsfeat/Q1","MSB_ACC_XX_01_tsfeat/Q3","MSB_ACC_XX_01_tsfeat/IQR","MSB_ACC_XX_01_tsfeat/q1","MSB_ACC_XX_01_tsfeat/ACF1","MSB_ACC_XX_01_tsfeat/ssACF10","MSB_ACC_XX_01_tsfeat/PACF1","MSB_ACC_XX_01_tsfeat/ssPACF5","MSB_ACC_ZZ_02_tsfeat/Minimum","MSB_ACC_ZZ_02_tsfeat/Median","MSB_ACC_ZZ_02_tsfeat/Maximum","MSB_ACC_ZZ_02_tsfeat/Q1","MSB_ACC_ZZ_02_tsfeat/Q3","MSB_ACC_ZZ_02_tsfeat/IQR","MSB_ACC_ZZ_02_tsfeat/q1","MSB_ACC_ZZ_02_tsfeat/ACF1","MSB_ACC_ZZ_02_tsfeat/ssACF10","MSB_ACC_ZZ_02_tsfeat/PACF1","MSB_ACC_ZZ_02_tsfeat/ssPACF5","MSH_ACC_XX_01_tsfeat/Minimum","MSH_ACC_XX_01_tsfeat/Median","MSH_ACC_XX_01_tsfeat/Maximum","MSH_ACC_XX_01_tsfeat/Q1","MSH_ACC_XX_01_tsfeat/Q3","MSH_ACC_XX_01_tsfeat/IQR","MSH_ACC_XX_01_tsfeat/q1","MSH_ACC_XX_01_tsfeat/ACF1","MSH_ACC_XX_01_tsfeat/ssACF10","MSH_ACC_XX_01_tsfeat/PACF1","MSH_ACC_XX_01_tsfeat/ssPACF5","MSH_ACC_ZZ_01_tsfeat/Minimum","MSH_ACC_ZZ_01_tsfeat/Median","MSH_ACC_ZZ_01_tsfeat/Maximum","MSH_ACC_ZZ_01_tsfeat/Q1","MSH_ACC_ZZ_01_tsfeat/Q3","MSH_ACC_ZZ_01_tsfeat/IQR","MSH_ACC_ZZ_01_tsfeat/q1","MSH_ACC_ZZ_01_tsfeat/ACF1","MSH_ACC_ZZ_01_tsfeat/ssACF10","MSH_ACC_ZZ_01_tsfeat/PACF1","MSH_ACC_ZZ_01_tsfeat/ssPACF5","NMF_ACC_XX_02_tsfeat/Minimum","NMF_ACC_XX_02_tsfeat/Median","NMF_ACC_XX_02_tsfeat/Maximum","NMF_ACC_XX_02_tsfeat/Q1","NMF_ACC_XX_02_tsfeat/Q3","NMF_ACC_XX_02_tsfeat/IQR","NMF_ACC_XX_02_tsfeat/q1","NMF_ACC_XX_02_tsfeat/ACF1","NMF_ACC_XX_02_tsfeat/ssACF10","NMF_ACC_XX_02_tsfeat/PACF1","NMF_ACC_XX_02_tsfeat/ssPACF5","NMF_ACC_YY_01_tsfeat/Minimum","NMF_ACC_YY_01_tsfeat/Median","NMF_ACC_YY_01_tsfeat/Maximum","NMF_ACC_YY_01_tsfeat/Q1","NMF_ACC_YY_01_tsfeat/Q3","NMF_ACC_YY_01_tsfeat/IQR","NMF_ACC_YY_01_tsfeat/q1","NMF_ACC_YY_01_tsfeat/ACF1","NMF_ACC_YY_01_tsfeat/ssACF10","NMF_ACC_YY_01_tsfeat/PACF1","NMF_ACC_YY_01_tsfeat/ssPACF5","NMF_ACC_YY_02_tsfeat/Minimum","NMF_ACC_YY_02_tsfeat/Median","NMF_ACC_YY_02_tsfeat/Maximum","NMF_ACC_YY_02_tsfeat/Q1","NMF_ACC_YY_02_tsfeat/Q3","NMF_ACC_YY_02_tsfeat/IQR","NMF_ACC_YY_02_tsfeat/q1","NMF_ACC_YY_02_tsfeat/ACF1","NMF_ACC_YY_02_tsfeat/ssACF10","NMF_ACC_YY_02_tsfeat/PACF1","NMF_ACC_YY_02_tsfeat/ssPACF5","WM1_tsfeat/Minimum","WM1_tsfeat/Median","WM1_tsfeat/Maximum","WM1_tsfeat/Q1","WM1_tsfeat/Q3","WM1_tsfeat/IQR","WM1_tsfeat/q1","WM1_tsfeat/ACF1","WM1_tsfeat/ssACF10","WM1_tsfeat/PACF1","WM1_tsfeat/ssPACF5","WM2_tsfeat/Minimum","WM2_tsfeat/Median","WM2_tsfeat/Maximum","WM2_tsfeat/Q1","WM2_tsfeat/Q3","WM2_tsfeat/IQR","WM2_tsfeat/q1","WM2_tsfeat/ACF1","WM2_tsfeat/ssACF10","WM2_tsfeat/PACF1","WM2_tsfeat/ssPACF5","WM3_tsfeat/Minimum","WM3_tsfeat/Median","WM3_tsfeat/Maximum","WM3_tsfeat/Q1","WM3_tsfeat/Q3","WM3_tsfeat/IQR","WM3_tsfeat/q1","WM3_tsfeat/ACF1","WM3_tsfeat/ssACF10","WM3_tsfeat/PACF1","WM3_tsfeat/ssPACF5","WM4_tsfeat/Minimum","WM4_tsfeat/Median","WM4_tsfeat/Maximum","WM4_tsfeat/Q1","WM4_tsfeat/Q3","WM4_tsfeat/IQR","WM4_tsfeat/q1","WM4_tsfeat/ACF1","WM4_tsfeat/ssACF10","WM4_tsfeat/PACF1","WM4_tsfeat/ssPACF5","WM5_tsfeat/Minimum","WM5_tsfeat/Median","WM5_tsfeat/Maximum","WM5_tsfeat/Q1","WM5_tsfeat/Q3","WM5_tsfeat/IQR","WM5_tsfeat/q1","WM5_tsfeat/ACF1","WM5_tsfeat/ssACF10","WM5_tsfeat/PACF1","WM5_tsfeat/ssPACF5","ATM_TEMP_01_sigstats/ClearanceFactor","ATM_TEMP_01_sigstats/CrestFactor","ATM_TEMP_01_sigstats/ImpulseFactor","ATM_TEMP_01_sigstats/Kurtosis","ATM_TEMP_01_sigstats/Mean","ATM_TEMP_01_sigstats/PeakValue","ATM_TEMP_01_sigstats/RMS","ATM_TEMP_01_sigstats/SINAD","ATM_TEMP_01_sigstats/SNR","ATM_TEMP_01_sigstats/ShapeFactor","ATM_TEMP_01_sigstats/Skewness","ATM_TEMP_01_sigstats/Std","ATM_TEMP_01_sigstats/THD","ATM_HUM_01_sigstats/ClearanceFactor","ATM_HUM_01_sigstats/CrestFactor","ATM_HUM_01_sigstats/ImpulseFactor","ATM_HUM_01_sigstats/Kurtosis","ATM_HUM_01_sigstats/Mean","ATM_HUM_01_sigstats/PeakValue","ATM_HUM_01_sigstats/RMS","ATM_HUM_01_sigstats/SINAD","ATM_HUM_01_sigstats/SNR","ATM_HUM_01_sigstats/ShapeFactor","ATM_HUM_01_sigstats/Skewness","ATM_HUM_01_sigstats/Std","ATM_HUM_01_sigstats/THD","GEN_ACC_XX_01_sigstats/ClearanceFactor","GEN_ACC_XX_01_sigstats/CrestFactor","GEN_ACC_XX_01_sigstats/ImpulseFactor","GEN_ACC_XX_01_sigstats/Kurtosis","GEN_ACC_XX_01_sigstats/Mean","GEN_ACC_XX_01_sigstats/PeakValue","GEN_ACC_XX_01_sigstats/RMS","GEN_ACC_XX_01_sigstats/SINAD","GEN_ACC_XX_01_sigstats/SNR","GEN_ACC_XX_01_sigstats/ShapeFactor","GEN_ACC_XX_01_sigstats/Skewness","GEN_ACC_XX_01_sigstats/Std","GEN_ACC_XX_01_sigstats/THD","GEN_ACC_YY_01_sigstats/ClearanceFactor","GEN_ACC_YY_01_sigstats/CrestFactor","GEN_ACC_YY_01_sigstats/ImpulseFactor","GEN_ACC_YY_01_sigstats/Kurtosis","GEN_ACC_YY_01_sigstats/Mean","GEN_ACC_YY_01_sigstats/PeakValue","GEN_ACC_YY_01_sigstats/RMS","GEN_ACC_YY_01_sigstats/SINAD","GEN_ACC_YY_01_sigstats/SNR","GEN_ACC_YY_01_sigstats/ShapeFactor","GEN_ACC_YY_01_sigstats/Skewness","GEN_ACC_YY_01_sigstats/Std","GEN_ACC_YY_01_sigstats/THD","GEN_ACC_ZZ_01_sigstats/ClearanceFactor","GEN_ACC_ZZ_01_sigstats/CrestFactor","GEN_ACC_ZZ_01_sigstats/ImpulseFactor","GEN_ACC_ZZ_01_sigstats/Kurtosis","GEN_ACC_ZZ_01_sigstats/Mean","GEN_ACC_ZZ_01_sigstats/PeakValue","GEN_ACC_ZZ_01_sigstats/RMS","GEN_ACC_ZZ_01_sigstats/SINAD","GEN_ACC_ZZ_01_sigstats/SNR","GEN_ACC_ZZ_01_sigstats/ShapeFactor","GEN_ACC_ZZ_01_sigstats/Skewness","GEN_ACC_ZZ_01_sigstats/Std","GEN_ACC_ZZ_01_sigstats/THD","L1_FBSG_01_sigstats/ClearanceFactor","L1_FBSG_01_sigstats/CrestFactor","L1_FBSG_01_sigstats/ImpulseFactor","L1_FBSG_01_sigstats/Kurtosis","L1_FBSG_01_sigstats/Mean","L1_FBSG_01_sigstats/PeakValue","L1_FBSG_01_sigstats/RMS","L1_FBSG_01_sigstats/SINAD","L1_FBSG_01_sigstats/SNR","L1_FBSG_01_sigstats/ShapeFactor","L1_FBSG_01_sigstats/Skewness","L1_FBSG_01_sigstats/Std","L1_FBSG_01_sigstats/THD","L1_FBSG_02_sigstats/ClearanceFactor","L1_FBSG_02_sigstats/CrestFactor","L1_FBSG_02_sigstats/ImpulseFactor","L1_FBSG_02_sigstats/Kurtosis","L1_FBSG_02_sigstats/Mean","L1_FBSG_02_sigstats/PeakValue","L1_FBSG_02_sigstats/RMS","L1_FBSG_02_sigstats/SINAD","L1_FBSG_02_sigstats/SNR","L1_FBSG_02_sigstats/ShapeFactor","L1_FBSG_02_sigstats/Skewness","L1_FBSG_02_sigstats/Std","L1_FBSG_02_sigstats/THD","L3_ACC_XX_01_sigstats/ClearanceFactor","L3_ACC_XX_01_sigstats/CrestFactor","L3_ACC_XX_01_sigstats/ImpulseFactor","L3_ACC_XX_01_sigstats/Kurtosis","L3_ACC_XX_01_sigstats/Mean","L3_ACC_XX_01_sigstats/PeakValue","L3_ACC_XX_01_sigstats/RMS","L3_ACC_XX_01_sigstats/SINAD","L3_ACC_XX_01_sigstats/SNR","L3_ACC_XX_01_sigstats/ShapeFactor","L3_ACC_XX_01_sigstats/Skewness","L3_ACC_XX_01_sigstats/Std","L3_ACC_XX_01_sigstats/THD","L3_ACC_XX_02_sigstats/ClearanceFactor","L3_ACC_XX_02_sigstats/CrestFactor","L3_ACC_XX_02_sigstats/ImpulseFactor","L3_ACC_XX_02_sigstats/Kurtosis","L3_ACC_XX_02_sigstats/Mean","L3_ACC_XX_02_sigstats/PeakValue","L3_ACC_XX_02_sigstats/RMS","L3_ACC_XX_02_sigstats/SINAD","L3_ACC_XX_02_sigstats/SNR","L3_ACC_XX_02_sigstats/ShapeFactor","L3_ACC_XX_02_sigstats/Skewness","L3_ACC_XX_02_sigstats/Std","L3_ACC_XX_02_sigstats/THD","L3_ACC_YY_01_sigstats/ClearanceFactor","L3_ACC_YY_01_sigstats/CrestFactor","L3_ACC_YY_01_sigstats/ImpulseFactor","L3_ACC_YY_01_sigstats/Kurtosis","L3_ACC_YY_01_sigstats/Mean","L3_ACC_YY_01_sigstats/PeakValue","L3_ACC_YY_01_sigstats/RMS","L3_ACC_YY_01_sigstats/SINAD","L3_ACC_YY_01_sigstats/SNR","L3_ACC_YY_01_sigstats/ShapeFactor","L3_ACC_YY_01_sigstats/Skewness","L3_ACC_YY_01_sigstats/Std","L3_ACC_YY_01_sigstats/THD","L3_ACC_YY_02_sigstats/ClearanceFactor","L3_ACC_YY_02_sigstats/CrestFactor","L3_ACC_YY_02_sigstats/ImpulseFactor","L3_ACC_YY_02_sigstats/Kurtosis","L3_ACC_YY_02_sigstats/Mean","L3_ACC_YY_02_sigstats/PeakValue","L3_ACC_YY_02_sigstats/RMS","L3_ACC_YY_02_sigstats/SINAD","L3_ACC_YY_02_sigstats/SNR","L3_ACC_YY_02_sigstats/ShapeFactor","L3_ACC_YY_02_sigstats/Skewness","L3_ACC_YY_02_sigstats/Std","L3_ACC_YY_02_sigstats/THD","L4_ACC_XX_01_sigstats/ClearanceFactor","L4_ACC_XX_01_sigstats/CrestFactor","L4_ACC_XX_01_sigstats/ImpulseFactor","L4_ACC_XX_01_sigstats/Kurtosis","L4_ACC_XX_01_sigstats/Mean","L4_ACC_XX_01_sigstats/PeakValue","L4_ACC_XX_01_sigstats/RMS","L4_ACC_XX_01_sigstats/SINAD","L4_ACC_XX_01_sigstats/SNR","L4_ACC_XX_01_sigstats/ShapeFactor","L4_ACC_XX_01_sigstats/Skewness","L4_ACC_XX_01_sigstats/Std","L4_ACC_XX_01_sigstats/THD","L4_ACC_XX_02_sigstats/ClearanceFactor","L4_ACC_XX_02_sigstats/CrestFactor","L4_ACC_XX_02_sigstats/ImpulseFactor","L4_ACC_XX_02_sigstats/Kurtosis","L4_ACC_XX_02_sigstats/Mean","L4_ACC_XX_02_sigstats/PeakValue","L4_ACC_XX_02_sigstats/RMS","L4_ACC_XX_02_sigstats/SINAD","L4_ACC_XX_02_sigstats/SNR","L4_ACC_XX_02_sigstats/ShapeFactor","L4_ACC_XX_02_sigstats/Skewness","L4_ACC_XX_02_sigstats/Std","L4_ACC_XX_02_sigstats/THD","L4_ACC_YY_01_sigstats/ClearanceFactor","L4_ACC_YY_01_sigstats/CrestFactor","L4_ACC_YY_01_sigstats/ImpulseFactor","L4_ACC_YY_01_sigstats/Kurtosis","L4_ACC_YY_01_sigstats/Mean","L4_ACC_YY_01_sigstats/PeakValue","L4_ACC_YY_01_sigstats/RMS","L4_ACC_YY_01_sigstats/SINAD","L4_ACC_YY_01_sigstats/SNR","L4_ACC_YY_01_sigstats/ShapeFactor","L4_ACC_YY_01_sigstats/Skewness","L4_ACC_YY_01_sigstats/Std","L4_ACC_YY_01_sigstats/THD","L4_ACC_YY_02_sigstats/ClearanceFactor","L4_ACC_YY_02_sigstats/CrestFactor","L4_ACC_YY_02_sigstats/ImpulseFactor","L4_ACC_YY_02_sigstats/Kurtosis","L4_ACC_YY_02_sigstats/Mean","L4_ACC_YY_02_sigstats/PeakValue","L4_ACC_YY_02_sigstats/RMS","L4_ACC_YY_02_sigstats/SINAD","L4_ACC_YY_02_sigstats/SNR","L4_ACC_YY_02_sigstats/ShapeFactor","L4_ACC_YY_02_sigstats/Skewness","L4_ACC_YY_02_sigstats/Std","L4_ACC_YY_02_sigstats/THD","L4_INC_XX_01_sigstats/ClearanceFactor","L4_INC_XX_01_sigstats/CrestFactor","L4_INC_XX_01_sigstats/ImpulseFactor","L4_INC_XX_01_sigstats/Kurtosis","L4_INC_XX_01_sigstats/Mean","L4_INC_XX_01_sigstats/PeakValue","L4_INC_XX_01_sigstats/RMS","L4_INC_XX_01_sigstats/SINAD","L4_INC_XX_01_sigstats/SNR","L4_INC_XX_01_sigstats/ShapeFactor","L4_INC_XX_01_sigstats/Skewness","L4_INC_XX_01_sigstats/Std","L4_INC_XX_01_sigstats/THD","L4_INC_YY_01_sigstats/ClearanceFactor","L4_INC_YY_01_sigstats/CrestFactor","L4_INC_YY_01_sigstats/ImpulseFactor","L4_INC_YY_01_sigstats/Kurtosis","L4_INC_YY_01_sigstats/Mean","L4_INC_YY_01_sigstats/PeakValue","L4_INC_YY_01_sigstats/RMS","L4_INC_YY_01_sigstats/SINAD","L4_INC_YY_01_sigstats/SNR","L4_INC_YY_01_sigstats/ShapeFactor","L4_INC_YY_01_sigstats/Skewness","L4_INC_YY_01_sigstats/Std","L4_INC_YY_01_sigstats/THD","L5_ACC_XX_01_sigstats/ClearanceFactor","L5_ACC_XX_01_sigstats/CrestFactor","L5_ACC_XX_01_sigstats/ImpulseFactor","L5_ACC_XX_01_sigstats/Kurtosis","L5_ACC_XX_01_sigstats/Mean","L5_ACC_XX_01_sigstats/PeakValue","L5_ACC_XX_01_sigstats/RMS","L5_ACC_XX_01_sigstats/SINAD","L5_ACC_XX_01_sigstats/SNR","L5_ACC_XX_01_sigstats/ShapeFactor","L5_ACC_XX_01_sigstats/Skewness","L5_ACC_XX_01_sigstats/Std","L5_ACC_XX_01_sigstats/THD","L5_ACC_XX_02_sigstats/ClearanceFactor","L5_ACC_XX_02_sigstats/CrestFactor","L5_ACC_XX_02_sigstats/ImpulseFactor","L5_ACC_XX_02_sigstats/Kurtosis","L5_ACC_XX_02_sigstats/Mean","L5_ACC_XX_02_sigstats/PeakValue","L5_ACC_XX_02_sigstats/RMS","L5_ACC_XX_02_sigstats/SINAD","L5_ACC_XX_02_sigstats/SNR","L5_ACC_XX_02_sigstats/ShapeFactor","L5_ACC_XX_02_sigstats/Skewness","L5_ACC_XX_02_sigstats/Std","L5_ACC_XX_02_sigstats/THD","L5_ACC_YY_01_sigstats/ClearanceFactor","L5_ACC_YY_01_sigstats/CrestFactor","L5_ACC_YY_01_sigstats/ImpulseFactor","L5_ACC_YY_01_sigstats/Kurtosis","L5_ACC_YY_01_sigstats/Mean","L5_ACC_YY_01_sigstats/PeakValue","L5_ACC_YY_01_sigstats/RMS","L5_ACC_YY_01_sigstats/SINAD","L5_ACC_YY_01_sigstats/SNR","L5_ACC_YY_01_sigstats/ShapeFactor","L5_ACC_YY_01_sigstats/Skewness","L5_ACC_YY_01_sigstats/Std","L5_ACC_YY_01_sigstats/THD","L5_ACC_YY_02_sigstats/ClearanceFactor","L5_ACC_YY_02_sigstats/CrestFactor","L5_ACC_YY_02_sigstats/ImpulseFactor","L5_ACC_YY_02_sigstats/Kurtosis","L5_ACC_YY_02_sigstats/Mean","L5_ACC_YY_02_sigstats/PeakValue","L5_ACC_YY_02_sigstats/RMS","L5_ACC_YY_02_sigstats/SINAD","L5_ACC_YY_02_sigstats/SNR","L5_ACC_YY_02_sigstats/ShapeFactor","L5_ACC_YY_02_sigstats/Skewness","L5_ACC_YY_02_sigstats/Std","L5_ACC_YY_02_sigstats/THD","L5_INC_XX_01_sigstats/ClearanceFactor","L5_INC_XX_01_sigstats/CrestFactor","L5_INC_XX_01_sigstats/ImpulseFactor","L5_INC_XX_01_sigstats/Kurtosis","L5_INC_XX_01_sigstats/Mean","L5_INC_XX_01_sigstats/PeakValue","L5_INC_XX_01_sigstats/RMS","L5_INC_XX_01_sigstats/SINAD","L5_INC_XX_01_sigstats/SNR","L5_INC_XX_01_sigstats/ShapeFactor","L5_INC_XX_01_sigstats/Skewness","L5_INC_XX_01_sigstats/Std","L5_INC_XX_01_sigstats/THD","L5_INC_YY_01_sigstats/ClearanceFactor","L5_INC_YY_01_sigstats/CrestFactor","L5_INC_YY_01_sigstats/ImpulseFactor","L5_INC_YY_01_sigstats/Kurtosis","L5_INC_YY_01_sigstats/Mean","L5_INC_YY_01_sigstats/PeakValue","L5_INC_YY_01_sigstats/RMS","L5_INC_YY_01_sigstats/SINAD","L5_INC_YY_01_sigstats/SNR","L5_INC_YY_01_sigstats/ShapeFactor","L5_INC_YY_01_sigstats/Skewness","L5_INC_YY_01_sigstats/Std","L5_INC_YY_01_sigstats/THD","MSB_ACC_XX_01_sigstats/ClearanceFactor","MSB_ACC_XX_01_sigstats/CrestFactor","MSB_ACC_XX_01_sigstats/ImpulseFactor","MSB_ACC_XX_01_sigstats/Kurtosis","MSB_ACC_XX_01_sigstats/Mean","MSB_ACC_XX_01_sigstats/PeakValue","MSB_ACC_XX_01_sigstats/RMS","MSB_ACC_XX_01_sigstats/SINAD","MSB_ACC_XX_01_sigstats/SNR","MSB_ACC_XX_01_sigstats/ShapeFactor","MSB_ACC_XX_01_sigstats/Skewness","MSB_ACC_XX_01_sigstats/Std","MSB_ACC_XX_01_sigstats/THD","MSB_ACC_ZZ_02_sigstats/ClearanceFactor","MSB_ACC_ZZ_02_sigstats/CrestFactor","MSB_ACC_ZZ_02_sigstats/ImpulseFactor","MSB_ACC_ZZ_02_sigstats/Kurtosis","MSB_ACC_ZZ_02_sigstats/Mean","MSB_ACC_ZZ_02_sigstats/PeakValue","MSB_ACC_ZZ_02_sigstats/RMS","MSB_ACC_ZZ_02_sigstats/SINAD","MSB_ACC_ZZ_02_sigstats/SNR","MSB_ACC_ZZ_02_sigstats/ShapeFactor","MSB_ACC_ZZ_02_sigstats/Skewness","MSB_ACC_ZZ_02_sigstats/Std","MSB_ACC_ZZ_02_sigstats/THD","MSH_ACC_XX_01_sigstats/ClearanceFactor","MSH_ACC_XX_01_sigstats/CrestFactor","MSH_ACC_XX_01_sigstats/ImpulseFactor","MSH_ACC_XX_01_sigstats/Kurtosis","MSH_ACC_XX_01_sigstats/Mean","MSH_ACC_XX_01_sigstats/PeakValue","MSH_ACC_XX_01_sigstats/RMS","MSH_ACC_XX_01_sigstats/SINAD","MSH_ACC_XX_01_sigstats/SNR","MSH_ACC_XX_01_sigstats/ShapeFactor","MSH_ACC_XX_01_sigstats/Skewness","MSH_ACC_XX_01_sigstats/Std","MSH_ACC_XX_01_sigstats/THD","MSH_ACC_ZZ_01_sigstats/ClearanceFactor","MSH_ACC_ZZ_01_sigstats/CrestFactor","MSH_ACC_ZZ_01_sigstats/ImpulseFactor","MSH_ACC_ZZ_01_sigstats/Kurtosis","MSH_ACC_ZZ_01_sigstats/Mean","MSH_ACC_ZZ_01_sigstats/PeakValue","MSH_ACC_ZZ_01_sigstats/RMS","MSH_ACC_ZZ_01_sigstats/SINAD","MSH_ACC_ZZ_01_sigstats/SNR","MSH_ACC_ZZ_01_sigstats/ShapeFactor","MSH_ACC_ZZ_01_sigstats/Skewness","MSH_ACC_ZZ_01_sigstats/Std","MSH_ACC_ZZ_01_sigstats/THD","NMF_ACC_XX_02_sigstats/ClearanceFactor","NMF_ACC_XX_02_sigstats/CrestFactor","NMF_ACC_XX_02_sigstats/ImpulseFactor","NMF_ACC_XX_02_sigstats/Kurtosis","NMF_ACC_XX_02_sigstats/Mean","NMF_ACC_XX_02_sigstats/PeakValue","NMF_ACC_XX_02_sigstats/RMS","NMF_ACC_XX_02_sigstats/SINAD","NMF_ACC_XX_02_sigstats/SNR","NMF_ACC_XX_02_sigstats/ShapeFactor","NMF_ACC_XX_02_sigstats/Skewness","NMF_ACC_XX_02_sigstats/Std","NMF_ACC_XX_02_sigstats/THD","NMF_ACC_YY_01_sigstats/ClearanceFactor","NMF_ACC_YY_01_sigstats/CrestFactor","NMF_ACC_YY_01_sigstats/ImpulseFactor","NMF_ACC_YY_01_sigstats/Kurtosis","NMF_ACC_YY_01_sigstats/Mean","NMF_ACC_YY_01_sigstats/PeakValue","NMF_ACC_YY_01_sigstats/RMS","NMF_ACC_YY_01_sigstats/SINAD","NMF_ACC_YY_01_sigstats/SNR","NMF_ACC_YY_01_sigstats/ShapeFactor","NMF_ACC_YY_01_sigstats/Skewness","NMF_ACC_YY_01_sigstats/Std","NMF_ACC_YY_01_sigstats/THD","NMF_ACC_YY_02_sigstats/ClearanceFactor","NMF_ACC_YY_02_sigstats/CrestFactor","NMF_ACC_YY_02_sigstats/ImpulseFactor","NMF_ACC_YY_02_sigstats/Kurtosis","NMF_ACC_YY_02_sigstats/Mean","NMF_ACC_YY_02_sigstats/PeakValue","NMF_ACC_YY_02_sigstats/RMS","NMF_ACC_YY_02_sigstats/SINAD","NMF_ACC_YY_02_sigstats/SNR","NMF_ACC_YY_02_sigstats/ShapeFactor","NMF_ACC_YY_02_sigstats/Skewness","NMF_ACC_YY_02_sigstats/Std","NMF_ACC_YY_02_sigstats/THD","WM1_sigstats/ClearanceFactor","WM1_sigstats/CrestFactor","WM1_sigstats/ImpulseFactor","WM1_sigstats/Kurtosis","WM1_sigstats/Mean","WM1_sigstats/PeakValue","WM1_sigstats/RMS","WM1_sigstats/SINAD","WM1_sigstats/SNR","WM1_sigstats/ShapeFactor","WM1_sigstats/Skewness","WM1_sigstats/Std","WM1_sigstats/THD","WM2_sigstats/ClearanceFactor","WM2_sigstats/CrestFactor","WM2_sigstats/ImpulseFactor","WM2_sigstats/Kurtosis","WM2_sigstats/Mean","WM2_sigstats/PeakValue","WM2_sigstats/RMS","WM2_sigstats/SINAD","WM2_sigstats/SNR","WM2_sigstats/ShapeFactor","WM2_sigstats/Skewness","WM2_sigstats/Std","WM2_sigstats/THD","WM3_sigstats/ClearanceFactor","WM3_sigstats/CrestFactor","WM3_sigstats/ImpulseFactor","WM3_sigstats/Kurtosis","WM3_sigstats/Mean","WM3_sigstats/PeakValue","WM3_sigstats/RMS","WM3_sigstats/SINAD","WM3_sigstats/SNR","WM3_sigstats/ShapeFactor","WM3_sigstats/Skewness","WM3_sigstats/Std","WM3_sigstats/THD","WM4_sigstats/ClearanceFactor","WM4_sigstats/CrestFactor","WM4_sigstats/ImpulseFactor","WM4_sigstats/Kurtosis","WM4_sigstats/Mean","WM4_sigstats/PeakValue","WM4_sigstats/RMS","WM4_sigstats/SINAD","WM4_sigstats/SNR","WM4_sigstats/ShapeFactor","WM4_sigstats/Skewness","WM4_sigstats/Std","WM4_sigstats/THD","WM5_sigstats/ClearanceFactor","WM5_sigstats/CrestFactor","WM5_sigstats/ImpulseFactor","WM5_sigstats/Kurtosis","WM5_sigstats/Mean","WM5_sigstats/PeakValue","WM5_sigstats/RMS","WM5_sigstats/SINAD","WM5_sigstats/SNR","WM5_sigstats/ShapeFactor","WM5_sigstats/Skewness","WM5_sigstats/Std","WM5_sigstats/THD"];
featureTable = readFeatureTable(outputEnsemble,'Features',selectedFeatureNames);

% Set SelectedVariables to select variables to read from the ensemble.
outputEnsemble.SelectedVariables = unique([outputEnsemble.DataVariables;outputEnsemble.ConditionVariables;outputEnsemble.IndependentVariables],'stable');

% Gather results into a table.
if nargout > 1
    outputTable = readall(outputEnsemble);
end
end
