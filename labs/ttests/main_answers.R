## Consider Darwin's finch data: https://roualdes.us/data/finches.csv.
## Make a plot of the finches tarsus length (mm).  Detail aspects of
## the data that one should consider before analyzing the mean tarsus
## length.  Does anything concern you about these data?

library(ggplot2)
finch <- read.csv("https://roualdes.us/data/finches.csv")
qplot(tarsuslength, data=finch, geom="histogram", binwidth=1)
## the histogram looks symmetric enough to not require a huge sample
## size

library(dplyr)
qplot(island, tarsuslength,
      data=filter(finch, island %in% c("floreana", "sancristobal")),
      geom="boxplot")
## still very little skew

## Calculate a 98% confidence interval for the difference in mean
## tarsus length for finches on the island Floreana as compared to San
## Cristobal.

## concise with R code we know
with(finch %>%
    select(island, tarsuslength) %>%
    filter(island %in% c("floreana", "sancristobal")) %>%
    group_by(island) %>%
    summarise(n=n(), v=var(tarsuslength), xbar=mean(tarsuslength)), {
    se <- sqrt(sum(v/n))
    -diff(xbar) + qt(c(0.01, 0.99), min(n)-1)*se})

## R code I haven't yet shown you because I wanted you to know what's
## behind it
t.test(tarsuslength~island,
       data=filter(finch, island %in% c("floreana", "sancristobal")),
       conf.level=0.98)
## small difference in answers is due to our conservative
## approximation of the degrees of freedom.
## We are 98% confident that the true difference in mean tarsus length between Floreana and San Cristobal finches is between -0.8 and 0.5 mm.

## Is there evidence that the mean tarsus length differs by island?

## There is not evidence that the mean tarsus lengths differ between these two island's finches since the confidence interval includes 0.

## Set up a hypothesis test from which the above confidence interval
## could conclude; give the null and alternative hypotheses and the
## appropriate level of significance.

## H0: mu_s = mu_f
## H1: mu_s != mu_f
## alpha = 0.02

## How would you conclude a hypothesis test about the difference in
## mean tarsus length between these two island's finches?

## Fail to reject H0 since the null value is included within the
## corresponding confidence interval.  This conclusion corresponds to
## the p-value method of concluding a hypothesis test, p-value = 0.59
## (same t.test function used above)

## Plot the upper and lower beak lengths of these Galapagos finches.
## Detail aspects of the data that one should consider before
## analyzing the mean difference between upper and lower beak lengths.

## scatterplot
qplot(lowerbeaklength, upperbeaklength, data=finch) +
    geom_abline(slope=1, intercept=0)

## or boxplot by categorical variable beak (with levels upper/lower)
## requires reorganization of the data, using some code you've never
## seen before with a library you've never seen before.

library(tidyr)
beakdata <- finch %>%
    select(upperbeaklength, lowerbeaklength) %>%
    gather(beak, length) %>%
    extract(beak, c("beak"), "([[:alnum:]]{5})")

qplot(beak, length, data=beakdata, geom="boxplot", xlab="beak")

## again we're looking for skew coupled with small sample sizes, as
## this is a recipe for inaccurate confidence intervals.

## On average which beak length is larger for Galapagos finches, the
## upper or lower beak length (mm)?  Construct a 95% confidence
## interval to justify your claim.

d <- finch$lowerbeaklength - finch$upperbeaklength
xbar <- mean(d)
s <- sd(d)
n <- length(d)

xbar + qt(c(0.025, 0.975), n-1)*s/sqrt(n)

## Interpret your confidence interval.

## We are 95% confident that the true mean difference in upper versus lower beak lengths is between 7.42 and 8.01 mm.

## more new code would give us
t.test(length~beak, data=beakdata, paired=TRUE)
