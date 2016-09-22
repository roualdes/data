## Lab Probability; Due: 2016-09-06

## 1. re slide: probability.pdf -- Sample Space, examples
## a survey about people's belief in the future lifespan of PHP
## responses = {0, 1, 2, 3, 4, 5}
## each event is recorded as the average of 3 sequential responses
## What's the sample space?

## my first, and recommended stategy was
d <- 0:5
S <- unique(rowMeans(expand.grid(d,d,d)))
# check out dplyr's chaining to drop deeply nested functions

## but an unnamed student showed me
s <- (0:15)/3 # which crushes in efficiency and memory concerns
all.equal(S, s)

## 4. Show how sample() can be used to replicate/simulate the probabilities of rolling a die.

dieroll <- sample(1:6, 1)

## 5. Plot 100 simulated die rolls.
library(ggplot2)
qplot(sample(1:6, 1000, replace=TRUE), geom="bar")

## 6. Does your plots depict the known probabilities?  Why or why not?  If not, what can you do to make your plot more accurate.  Do so.

## My plot above does not depict the known probabilities, rather estimates of them.  One would have to sample many, many times (think approximating the limiting relative frequency of each event in the sample space) to get reasonable estimates of the true probabilities.

## improved plot to get out proportions of each event
df <- data.frame(x=sample(1:6, 1e5, replace=TRUE))
ggplot(df) + geom_bar(aes(x=x, y=..prop..))

## 7. Simulate rolling two dice.
numrolls <- 1
roll2 <- function(nrolls) {
    matrix(sample(1:6, 2*nrolls, replace=TRUE), ncol=2)
}

roll2(numrolls)

## 8. What is the sample space of the sum of rolling two dice?

S.2dice <- 2:12

## 9. Simulate and plot the probabilities of each event within the sample space of summing two dice.
numrolls <- 1e4
df <- data.frame(x=rowSums(roll2(numrolls)))
ggplot(df) + geom_bar(aes(x=x, y=..prop..))

## 10. Explore dplyr
## https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
## https://cran.rstudio.com/web/packages/dplyr/vignettes/databases.html
library(dplyr)

## 11. Recall our speed dataset, https://roualdes.us/data/speed.csv.  Using the library dplyr, calculate the mean and median speed of the systems in this dataset.  Describe the skew of the speeds.
## Hint: ?summarise

speed <- read.csv("https://roualdes.us/data/speed.csv")
summarise(speed,
          mn=mean(mips),
          mdn=median(mips))
## Since the mean is so much larger than the median, we can safely say that mips is right skewed.

## 12. Make a plot that justifies your above claim.
qplot(mips, data=speed, geom="histogram", bins=50)

## 13. Starting from the following plot, add/edit/filter the plot and/or the data in anyway you see fit to make this plot as informative as possible.
qplot(system, mips, data=filter(speed, cores==1, year>=2000)) +
    geom_bar(stat="identity") +
    labs(x="System name",
         y="Millions of instructions per second",
         title="Single core machines from 2000 forward") +
    theme(axis.text.x = element_text(angle=45, hjust=1))

## 14. We are now going to use the dataset ape::carnivora to learn more about dplyr.  First let's learn about the dataset carnivora.  Load ape, the dataset, and then scan the help file.
library(ape)
data(carnivora)
?carnivora

## 15. Check out the vignette https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html of the library dplyr.  Specifically pay attention to the section on Chaining.

## 16. Using the ape::carnivora dataset, calculate Family (group) means of the variable SW.
## Hint: ?group_by

carnivora %>%
    group_by(Family) %>%
    summarise(mn=mean(SW))

## 17. From the dataset carnivora, calculate relative brain weights by Family; relative brain weights = SB/SW.
## Hint: ?mutate
carnivora %>%
    group_by(Family) %>%
    mutate(relBrainWeight=SB/SW)

## 18. Plot the relative brain weights by Family.
carnivora %>%
    group_by(Family) %>%
    mutate(relBrainWeight=SB/SW) %>%
    qplot(Family, relBrainWeight, data=., geom="boxplot")

## 19. From the dataset carnivora, calculate mean relative brain weights for each Family.
carnivora %>%
    group_by(Family) %>%
    mutate(relBrainWeight=SB/SW) %>%
    summarise(mnRelBrainWeight=mean(relBrainWeight))

## 20. If relative brain weight is a measure of intelligence, what are the top three most intelligent families?  What animlals do these families represent?
## 1. Procyonidae, 2. Mustelidae, 3. Viverridae
## 1. Racoons, 2. Weasels and such, 3. are those not weasels?
## Also, check this out: http://www.pnas.org/content/113/9/2532.abstract

## Other good functions: distinct, n_distinct, order_by, rowwise, sample_n,
