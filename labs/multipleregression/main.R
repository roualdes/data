## Let's try to predict average hospital infection risk using any of
## the other variables as explanatory variables, including region as a
## categorical explanatory variable.
## We'll use the data set
## https://roualdes.us/data/hospital.csv

## Plot the data; be sure to get the explanatory variables and the
## response variable on the appropriate axes.

## Fit multiple linear regression, where there is at least two
## numerical and one categorical explanatory variable.

## If you didn't above, try adding an interaction term between a
## numerical explanatory variable and the categorical, explanatory
## variable named region.

## Formally check the assumptions of multiple linear regression.

## Interpret a coefficients for an intercept coefficient.

## Interpret a coefficient for a slope coefficient that generalizes all regions.

## Interpret a coefficients for a slope coefficient for a specific region..

## Calculate confidence intervals for the coefficients and interpret one confidence interval (for a coefficient different than any of the interpretations above).

## Interpret the adjusted R^2.

## Try removing the observation with the largest residual and refit
## the model.  Discuss how/if the model changed.

## Predict infection_risk for each region, when the numerical
## explanatory variables are equal to their respective means.

## Calculate the likelihood estimates for the coefficients in your
## model.  Compare your likelihood estimates to those above.  Hint:
## write a function that minimizes the sum of squared residuls, and
## then use optim.

## Bootstrap the standard errors of the estimated coefficients
## and compare to your answers to the standard errors ouptput above.
