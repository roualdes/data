## 1. Consider the following discrete random variable, X.
## x            | 6     7       8       9       10      11      12
## P(X = x)     | 0.1   0.2     0.3     0.2     0.1     0.05     0.05

## 1.a Calculate the expected value and variance; efficiency counts.
## Hint: we claim to know the random variable (the population
## parameters) so the functions mean() and sd() are inappropriate here.

## 1.b
## Randomly sample from the random variable X,
## with samples sizes n = \{10, 100, 1000\}.
## Hint: ?sample

## 1.c
## Calculate the sample mean and sample standard deviation for each
## random *sample*/size combination.  Here we're randomly sampling
## from the population, so as to make believe that we don't know the
## population; this means that the functions mean() and sd() are
## appropriate here.

## 1.d
## Comment on the relative correctness of your three estimates;
## compare your estimates to known population parameters.


## 2. Assume the length of adult male Calponia harrisonfordis is
## normally distributed with mean 18.14 mm and
## standard deviation 1.76 mm.
## Hint: ?pnorm

## 2.a
## What is the probability we would find a C. harrisonfordi that is
## shorter than 14.66 mm or longer than 21.66 mm?

## 2.b
## What is the length of the longest 7.5% of C. harrisonfordis?

## 3. Sophia who took the Graduate Record Examination (GRE) scored 160
## on the Verbal Reasoning section and 157 on the Quantitative
## Reasoning section. The mean score for Verbal Reasoning section for
## all test takers was 151 with a standard deviation of 7, and the
## mean score for the Quantitative Reasoning was 153 with a standard
## deviation of 7.67. Suppose that both distributions are nearly
## normal.

## 3.a Write down the short-hand for these two normal distributions.

## 3.b What is Sophia’s Z-score on the Verbal Reasoning section? On the Quantitative Reasoning section?

## 3.c What do these Z-scores tell you?

## 3.d Relative to others, which section did she do better on?

## 3.e Find her percentile scores for the two exams.

## 3.f What percent of the test takers did better than her on the Verbal Reasoning section? On the Quantitative Reasoning section?

## 3.g Explain why simply comparing raw scores from the two sections could lead to an incorrect conclusion as to which section a student did better on.

## 3.h If the distributions of the scores on these exams are not nearly normal, would your answers to parts (b) - (f) change? Explain your reasoning.

## 4. Randomly generate 1001 observations from a normal distribution
## of your choice (pick mean and standard deviation -- this is
## essentially pretending that you know the population parameters).
## Hint: ?rnorm

## 4.a Make a histogram from these observations.

## 4.b Estimate the population mean and standard deviation as if the
## numbers you generated in 4. were a sample.  How close are your estimates?

## 4.c What would make your estimates more accurate?  Demonstrate your answer.
