## Consider some nationalhospital data:
## https://roualdes.us/data/hospital.csv.  Hospital, as clean as they
## are, are notorious places to acquire infections.  We'll consider
## the variable infection_risk across four different regions of the
## U.S. for randomly selected hospitals.

## Make an apprioriate plot to investigate the mean of infection_risk by region.

hospital <- read.csv("https://roualdes.us/data/hospital.csv")
library(ggplot2)
## notice
is.factor(hospital$region)
qplot(factor(region), infection_risk, data=hospital, geom="boxplot")

## State the three assumptions of ANOVA.  Comment on the validity of
## each of the assumptions.

## independent observations -- randomly selected hospitals; assumption met
## normality within each group -- no heavy skew in boxplots above; assumption met
## constant variation amongst groups -- region four has smaller variation than the rest, but not dramaticaly so

## Set up appropriate hypothesis for ANVOA, to test the mean of
## infection_risk by region.  Pick a level of significance.

## Ho: mu_1 = mu_2 = mu_3 = mu_4
## Ha: at least one different from the rest
## alpha = 0.05

## Evaluate your hypothesis and conclude in context.

fit <- lm(infection_risk{\textasciitilde}factor(region), data=hospital)
anova(fit)

## Which of the mean(s) appear different than the rest?  Be sure to
## use the Bonferroni correction.

k <- 4
K <- choose(k, 2)
astar <- 0.05/K

library(dplyr)
pairs <- combn(1:4, 2)
apply(pairs, 2, function(x)
    t.test(infection_risk{\textasciitilde}factor(region),
           data=filter(hospital, region %in% x),
           conf.level=1-astar))

## Try a different experiment-wise error correction, Tukey's
## Honest Significant Difference.
## ?TukeyHSD
## If you named your ANOVA linear model as such
## fit <- lm(...)
## then call
## TukeyHSD(aov(fit), conf.level=...)

TukeyHSD(aov(fit), conf.level=0.95) # see help file

## Calculate the group means to ensure you know how the ANOVA model
## works.  Use the function coefficients and compute them yourself.
## Make sure the two strategies agree.
## ?coefficients

coefficients(fit)

hospital %>%
    group_by(region) %>%
    summarise(xbar=mean(infection_risk))
