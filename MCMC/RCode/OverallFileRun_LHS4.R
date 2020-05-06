library(devtools)
library(deSolve)
library(deBInfer)

######################### LHS 4 #########################

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_AD_TimeDep.R')
save.image('EXPAD_c4.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_BE_TimeDep.R')
save.image('EXPBE_c4.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_CF_TimeDep.R')
save.image('EXPCF_c4.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_G_TimeDep.R')
save.image('EXPG_c4.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_H_TimeDep.R')
save.image('EXPH_c4.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 0.9409,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 1.1244,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.8440, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 5.1283, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 26.7319, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.1510, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_I_TimeDep.R')
save.image('EXPI_c4.RData')
rm(list=ls())
dev.off()