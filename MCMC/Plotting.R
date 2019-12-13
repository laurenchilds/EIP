library(devtools)
library(deSolve)
library(deBInfer)

# Plot trajectories (requires pressing a key)
plot(mcmc_samples)

# Plot pairwise (can take awhile)
burnin <- 5000
pairs(mcmc_samples, burnin = burnin, scatter=FALSE, trend=FALSE)

# Plot posterior density with priors
post_prior_densplot(mcmc_samples,param = "all", burnin = burnin,prior.col = "red")

# Find 500 posterior trajectories
post_traj <- post_sim(mcmc_samples, n=500, times=0:50, burnin=burnin, output = "all", prob = 0.95)

# Find the median of parameters
tot <- length(mcmc_samples$samples[,1])
x1<-median(mcmc_samples$samples[burnin:tot,1]) #sigE
x2<-median(mcmc_samples$samples[burnin:tot,2]) #muE
x3<-median(mcmc_samples$samples[burnin:tot,3]) #f
x4<-median(mcmc_samples$samples[burnin:tot,4]) #t0
x5<-median(mcmc_samples$samples[burnin:tot,5]) #k
x6<-median(mcmc_samples$samples[burnin:tot,6]) #muO



# Plot a comparison of data and posterior fits
par(mfrow = c(2,2))
# Oocysts
plot(N_obs$time,N_obs$O,pch=16,xlab="time",ylab="oocysts",ylim=c(0,200))
parms <- c(sigE = x1, muE = x2, f = x3, t0 = x4, k = x5, sporo = 60, muO = x6)
times <- seq(0, 50, 1)
out2 <- ode(y, times, oocyst_model, parms, method="lsoda")
for(i in seq_along(post_traj$sims)) {
  DATA1 <- as.data.frame(post_traj$sims[i])
  lines(rowSums(DATA1[,3:(ncol(DATA1)-1)]) ~ DATA1[,1],col = "red")
}
lines(out2[,1],rowSums(out2[,3:(ncol(out2)-1)]),lwd=1,col="blue")
points(N_obs$time,N_obs$O,pch=16,ylim=c(0, 150))


# Sporozoite numbers
plot(N_obs$time,floor(10^N_obs$S-1),pch=16,xlab="time",ylab="sporozoites")
for(i in seq_along(post_traj$sims)) {
  DATA1 <- as.data.frame(post_traj$sims[i])
  lines(DATA1[,ncol(DATA1)] ~ DATA1[,1],col = "red")
}
points(N_obs$time,floor(10^N_obs$S-1),pch=16)
lines(out2[,1],out2[,ncol(out2)],lwd=1,col="blue")

# Sporozoite score
plot(N_obs$time,N_obs$S,pch=16,xlab="time",ylab="sporo score")
for(i in seq_along(post_traj$sims)) {
  DATA1 <- as.data.frame(post_traj$sims[i])
  lines(log10(DATA1[,ncol(DATA1)]) ~ DATA1[,1],col = "red")
}
lines(out2[,1],log10(out2[,ncol(out2)]),lwd=1,col="blue")


# Plot
par(mfrow = c(1,1))
plot(post_traj$time,post_traj$median$S,type="l",lty = 1, lwd = 1,col = "red",ylab='S',xlab='time')
lines(post_traj$time,post_traj$HDI$S[,1],lty = 1, lwd = 1,col = "gray",ylab='O')
lines(post_traj$time,post_traj$HDI$S[,2],lty = 1, lwd = 1,col = "gray",ylab='O')

