library(devtools)
library(deSolve)
library(deBInfer)


#############################
oocyst_model <- function (time, y, parms) {
  with(as.list(c(y, parms)), {
    dE <- - sigE*E - muE*E
    dOend <- f*sigE*E - k/(1+exp(t0-time))*Oend
    dOd <- (1-f)*sigE*E - muO*Od
    dS <- sporo*k/(1+exp(t0-time))*Oend
    list(c(dE,dOend,dOd,dS))
  })
}


##############################
y <- c(E = 4000, Oend = 0, Od = 0, S = 0)
parms <- c(sigE = 0.8, muE = 0.5, f = 0.5, t0 = 10, k = 0.0735, sporo = 60, muO = 0.5)
times <- seq(0, 50, 1)
out <- ode(y, times, oocyst_model, parms, method="lsoda")


#############################
# EXPERIMENT C/F
# This data is from Experiment 1/2 with 2000 ookineetes/uL (4000 total)

# THIS IS EXPERIMENT C
timeA <-c(0,1,2,3,4,5,6,8,10,12,14,16,18,20,22,24,26,28,NA)
OA <- c(0,201,232,258,267,214,311,299,267,228,185,149,91,124,114,78,64,64,NA)
SA <- c(0,0,0,0,0,0,0,0,0,0,1.3,2,2.2,2.6,3.7,2.7,2.4,2.4,NA)
timeSA <-c(14,16,18,20,22,24,26,28,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA,NA)

# THIS IS EXPERIMENT F
timeD <- c(0,1,2,3,4,5,6,8,10,12,14,16,18,20,22,24,26,28,30)
OD <- c(0,223,201,251,240,192,276,189,139,166,66,97,73,55,73,70,64,32,22)
SD <- c(0,0,0,0,0,0,0,0,0,0.1,0.2,0.3,0.5,1.9,1.9,2.1,2.1,1.5,1.4)
timeSD <- c(10,12,14,16,18,20,22,24,26,28,30,NA,NA,NA,NA,NA,NA,NA,NA)

time <- c(0,1,2,3,4,5,6,8,10,12,14,16,18,20,22,24,26,28,30)
N_obs <- data.frame(time,timeA,OA,SA,timeSA,timeD,OD,SD,timeSD)


#############################
#Plot true and noisy observations
plot(N_obs$timeA, N_obs$OA, ylim=c(0, max(N_obs$OD)))
points(N_obs$timeD, N_obs$OD)
lines(out[,1],(rowSums(out[,3:(ncol(out)-1)])))


#############################
# the observation model
oocyst_obs_model <- function(data, sim.data, samp) {
  ec <- 0.01
  idA <- which(data$timeA==data$timeSA[1])
  idD <- which(data$timeD==data$timeSD[1])
  idendA <- (length(data$timeA)-length(which(is.na(data$timeA))))
  idendD <- (length(data$timeD)-length(which(is.na(data$timeD))))
  modeldataOA <- rowSums(sim.data[1:idendA,3:(ncol(sim.data)-1)])
  modeldataOD <- rowSums(sim.data[1:idendD,3:(ncol(sim.data)-1)])
  modeldataSA <- sim.data[idA:idendA,ncol(sim.data)]#max(0,log10(min(sim.data[,ncol(sim.data)],10^5)))
  modeldataSD <- sim.data[idD:idendD,ncol(sim.data)]
  SdataA <- round(10^data$SA[idA:idendA]-1)
  SdataD <- round(10^data$SD[idD:idendD]-1)
  llik1A <- sum(dpois(data$OA[1:idendA],lambda=(modeldataOA + ec),log=TRUE))
  llik1D <- sum(dpois(data$OD[1:idendD],lambda=(modeldataOD + ec),log=TRUE))
  llik2A <- sum(dpois(SdataA,lambda=(modeldataSA + ec),log=TRUE))
  llik2D <- sum(dpois(SdataD,lambda=(modeldataSD + ec),log=TRUE))
  llik <- llik1A + llik1D + llik2A + llik2D
  return(llik)
}


#############################
E <- debinfer_par(name = "E", var.type = "init", fixed = TRUE, value = 4000)
Oend <- debinfer_par(name = "Oend", var.type = "init", fixed = TRUE, value = 0)
Od <- debinfer_par(name = "Od", var.type = "init", fixed = TRUE, value = 0)
S <- debinfer_par(name = "S", var.type = "init", fixed = TRUE, value = 0)

mcmc.pars <- setup_debinfer(sigE,muE,f,t0,k,sporo,muO,E,Oend,Od,S)



#############################
# do inference with deBInfer
# MCMC iterations
iter <- 200000

# inference call
start_time <- Sys.time()
mcmc_samples <- de_mcmc(N = iter, data = N_obs, de.model = oocyst_model,
                        obs.model = oocyst_obs_model, all.params = mcmc.pars,
                        Tmax = max(N_obs$time), data.times = N_obs$time, cnt = 100,
                        plot = FALSE, verbose.mcmc = FALSE, solver = "ode")
end_time <- Sys.time()
runtime <- end_time-start_time

