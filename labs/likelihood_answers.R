## 1. Randomly generate a reasonable number of observations from the gamma distribution.
## You must pick two parameters: shape and rate.
## ?rgamma

xs <- rgamma(10001, shape=2, rate=3)

## 2. Make a histogram of your randomly generated gamma variables.
## Describe the shape of the histogram using keywords from this class.
## ?qplot
library(ggplot2)
qplot(xs, geom="histogram", binwidth=.2)

## fancier to see how sample matches (population) probability density function
ggplot(data.frame(x=xs), aes(x)) +
    geom_histogram(aes(y=..density..), binwidth=.2) +
    stat_function(fun=function(x) {
        dgamma(x, shape=2, rate=3)
    })

## 3. Write the likelihood function that we will maximize.
## l(theta|x_1, ..., x_n)

l <- function(theta, x) {
    -sum(dgamma(x, shape=theta[1], rate=theta[2], log=TRUE))
}

## 4. Maximize your function above using R's optimizer funciton optim.
## ?optim
## The method "L-BFGS-B" is one of the more recent and more stable algorithms.
optim(c(1, 2), # need two (plausible) initial values for parameters
      l, method="L-BFGS-B",
      lower=c(1e-5, 1e-5), # avoid boundary at theta = c(0, 0)
      x=xs)$par

## try some other values
optim(rexp(2), l, method="L-BFGS-B", lower=c(1e-5, 1e-5),
      x=rgamma(100, shape=pi, rate=0.1))$par

## vary the sample size
n <- 10
optim(rexp(2), l, method="L-BFGS-B", lower=c(1e-5, 1e-5),
      x=rgamma(n, shape=pi, rate=0.1))$par
