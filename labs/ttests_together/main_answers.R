## Consider a dataset on mammalian sleep patterns: ggplot2::msleep.
library(ggplot2)
## ?msleep

## Plot sleep_rem by vore.
qplot(vore, sleep_rem, data=msleep, geom="boxplot")


## Which type of analysis is appropriate for subsets of these data?  Which subsets?
two-sample t-test on pairs of the levels of vore, e.g. carni and insecti


## Detail aspects of the data that one should consider before
## analyzing the difference of means by (subsets of) vore.
sample size, skew, and potential outliers


## Calculate 97% confidence intervals for the mean rem sleep of
## mammals by the groups you chose above.

library(dplyr)
d <- msleep %>%
    filter(vore %in% c("carni", "insecti")) %>%
    group_by(vore) %>%
    summarise(MnRemSleep = mean(sleep_rem, na.rm=TRUE),
              sdRemSleep = sd(sleep_rem, na.rm=TRUE),
              n = sum(!is.na(sleep_rem)),
              tstar <- qt(0.975, n-1),
              RemSleepLB = MnRemSleep - tstar/sdRemSleep/sqrt(n),
              RemSleepUB = MnRemSleep + tstar/sdRemSleep/sqrt(n))

## Calculate a 97% confidence interval for the difference in mean
## rem sleep for mammals by the subset of food preferences you chose
## above.

In an effort to move us towards R functions that calculate everything
for us, check out t.test.

?t.test

t.test(sleep_rem ~ vore,
       data=filter(msleep, vore %in% c("carni", "insecti")),
       conf.level=0.97)

## Interpret your confidence interval.

We are 97% confident that the true population mean difference in rem
hours of sleep between carni and insecti is between -4.3 and 2.06.

The accuracy of this interval should be in question though because of
our confidence intervals by groups above.


## Is there evidence that the mean rem sleep differs by diet?

There is not evidence of a difference in mean rem sleep between carnivora and insectivores.


## Set up a hypothesis test from which the above confidence interval
## could conclude; give the null and alternative hypotheses and the
## appropriate level of significance.

H0: mu_c = mu_i
H1: mu_c != mu_i
alpha = 0.03


## Conclude your hypothesis above using the confidence interval.
Fail to reject H0, because 0 is within the confidence interval.

## Justify your conclusion with a p-value.

From t.test p-value is 0.3203 => fail to reject H0.

We also need to be careful with this conclusion.  Still, accuracy is a
concern as with the confidence interval.
