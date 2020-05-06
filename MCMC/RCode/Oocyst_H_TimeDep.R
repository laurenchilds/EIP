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
y <- c(E = 500, Oend = 0, Od = 0, S = 0)
parms <- c(sigE = 0.8, muE = 0.5, f = 0.5, t0 = 10, k = 0.0735, sporo = 60, muO = 0.5)
times <- seq(0, 50, 1)
out <- ode(y, times, oocyst_model, parms, method="lsoda")


#############################
# EXPERIMENT H
# This data is from Experiment 3 with 250 ookineetes/uL (500 total) 
time <-c(0,1,2,3,4,5,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42)
O <- c(0,36,80,67,63,61,54,49,66,35,41,31,40,44,25,28,23,18,16,19,18,16,18,14,13)
S <- c(0,0,0,0,0,0,0,0,0,0,0.3,1.7,2.2,2.7,1.7,2.6,2.6,2,2.2,2.4,2.2,2.1,1.9,2.3,2.1)
timeS <- c(10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,NA,NA,NA,NA,NA,NA,NA,NA)
N_obs <- data.frame(time,O,S,timeS)

#############################
#Plot true observations
plot(N_obs$time, N_obs$O, ylim=c(0, max(N_obs$O)))
lines(out[,1],(rowSums(out[,3:(ncol(out)-1)])))


#############################
# the observation model
oocyst_obs_model <- function(data, sim.data, samp) {
  ec <- 0.01
  id <- which(data$time==data$timeS[1])
  idend <- length(data$time)
  modeldataO <- rowSums(sim.data[,3:(ncol(sim.data)-1)])
  modeldataS <- sim.data[id:idend,ncol(sim.data)]#max(0,log10(min(sim.data[,ncol(sim.data)],10^5)))
  Sdata <- round(10^data$S[id:idend]-1)
  llik1 <- sum(dpois(data$O,lambda=(modeldataO + ec),log=TRUE))
  llik2 <- sum(dpois(Sdata,lambda=(modeldataS + ec),log=TRUE))
  llik <- llik1 + llik2
  return(llik)
}


#############################
E <- debinfer_par(name = "E", var.type = "init", fixed = TRUE, value = 500)
Oend <- debinfer_par(name = "Oend", var.type = "init", fixed = TRUE, value = 0)
Od <- debinfer_par(name = "Od", var.type = "init", fixed = TRUE, value = 0)
S <- debinfer_par(name = "S", var.type = "init", fixed = TRUE, value = 0)

mcmc.pars <- setup_debinfer(sigE,muE,f,t0,k,sporo,muO,E,Oend,Od,S)



#############################
# do inference with deBInfer
# MCMC iterations
iter <- 100000

# inference call
start_time <- Sys.time()
mcmc_samples <- de_mcmc(N = iter, data = N_obs, de.model = oocyst_model,
                        obs.model = oocyst_obs_model, all.params = mcmc.pars,
                        Tmax = max(N_obs$time), data.times = N_obs$time, cnt = 100,
                        plot = FALSE, verbose.mcmc = FALSE, solver = "ode")
end_time <- Sys.time()
runtime <- end_time-start_time

