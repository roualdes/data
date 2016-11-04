## Consider our beloved dataset ape::carnivora:
library(ape)
data(carnivora)

## Make a plot of the variable LY, longevity, and describe the plot.
library(ggplot2)
qplot(LY, data=carnivora, geom="histogram", binwidth=10, na.rm=TRUE)

## Calculate a 98% confidence interval of the sample mean of
## LY, longevity.  Interpret your conifedence interval in context.
library(dplyr)
ly <- carnivora %>%
  select(LY) %>%
  na.omit
n <- length(ly$LY)
s <- sd(ly$LY)
xbar <- mean(ly$LY)
tstar <- qt(c(0.01, 0.99), n-1)

xbar + tstar*s/sqrt(n)

We are 98% confident that the true population mean longevity of animals of the order Carnivora is between 158.14 and 205.86 months.

## Calculate a 98% bootstraped confidence interval of the sample mean
## of longevity.  Is your confidence interval the same?  Does it
## have the same interpretion?
## Use type "bca".
library(boot)

## write function to pass into boot(); calculate statistic of interest
sample_mean <- function(data, index) { # takes args data, index as placeholders
  mean(data[index])                    # calc mean on arbitrarily indexed data
}

## let R sample R times with replacement from original data
## calculating the statistic of interest on each bootstrap sample
b <- boot(data=ly$LY, statistic=sample_mean, R=2000)

## bootstrap confidence interval from boot() returned object
boot.ci(b, conf=.98, type="bca")


## Calculate a 98% bootstraped confidence interval of the sample
## median of longevity.  Interpret your conifedence interval in
## context.
## Use type "bca".

sample_median <- function(data, index) {
  median(data[index])        # calc median on arbitrarily indexed data
}
b <- boot(data=ly$LY, statistic=sample_median, R=2000)
boot.ci(b, conf=.98, type="bca")

## Can we bootstrap ANOVA, in the case that the normality assumption
## doesn't hold?
Yes.

## First, let's learn how to extract the statistic of interest.
## Fit a linear model.
fit <- carnivora %>%
  select(LY, SuperFamily) %>%
  na.omit %>%
  lm(LY ~ SuperFamily, data=.)

## what's the anova object all about?
names(anova(fit))

## extract singular stat of interest.
anova(fit)$`F value`[1] # later denoted F_0

## write function, using built in R functions,
## to calculate and return F statistic of interest.
boot_anova <- function(d, i){
  ## when indexing a data frame, we need to resample the observation
  fit <- lm(LY ~ SuperFamily, data=d[i,]) # resample observations => index rows
  anova(fit)$`F value`[1]
}
b <- boot(carnivora %>% select(LY, SuperFamily), boot_anova, R=2000)

## anova p-value comes from right tail: P(F > F_0).
## Since bootstrap estimates the sampling distribution
## with R=2000 bootstrap statistics, we can approximate
## the area in the right tail beyond F_0 a p-value with
mean(b$t > b$t0) # bootstrap estimated p-value; same conclusion as above

## graphically, p-value is shaded area under estimated sampling distribution
df <- data.frame(t=b$t) # create data frame for fancy plot from bootstrap data
pbreaks <- pretty(b$t)  # pretty axis values, given our data
brks <- append(pbreaks, value=round(b$t0, 2), after=1) # add stat to axis values
lbls <- as.character(brks)              # get tick labels
## amend labels for clarity and aesthetics; each tilde is a space
lbls[2] <- as.expression(bquote(~~~~~~~~F[0]==.(lbls[2])))

# create histogram of R=2000 bootstrapped statistics
ggplot(data=df, aes(x=t)) + # initalize fancy plot
    ## make histogram of density values, instead of counts
    ## fill bins as white
    geom_histogram(aes(y=..density..), binwidth=1, fill="white", colour="black")+
    ## only bootstrap stats bigger than F_0 are to be counted => shaded
    geom_histogram(data=filter(df, t>b$t0), aes(y=..density..),
                   binwidth=1, fill="black", colour="black") +
    geom_vline(xintercept=b$t0) +       # add vertical line at F_0
    scale_x_continuous(breaks=brks, labels=lbls) # add custom breaks and labels
