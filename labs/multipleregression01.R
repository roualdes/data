## Let's try to predict beak width using middle toe length and island
## the data set https://roualdes.us/data/finches.csv

## First, ensure there is statistically different mean beak widths
## amongst the islands.  Write out the hypotheses and conclude the
## test, using alpha=0.05.

## Calculate the correlation between beak width and middle toe length.
## Based on this calculation, what do you expect the sign of the slope
## coefficient to be?

## Fit multiple linear regression using intercepts for each island and
## a shared (amongst all the islands) slope.  Write the fitted
## regression equation.

## Check the assumptions of your linear model.

## Why are only two of the three levels of island obviously displayed
## in the output?

## Interpret the coefficient estimate of floreana in the context of
## these data.

## Each coefficient is being tested with a default hypothesis test.
## Set up one such hypothesis test, using appropriate subscripts, and
## conclude the hypothesis test in statistical language.

## Interpret the slope in the context of these data.  Is this variable
## significantly different from zero?

## Interpret the adjusted $R^2$ value in the context of these data.

## Why is the $R^2$ value larger than the adjusted $R^2$?

## Predict average beak width for the island San Cristobal when middle
## toe length is equal to 20.
## First try using the function
## ?coefficients, ?model.matrix, and predict_y
## and then try, noting the interval option
## ?predict.lm # the examples within should help

## Calculate confidence intervals for average beak width for the island
## Floreana when middle toe length is equal to 20. Use predict.lm().

## Calculate the residuals for the third observation of your original
## data.  Does your answer match the third element of the residuals?

## Did you over/under predict the third residual?
