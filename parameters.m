% Function creates structure of parameter values. 
function param = parameters

param.sigma_e = .14; % transformation rate of ookinetes (per day)
param.mu_e = 1.85; % death rate of ookinetes (per day)
param.mu_o = 0.045; % death rate of oocysts (per day) **changed from paper**
param.n = 60; % number of sporozoites per oocyst
param.p = 1; % proportion of sporozoites that make it to salivary gland
param.k = .057; % maximal bursting rate
param.f = .045; % proportion of formed oocysts becoming rupturing oocysts
param.t0 = 10; % time at which oocysts are at half maximal bursting rate

