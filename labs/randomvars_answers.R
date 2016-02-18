## 1. Consider the following discrete random variable, X.
## x            | 6     7       8       9       10      11      12      
## P(X = x)     | 0.1   0.2     0.3     0.2     0.1     0.05     0.05

## 1.a
## Calculate the expected value and variance; efficiency counts.

x <- 6:12
p <- c(1, 2, 3, 2, 1, 0.5, 0.5)/10

## reasonable + not fast = not correct
m <- 0
idx <- seq_along(x) # 1:length(x)
for (i in idx) {
    m <- m + x[i]*p[i]
}

v <- 0
for (i in idx) {
    v <- v + p[i]*(x[i]-m)^2
}

## not intuitive + fast + right answer = Max Power way! (correct)
m <- sum(p*x)
v <- sum(p*(x-m)^2)

## 1.b
## Randomly sample from the random variable X,
## with samples sizes n = \{10, 100, 1000\}.
## Hint: ?sample



## 1.c
## Calculate the sample mean and sample variance for each random
## sample/size combination. 
## Comment on the relative correctness of your three guesses.

for (n in c(10, 100, 1000)) {
    s <- sample(x, size=n, replace=TRUE, prob=p)
    print(sprintf("sample mean = %f", mean(s)))
    print(sprintf("sample variance = %f", var(s)))
    ## sample estimates should approach population parameters
    ## as sample sizes increase
}

## 2. Assume the length of adult male Calponia harrisonfordis is
## normally distributed with mean 18.14 mm and
## standard deviation 1.76 mm. Hint: ?pnorm

## 2.a
## What is the probability we would find a C. harrisonfordi that is
## shorter than 14.66 mm or longer than 21.66 mm?
## via z-scores
z1 <- (14.66 - 18.14)/1.76
z2 <- (21.66 - 18.14)/1.76
pnorm(z1) + (1-pnorm(z2))

## w/out z-scores
pnorm(14.66, mean=18.14, sd=1.76) + (1-pnorm(21.66, mean=18.14, sd=1.76))

## 2.b
## What is the length of the longest 7.5% of C. harrisonfordis?
## via z-scores
qnorm(1-0.075)*1.76 + 18.14

## w/out z-scores
qnorm(1-0.075, mean=18.14, sd=1.76)

## 3. Suppose that semiconductors follow a exponential distribution
## with an expected value (mean) life span of 5 years.
## Hint: how does the expected value relate to the parameter of
## the exponential distribution?  Which does pexp take as its argument?
## Try ?pexp

## 3.a
## What is the probability a randomly chosen semiconductor
## will fail within 4 years?

pexp(4, rate=1/5)

## 3.b
## What is the lifespan of the shortest 12% of semiconductors?

qexp(0.12, rate=1/5)

## 4. Randomly generate 1001 observations from a normal
## distribution of your choice (pick mean and standard deviation).
## Make a histogram from these observations. Hint: ?rnorm

rn <- rnorm(1001, mean=pi, sd=0.5)
library(ggplot2)
qplot(rn, geom="histogram", binwidth=0.5/3)

## 5. Randomly generate 1001 observations from a Bernoulli
## distribution and estimate the variance using only the sample mean.
## Hint: ?rbinom, size=1 and you pick `prob`.

rb <- rbinom(1001, size=1, prob=pi/4)
mb <- mean(rb)                          # sample mean
vb <- mb*(1-mb)                         # sample var

pi/4                                    # population mean
(pi/4)*(1-pi/4)                         # population variance

