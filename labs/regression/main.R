## Let's try to predict average hospital infection risk using length
## of stays (days).  We'll use the data set
## https://roualdes.us/data/hospital.csv

## Plot the data; be sure to get explanatory and response variables on
## the appropriate axes.

## Fit simple linear regression.

## Formally check the assumptions of simple linear regression.

## Interpret the coefficients, intercept and slope, in context.

## Calculate confidence intervals for the intercept and slope and
## interpret both in context.

## Interpret the adjusted R^2.

## Try removing the two observations who's stays are longer than 15
## days and refitting the model.  Compare models.

## Try plotting both best fit lines, one with all
## the data and this later model with the two observations where stay
## is greater than 15 removed, on the same plot -- overlaying all the
## original data.  ?geom_abline

## Calculate the likelihood estimates of the slope and intercept of
## these data.  Compare your likelihood estimates to those above.
## Hint: write a function that minimizes the sum of squared residuls,
## and then use optim.

## Bootstrap the standard errors of the estimated coefficients
## and compare to your answers above.
