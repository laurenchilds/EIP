Summary of Code, Generated Data, and Plots associated with
‘The impact of within-vector parasite development on the extrinsic incubation period’
by Lauren M. Childs and Olivia F. Prosper


Extracted Data:

Individual data file descriptions: 
	These files include the extracted data from Dawes (2011). They are found in the directory ‘Data’ and also found in ‘Multistart/Data/Oocyst/’ and ‘Multistart/Data/Sporo/’ for oocyst data and sporozoite data, respectively. 

Oocyst[X].csv where X is A,B,C,G,H,I
	First column is time in days and second column is oocyst count.
Oocyst[X]mod.mat where X is D,E,F
	First column is time in days and second column is oocyst count.
Sporo[X].csv where X is A,B,C,G,H,I
	First column is time in days and second column is sporozoite score.
Sporo[X]mod.mat where X is D,E,F
	First column is time in days and second column is sporozoite score.

Multistart (Matlab):

Loads experimental data and runs fitting via multistart to Model 1 and Model 2 in Matlab.

Experimental Data found in ‘Multistart/Data/’
Generated OutputData found in ‘Multistart/OutputData/Generated/’

Output generated from ‘Multistart/RunParameterSearch.m’
	Requires: 	ParameterSearch.m, parameters.m, objfun.m, 
Plots and summary data files generated from ‘Multistart/RunEIPCombined.m’
	Requires:	PlotDawesData.m, PlotFittingResults.m, ComputeAICc_multiple.m, 				EIP_plots.m, FindBestModel1.m, CompareModel1ParamsAcrossN.m, 				EIPgamdistCalc.m, ParasiteModel.m, OocystA.csv, OocystB.csv, 					OocystC.csv, OocystDmod.mat, OocystEmod.mat, OocystFmod.mat, 				OocystG.csv, OocystH.csv, OocystI.csv, SporoA.csv, SporoB.csv, 					SporoC.csv, SporoDmod.mat, SporoEmod.mat, SporoFmod.mat, 					SporoG.csv, SporoH.csv, SporoI.csv

Individual data file descriptions: 
	These files include the extracted data from Dawes (2011). They are found in the directory ‘Multistart/Data/Oocyst/’ and ‘Multistart/Data/Sporo/’ for oocyst data and sporozoite data, respectively. 

Oocyst[X].csv where X is A,B,C,G,H,I
	First column is time in days and second column is oocyst count.
Oocyst[X]mod.mat where X is D,E,F
	First column is time in days and second column is oocyst count.
Sporo[X].csv where X is A,B,C,G,H,I
	First column is time in days and second column is sporozoite score.
Sporo[X]mod.mat where X is D,E,F
	First column is time in days and second column is sporozoite score.

MCMC (R and Matlab):

Runs fitting to experimental data for Model 2 via MCMC using the debInfer package in R. 

Output generated found in ‘MCMC/GeneratedChains/’
Figures of correlations from generated output found in ‘MCMC/CorrelationFigures/’

Output generated from ‘MCMC/RCode/OverallFileRun_LHS[X].R’ where [X] is 1,2,3,4,5.
	Requires: 	Oocyst_AD_TimeDep.R, Oocyst_BE_TimeDep.R, Oocyst_CF_TimeDep.R, 				Oocyst_G_TimeDep.R, Oocyst_H_TimeDep.R, Oocyst_I_TimeDep.R
Data processing in R: 	CombineMultipleChains.R, SaveDatatoMatlab.R
	Saves generated data to .mat files
Violin plots generated from: ‘MCMC/MatlabCode/EIPViolin.m’
	Requires:	violin.m
Other plots generated from: ‘MCMC/MatlabCode/PlotFits.m’


Sensitivity (Matlab):

Runs sensitivity analysis via eFAST for Model 1 and Model 2.

Generated Data for Model [X] in ‘Sensitivity/Model[X]/’ 
Note that [X] refers to 1 or 2.

Output generated from ‘Sensitivity/Model[X]/Model_efast.m’
	Requires:	ODE_efast.m, Parameter_settings_EFAST_Modified.m, efast_sd.m, 				efast_ttest.m, parameterdist.m, SETFREQ.m, CVmethod.m
Plots generated from ‘Sensitivity/Model[X]/PlotSensitivity.m’
	Requires: 	brewermap.m, brewermap_view.m

References

Emma J Dawes (2011). “The population dynamics of Plasmodium within the mosquito.” PhD thesis, Imperial College London, doi.org/10.25560/6869.

Brewermap code:
	Stephen Cobeldick (2020). ColorBrewer: Attractive and Distinctive 	Colormaps (https://www.github.com/DrosteEffect/BrewerMap), GitHub.  Retrieved 	from Mathworks file exchange.

eFAST code:
	Kirschner Lab (Accessed 2020). Uncertainty and Senstitivity Analysis 	(http://malthus.micro.med.umich.edu/lab/usadata/#sdfootnote1anc)

Violin plot code:
	Holger Hoffmann (2020). Violin Plot (https://www.mathworks.com/matlabcentral/fileexchange/45134-violin-plot), MATLAB Central File Exchange. 


