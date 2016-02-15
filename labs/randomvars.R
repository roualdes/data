## 1. Consider the following discrete random variable, X.
## x            | 6     7       8       9       10      11      12
## P(X = x)     | 0.1   0.2     0.3     0.2     0.1     0.05     0.05

## 1.a
## Calculate the expected value and variance; efficiency counts.


## 1.b
## Randomly sample from the random variable X,
## with samples sizes n = \{10, 100, 1000\}.
## Hint: ?sample

## 1.c
## Calculate the sample mean and sample variance for each random
## sample/size combination.
## Comment on the relative correctness of your three guesses.

## 2. Assume the length of adult male Calponia harrisonfordis is
## normally distributed with mean 18.14 mm and
## standard deviation 1.76 mm. Hint: ?pnorm

## 2.a
## What is the probability we would find a C. harrisonfordi that is
## shorter than 14.66 mm or longer than 21.66 mm?

## 2.b
## What is the length of the longest 7.5% of C. harrisonfordis?

## 3. Suppose that semiconductors follow a exponential distribution
## with an expected value (mean) life span of 5 years.
## Hint: how does the expected value relate to the parameter of
## the exponential distribution?  Which does pexp take as its argument?
## Try ?pexp

## 3.a
## What is the probability a randomly chosen semiconductor
## will fail within 4 years?

## What is the lifespan of the shortest 12% of semiconductors?

## 4. Randomly generate 1001 observations from a normal
## distribution of your choice (pick mean and standard deviation).
## Make a histogram from these observations. Hint: ?rnorm

## 5. Randomly generate 1001 observations from a Bernoulli
## distribution and estimate the variance using only the sample mean.
## Hint: ?rbinom, size=1 and you pick `prob`.
