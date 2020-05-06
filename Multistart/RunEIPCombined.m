clear
clc

folder = 'OutputData/Generated/';
%%
PlotDawesData

% Loads: Dawes oocyst and sporozoite Data from 'Data' folder.
% Saves: ExperimentalData_Sorted_by_E0.mat

%%
PlotFittingResults

% Loads: ExperimentalData_Sorted_by_E0.mat
% Saves: SummaryParameterEstimates_sorted.mat

 
%%
ComputeAICc_multiple

% Loads: All the data
% Saves: SummaryAICc_sorted.mat

%%
EIP_plots

% Loads: SummaryParameterEstimates_sorted.mat, SummaryAICc_sorted.mat
% Saves: BestModel_sorted.mat

%%
FindBestModel1

% Loads: SummaryParameterEstimates_sorted.mat, SummaryAICc_sorted.mat
% Saves: BestModelOutput.mat


%% 
CompareModel1ParamsAcrossN

% Loads: SummaryParameterEstimates_sorted.mat

%%
EIPgamdistCalc

% Loads: BestModelOutput.mat
% Saves: EIPSummary.mat
