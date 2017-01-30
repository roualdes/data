## Lab Introduction to Stats and R

## 1. Read in our email dataset (creating a data frame).  Please
## download the dataset manually, put it in a folder specific to this
## class and call read.csv() on the file path.
## Hint: ?read.csv

email <- read.csv("/Users/ez/website/app/public/data/email.csv")

## 2. Using the email dataset, calculate each of the statistics
## discussed in class on variables of your choice.
## Hint: see class notes
## Hint: library(dplyr); ?dply::summarise

library(dplyr)

summarise(email,
          MnNumChar=mean(num_char),
          MdnNumChar=median(num_char),
          PropSpam=mean(spam),
          Q1LineBreaks=quantile(line_breaks, .25),
          Q3LineBreaks=quantile(line_breaks, .75),
          IQRLineBreaks=IQR(line_breaks),
          SDLineBreaks=sd(line_breaks))

## 3. Describe each statistic in plain English.

## The mean number of characters per email is estimated to be 10.71*1000.
## The median number of character per email is estimated to be 5.856*1000.
## About 10 percent of emails are spam.
## Roughly 25 percent of emails have fewer than 34 line breaks.
## Roughly 75 percent of emails have fewer than 298 line breaks.
## The interquartile range of line breaks is 298.
## The standard deviation of line breaks is 319.31.

## 4. On average which emails tend to have a larger mean/standard
## deviation of line breaks, spam or not spam emails?
## Hint, from most recommended, to least:
## library(tidyverse); ?dplyr::group_by
## ?aggregate
## ?which

# dig the new syntax; google: R dplyr pipe
email %>%
    group_by(spam) %>%
    summarise(PropSpam=mean(line_breaks),
              SdSpam=sd(line_breaks))

## 5. Make at least one plot of each of the plot types discussed in
## class, using the email dataset.  Describe, with full English
## sentences, each plot.
## Hint: see class notes and make sure things that supposed to be
## categorical variables are indeed recognized as factors.

library(ggplot2)

qplot(spam, data=email, geom="bar")
qplot(line_breaks, data=email, geom="histogram", binwidth=50)
qplot(factor(spam), line_breaks, data=email, geom="boxplot")
qplot(line_breaks, num_char, data=email)


## 6. Make a list (map/dict) containing at least four different types
## of R objects (e.g. boolean, numeric, string, vector, list, data
## frame, matrix).
## Hints: ?list, ?vector, ?matrix, ?data.frame

stuff <- vector('list', 7)              # initialization of a list

stuff[[1]] <- TRUE
stuff[[2]] <- 2
stuff[[3]] <- "Diego"
stuff[[4]] <- 1:-10
stuff[[5]] <- list(a=1, b=2, c=pi)
stuff[[6]] <- email
stuff[[7]] <- as.matrix(email[1:4,c("line_breaks", "num_char")])


## 7. What is the difference between these two methods of list
## extraction, [ and [[?
## Hint: ?[[

stuff[1] # returns a list of length one which contains the item requested

stuff[[1]] # returns just the item requested

## 8. Create a vector of length > 1.  Write a function that uses a for
## loop to add 1 to each element.
## Hint: ?c, ?rep

x <- rep(1, 20)
for(i in seq_along(x)) {
    x[i] <- x[i] + 1
}

## 9. With your original vector from 7., naively add the integer one
## to the entire vector.
## NB: Check out the following link about vectorization:
## http://www.noamross.net/blog/2014/4/16/vectorization-in-r--why.html

x <- rep(1, 20)
x + 1

## 10. Sample 100 integers between 0 and 10, and store it in
## a vector.
## Hint: ?base::sample

y <- sample(0:10, 100, replace=TRUE)

## 11. Check which values are greater than 7, and store the
## output in a new vector.  Print the new vector.
## Hint: ?>

z <- y > 7

## 12. Use the vector from 11. to index the original vector from 10.
## Hint: ?[

y[z]

## 13. Use one line of code to calculate the proportion of values in
## the vector from 10. that are greater than 7.

mean(y>7)
