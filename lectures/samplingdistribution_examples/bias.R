## not vectorized; we could do better
bunif <- function(n) {
    ## Calculate point estimate of bias from uniform distribution
    ## X ~ U(1, 6) => E(X) = 3.5
    ##
    ## Args:
    ##   n (integer): sampe size
    ## 
    ## Returns:
    ##   difference between a randomly sampled mean and the population mean
    mean(runif(n, min=1, max=6)) - 3.5
}

bias.sampler <- function(rbias, n, R) {
    ## Generate R point estimates of bias

    ## Args
    ##  rbias (function(n)): randomly generates point estimate
    ##    of bias based on sample of size n from known population distribution.
    ##  n (integer): sample size for each point estimate.
    ##  R (integer): number of point estimate to generate.
    ##
    ## Returns:
    ##  length R vector point estimates of bias from known population 

    biases <- rep(NA, R)
    for (r in seq_len(R)) {
        biases[r] <- rbias(n)
    }
    return(biases)
}


R <- 1001
n <- 100
library(ggplot2)
qplot(bias.sampler(bunif, n, R), geom="histogram")

## vectorized version
X <- matrix(runif(n*R, min=1, max=6), ncol=R)
xbars <- colMeans(X) - 3.5
qplot(xbars, geom="histogram")

