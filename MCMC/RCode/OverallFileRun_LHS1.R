library(devtools)
library(deSolve)
library(deBInfer)

######################### LHS 1 #########################

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_AD_TimeDep.R')
save.image('EXPAD_c1.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_BE_TimeDep.R')
save.image('EXPBE_c1.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_CF_TimeDep.R')
save.image('EXPCF_c1.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_G_TimeDep.R')
save.image('EXPG_c1.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_H_TimeDep.R')
save.image('EXPH_c1.RData')
rm(list=ls())
dev.off()

sigE <- debinfer_par(name = "sigE", var.type = "de", fixed = FALSE, value = 1.9324,
                     prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
muE <- debinfer_par(name = "muE", var.type = "de", fixed = FALSE, value = 0.1812,
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")
f <- debinfer_par(name = "f", var.type = "de", fixed = FALSE,value = 0.3633, 
                  prior = "unif", hypers = c(0,1),prop.var = c(3,4), samp.type = "rw-unif")
k <- debinfer_par(name = "k", var.type = "de", fixed = FALSE,value = 6.1412, 
                  prior = "unif", hypers = c(0,10), prop.var = c(3,4), samp.type = "rw-unif")
t0 <- debinfer_par(name = "t0", var.type = "de", fixed = FALSE, value = 39.4267, 
                   prior = "unif", hypers = c(0,42), prop.var = c(3,4), samp.type = "rw-unif")
sporo <- debinfer_par(name = "sporo", var.type = "de", fixed = TRUE, value = 60)
muO <- debinfer_par(name = "muO", var.type = "de", fixed = FALSE, value = 0.8244, 
                    prior = "unif", hypers = c(0,2), prop.var = c(3,4), samp.type = "rw-unif")

source('~/Oocyst_I_TimeDep.R')
save.image('EXPI_c1.RData')
rm(list=ls())
dev.off()
