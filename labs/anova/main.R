## Consider some national hospital data:
## https://roualdes.us/data/hospital.csv.  Hospitals, as clean as they
## are, are notorious places to acquire infections.  We'll consider
## the variable infection_risk across four different regions of the
## U.S. for randomly selected hospitals.

## Make an apprioriate plot to investigate the mean of infection_risk by region.

## State the three assumptions of ANOVA.  Comment on the validity of
## each of the assumptions.

## Set up appropriate hypothesis for ANVOA, to test the mean of
## infection_risk by region.  Pick a level of significance.

## Evaluate your hypothesis and conclude in context.

## Which of the mean(s) appear different than the rest?  Be sure to
## use the Bonferroni correction.

## Try a different experiment-wise error correction, Tukey's
## Honest Significant Difference.
## ?TukeyHSD
## If you named your ANOVA linear model as such
## fit <- lm(...)
## then call
## TukeyHSD(aov(fit), conf.level=...)

## Calculate the group means to ensure you know how the ANOVA model
## works.  Use the function coefficients and compute them yourself.
## Make sure the two strategies agree.
## ?coefficients

## Using the ANOVA model, as we write it mathematically, provide the R
## code to predict infection_risk for each region.  The function
## coefficients() and summary(fit) are two strategies to get you the
## estatimes of the parameters.
