## Let's try to predict average hospital infection risk using length
## of stays (days).  We'll use the data set
## https://roualdes.us/data/hospital.csv

hospital <- read.csv("https://roualdes.us/data/hospital.csv")

library(ggplot2)
library(dplyr)

## Plot the data; be sure to get explanatory and response variables on
## the appropriate axes.

qplot(stay, infection_risk, data=hospital) + stat_smooth(method="lm")

## Fit simple linear regression.

fit <- lm(infection_risk~stay, data=hospital)
summary(fit)

## Check the assumptions of simple linear regression.

r <- rstandard(fit)
yhat <- fitted(fit)

linearity <- qplot(yhat, r)
## Linearity looks reasonable, but the two patients who's stay was
## longer than 15 days seem highly suspect and might hint at
## non-linearity of the response on the explanatory variable,
## specifically far outside the domain of the majority of the sampled
## data.

## Constant variation also only looks reasonable at best.  Again it's
## these two patients with stays longer than 15 days, are they hinting
## at non-linearity or decreased variation as the stay increases.
## Both explanations seem like they could be justifiable.

normality <- qplot(r, geom="histogram", binwidth=2/3)

## The normality assumption doesn't apepar to violated; no large skew
## in residuals.

## Interpret the coefficients, intercept and slope, in context.

## When a patients stay is 0 days long, we expect the average
## infection risk to be 0.74.  For every extra day a patient stays in
## a hospital, we expect their average infection risk to go up by 0.37

## Calculate confidence intervals for the intercept and slope and
## interpret both in context.

confint(fit)

## We are 95% confident that the average infection risk when a patient
## stays 0 days in a hospital is between -0.35 and 1.84, ie is not
## statistically different from 0 -- as one would expect/hope.

## We are 95% confident that the average increase in infection risk
## for every extra day a patient stays in a hospital is between 0.26
## and 0.49.

## Interpret the adjusted R^2.

## 28% of the variation in infection risk is explained by this linear
## model on the number of days a patient stays in a hospital.

## Try removing the two observations who's stays are longer than 15
## days and refitting the model.  Compare models.

qplot(stay, infection_risk, data=filter(hospital, stay < 15)) +
    stat_smooth(method="lm")

fitt <- lm(infection_risk~stay, data=filter(hospital, stay<15))
summary(fitt)

## Notice that without these two observations, the best fit line is
## steeper.  We should expect this as the two observations would pull
## the "best" fit line towards them in an attempt to minize the sum of
## squared residuals.

## Try plotting both best fit lines, one with all the data and this
## later model with the two observations where stay is greater than 15
## removed, on the same plot -- overlaying all the original data.
## ?geom_abline

beta <- coef(fit)
betta <- coef(fitt)

qplot(stay, infection_risk, data=hospital) +
    geom_abline(slope=beta[2], intercept=beta[1], colour="red") +
    geom_abline(slope=betta[2], intercept=betta[1])

## Calculate the likelihood estimates of the slope and intercept of
## these data.  Compare your likelihood estimates to those above.
## Hint: write a function that minimizes the sum of squared residuls,
## and then use optim.

l <- function(beta, x, y) {
    sum((y-beta[1]-beta[2]*x)^2)
}

optim(c(1,2), l, method="BFGS",
      x=hospital$stay,
      y=hospital$infection_risk)$par


## Bootstrap the standard errors of the estimated coefficients
## and compare to your answers above.
library(boot)
breg <- function(d, i, yhat, x) {
    ystar <- yhat + d[i] # yhat + randomly sampled errors
    fit <- lm(ystar ~ x)
    coef(fit)
}

b <- boot(residuals(fit), breg, R=2000, yhat=yhat, x=hospital$stay)
apply(b$t, 2, sd)

boot.ci(b, type="bca", index=1)
boot.ci(b, type="bca", index=2)
