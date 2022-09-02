## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BSPBSS)

## ---- message=FALSE-----------------------------------------------------------
library(BSPBSS)
set.seed(612)
sim = sim_2Dimage(length = 30, sigma = 5e-4, n = 30, smooth = 6)

## -----------------------------------------------------------------------------
levelplot2D(sim$S,lim = c(-0.04,0.04), sim$coords)

## -----------------------------------------------------------------------------
levelplot2D(sim$X[1:3,], lim = c(-0.12,0.12), sim$coords)

## -----------------------------------------------------------------------------
ini = init_bspbss(sim$X, sim$coords, q = 3, ker_par = c(0.1,50), num_eigen = 50)

## ---- message = TRUE----------------------------------------------------------
res = mcmc_bspbss(ini$X,ini$init,ini$prior,ini$kernel,n.iter=2000,n.burn_in=1000,thin=10,show_step=100)

## -----------------------------------------------------------------------------
res_sum = sum_mcmc_bspbss(res, ini$X, ini$kernel, start = 101, end = 200, select_p = 0.5)

## -----------------------------------------------------------------------------
levelplot2D(res_sum$S, lim = c(-1.3,1.3), sim$coords)

## -----------------------------------------------------------------------------
levelplot2D(ini$init$ICA_S, lim = c(-1.7,1.7), sim$coords)

