## 1. Estimate the bias of sigma hat, $\hat{\sigma}$.
## Assume X ~ N(3, 5^2).
## Hint: refer to the details in estimating
## https://roualdes.us/teaching/math314/lectures/samplingdistribution_examples_handout.pdf


## 2. Make a histogram of the R samples of bias produced from 1.
## ?ggplot2::qplot


## 3. Refer to the Binomial distribution details in
## https://roualdes.us/teaching/math314/lectures/samplingdistribution_examples_handout.pdf
## Suppose  X ~ Binomial(15, 14/15).
## 3.a Generate n=10 binomial random variables.
## ?rbinom

## 3.b Repeat 3.a R=1001 times and estimate the mean for each
## replication.

## 3.c Standardize the sample means.  Create a new vector
## of the standardized means, named stdMeans

## 3.d Construct a data frame of the R standardized means.
## Within the data frame, name your standardized means x.
## ?data.frame;

## 3.e Make a histogram of the standardized means and
## overlay the normal density.  Use the following code from
## ggplot2.
library(ggplot2)
ggplot(dataframe, aes(x)) + # substitute in your data frame for dataframe
    geom_histogram(aes(y=..density..), binwidth=1/3) +
    stat_function(fun=dnorm)
