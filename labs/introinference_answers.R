## 1. From a sample of 122 college students you find that the average number of hours slept each night is 6.83.  Assume the population standard deviation is known, $\sigma = 1.8$ hours.

## a. Set up hypotheses to test if the average number of hours slept by college students is different from 8; use a significance level of $\alpha = 0.02$.

H_0: mu = 8 versus mu != 8 @ alpha = 0.02

## b. Evaluate the above hypothesis test and state your conclusion.
xbar <- 6.83
sigma <- 1.8
n <- 122
mu0 <- 8
alpha <- 0.02
z <- (xbar - mu0)/(1.8/sqrt(n))
2*(1-pnorm(abs(z)))                     # p-value < alpha => reject H0

The data suggest that the mean number of hours slept by college students each night is not equal to 8.

## c. Calculate an appropriately matching confidence interval.
xbar + qnorm(c(alpha/2, 1-alpha/2))*sigma/sqrt(n)

## d. Interpret your confidence interval.
We are 98 percent confident that the true mean number of hoursslept by college students per night is between 6.45 and 7.21.

## e. Does your hypothesis test conclusion match the conclusion from your confidence interval?
Since the confidence does not contain the null value 8, the data suggest that the mean number of hours slept by college students each night is not equal to 8 (reject H_0).  In fact, the confidence interval tells us that the mean is likely something smaller than 8.

## f. How much do we care about the shape of the population distribution? Why?

We do not care about the population distribution, because the Central Limit Theorem tells us that the sampling distribution of the standardized, sample mean is approximately standard normal when the sample size is sufficiently large regardless of what the population distribution looks ike.

## 2.  Biologists are often interested in population dynamics of groups of animals.  Some mathematical models claim that if less than half of a population is not producing at least three offspring on average, then that group is destined to population decline.  From a sample of 110 (offspring producing) individuals from the Order Carnivora, suppose you found that 58 produced at least 3 offspring.

## a. Set up hypotheses to test if the Order Carnivora is destined to population decline; use a level of significance of $\alpha = 0.05$.

H_0: p = 0.5 versus H_1: p < 0.5 @ alaph = 0.05

## b. Evaluate the above hypothesis test and state your conclusion.
n <- 110
phat <- 58/n
sigma <- sqrt(phat*(1-phat))
se <- sigma/sqrt(n)
p0 <- 0.5
z <- (phat - p0)/se
alpha <- 0.05
pnorm(z)                                # pvalue > alpha => fail to reject H_0

The data suggest that the population proportion of successfully producing individuals of the Order Carnivora is not less than 0.5.

## c. Calculate an appropriately matching confidence interval.

phat + qnorm(c(alpha/2, 1-alpha/2))*se

## d. Interpret your confidence interval.
We are 95 percent confident that the true population proportion of successfully producing individuals within the Order Carnivora is between 0.43 and 0.62.

## e. Does your hypothesis test conclusion match the conclusion from your confidence interval?

Yes, the confidence interval matches the conclusion from the hypothesis test, both fail to reject H_0.  The confidence interval comes to the same conclusion since the null value 0.5 is contained within the contained interval.
