## Lab Probability; Due: 2016-09-06

## 1. re slide: probability.pdf -- Sample Space, examples
## a survey about people's belief in the future lifespan of PHP
## responses = {0, 1, 2, 3, 4, 5}
## each event is recorded as the average of 3 sequential responses
## What's the sample space?

## 4. Show how sample() can be used to replicate/simulate the probabilities of rolling a die.

## 5. Plot 100 simulated die rolls.

## 6. Does your plots depict the known probabilities?  Why or why not?  If not, what can you do to make your plot more accurate.  Do so.

## 7. Simulate rolling two dice.

## 8. What is the sample space of the sum of rolling two dice?

## 9. Simulate and plot the probabilities of each event within the sample space of summing two dice.

## 10. Explore dplyr
## https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
## https://cran.rstudio.com/web/packages/dplyr/vignettes/databases.html
library(dplyr)

## 11. Recall our speed dataset, https://roualdes.us/data/speed.csv.  Using the library dplyr, calculate the mean and median speed of the systems in this dataset.  Describe the skew of the speeds.
## Hint: ?summarise

## 12. Make a plot that justifies your above claim.

## 13. Starting from the following plot, add/edit/filter the plot and/or the data in anyway you see fit to make this plot as informative as possible.
qplot(system, mips, data=speed) + geom_bar(stat="identity")

## 14. We are now going to use the dataset ape::carnivora to learn more about dplyr.  First let's learn about the dataset carnivora.  Load ape, the dataset, and then scan the help file.
library(ape)
data(carnivora)
?carnivora

## 15. Check out the vignette https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html of the library dplyr.  Specifically pay attention to the section on Chaining.

## 16. Using the ape::carnivora dataset, calculate Family (group) means of the variable SW.
## Hint: ?group_by

## 17. From the dataset carnivora, calculate relative brain weights by Family; relative brain weights = SB/SW.
## Hint: ?mutate

## 18. Plot the relative brain weights by Family.

## 19. From the dataset carnivora, calculate mean relative brain weights for each Family.

## 20. If relative brain weight is a measure of intelligence, what are the top three most intelligent families?  What animlals do these families represent?

## Other good functions: distinct, n_distinct, order_by, rowwise, sample_n,
