library("R.matlab")
library(devtools)
library(deSolve)
library(deBInfer)

load('EXPG_c1.RData')
filename <- 'ExpG_c1.mat'

burnin <- 5000
post_traj <- post_sim(mcmc_samples, n=500, times=0:50, burnin=burnin, output = "all", prob = 0.95)
error <- as.matrix(mcmc_samples$lpost)
output <- as.matrix(mcmc_samples$samples)
S_HDI <- as.matrix(post_traj$HDI$S)
S_med <- as.matrix(post_traj$median$S)
O_HDI <- as.matrix(post_traj$HDI$Oend)
O_med <- as.matrix(post_traj$median$Oend)
Od_HDI <- as.matrix(post_traj$HDI$Od)
Od_med <- as.matrix(post_traj$median$Od)
writeMat(filename,error=error,param=output, S_HDI=S_HDI, S_med = S_med, O_HDI=O_HDI, O_med = O_med, Od_HDI=Od_HDI, Od_med = Od_med)
remove (list=ls())
