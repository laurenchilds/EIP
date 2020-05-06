% Calculate Model 1 EIP from best fitting Gamma Distribution

close all


load(strcat(folder,'BestModelOutput.mat'),'BestModel1params','BestModel1')


k = BestModel1params(:,4)';
sigma_e = BestModel1params(:,1);
mu_e = BestModel1params(:,2);

X = 0:.001:42;
A = BestModel1;% shape parameter
B = 1./(k.*A);% scale parameter

% -- compute cdf and find time Tb where cdf is approx 0.5 (i.e. Tb where
% median of pdf occurs).
for i = 1:length(A)
    Ycdf(:,i) = gamcdf(X,A(i),B(i));
end
[minval,median_ix] = min(abs(Ycdf-0.5));
Tstar = X(median_ix);

EIP_BestModel1_Gam = 1./(mu_e'+sigma_e') + Tstar;

load(strcat(folder,'BestModel_sorted.mat'),'BestEIPMat2')

save(strcat(folder,'EIPSummary.mat'),'EIP_BestModel1_Gam','BestEIPMat2')