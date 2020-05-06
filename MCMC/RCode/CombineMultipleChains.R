library(deSolve)
library(deBInfer)
library(coda)

load('EXPG_c1.RData')
chain1 <- mcmc_samples
load('EXPG_c2.RData')
chain2 <- mcmc_samples
load('EXPG_c3.RData')
chain3 <- mcmc_samples
load('EXPG_c4.RData')
chain4 <- mcmc_samples
load('EXPG_c5.RData')
chain5 <- mcmc_samples
all_chains <- coda::as.mcmc.list(list(chain1$samples,chain2$samples,chain3$samples,chain4$samples,chain5$samples))

summary(all_chains)
gelman.diag(all_chains)
HPDinterval(all_chains)
