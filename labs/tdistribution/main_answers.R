## Researchers interested in lead exposure due to car exhaust sampled
## the blood of 52 police officers subjected to constant inhalation of
## automobile exhaust fumes while working traffic enforcement in a
## primarily urban environment.  The blood samples of these officers
## had an mean lead concentration of 124.32 μg/l and a standard
## deviation of 37.74 μg/l; a previous study of individuals from a
## nearby suburb, with no history of exposure, found an average blood
## level concentration of 135 μg/l.  Use alpha = 0.05.


## 1.  Write down (type) the hypotheses that would be appropriate for
## testing if the police officers appear to have been exposed to a
## different concentration of lead.

# H_0: mu = 135 versus H_1: mu != 135


## 2. Test the hypothesis that the downtown police officers have a
## different lead exposure than the group in the previous study.
## Interpret your results in context.

t <- (124.32-135)/(37.74/sqrt(52)) # test statistic
2*(1-pt(abs(t), 51)) # p-value < 0.05

## Reject H_0.  There is insufficient evidence to claim that the mean
## level of lead concentration in the blood of officers exposed to car
## exhaust is equal to 135.

## 3. Calculate and interpret a 95% confidence interval for the mean
## lead concentration in the blood of police officers subjected to
## constant inhalation of automobile exhaust fumes.

124.32 + qt(c(0.025, 0.975), 51)*(37.74/sqrt(52)) ## 95% CI

## We are 95% confident that the true population mean level of lead
## concentration in the blood of police officers exposed to car
## exhaust is between 113.81 and 134.83.

## 4. Based on your preceding result, without performing a
## calculation, would a 90% confidence interval for the average blood
## concentration level of police officers contain 135 μg/l?

## The 90% confidence interval will not include 135 as the new
## confidence interval is narrower than the perivious, and the
## previous CI did not include 135.

## 5. Based on your preceding result, now doing the calculations, does
## a 90% confidence interval for the mean blood concentration level of
## police officers contain 135 μg/l?  Interpret this confidence
## interval in the specified context.

124.32 + qt(c(0.05, 0.95), 51)*(37.74/sqrt(52)) ## 90% CI

## 6. Pretend the sample size increased, but the confidence is still
## 90% and all else stays the same, how will the confidence interval
## change?  Explain in words and then justify your claim with R code.

## The confidence interval will be narrower because the standard error
## will be smaller.

124.32 + qt(c(0.05, 0.95), 51)*(37.74/sqrt(152)) ## 90% CI, with bigger sample size


## 7. Check out the dataset mtcars.
?mtcars


## 8. Using the dataset mtcars, calculate a 99% confidence interval for a numerical variable of your choice grouped by a categorical variable of your choice.

library(dplyr)
## Any discrete numerical variable can be treated as a categorical variable, I'll choose transmission type
mtcars %>%
    group_by(am) %>%
    summarise(mean_mpg = mean(mpg),
              n = n(),
              se_mpg = sd(mpg)/sqrt(n),
              mpg_lb = mean_mpg - qt(0.995, n-1)*se_mpg,
              mpg_ub = mean_mpg + qt(0.995, n-1)*se_mpg)


## 9. Interpret your confidence interval.

We are 99% confident that the true mean miles per gallon of automatic transmission cars is between 14.62 and 19.68.

We are 99% confident that the tru mean miles per gallong of manual transmission cars is between 19.17 and 29.62.


## 10.  Identify the conditions under which your confidence interval will match a hypothesis test.

Alternative hypothesis is not equals to and the level of significance, in this case, will be 1 - .99 = 0.01.


## 11. Name one value for which an appropriate hypothesis test would agree with your confidence interval and one value for which an appropriate hypothesis test would disagree with your confidence interval, e.g. name two values that would be specified in the null hypothesis.

Automatic
reject H0: 13
fail to reject H0: 15

Manual
reject H0: 15
fail to reject H0: 25
