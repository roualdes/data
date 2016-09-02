## Lab Introduction to Stats and R

## 1. Read in our email dataset (creating a data frame).
## Hint: Some Linux machines don't immediately play nicely with
## https.  Instead download the dataset manually and use read.csv
## on the file path.
## Hint: ?read.csv

email <- read.csv("https://roualdes.us/data/email.csv")

## 2. Using the email dataset, calculate each of the statistics
## discussed in class on variables of your choice.
## Hint: see class notes

s <- with(email, {
    c(mean(spam), mean(num_char), sd(num_char),IQR(num_char))})

## 3. Write a function that calculates mean of a numerical vector.
## Hint: ?for, ?[

foo <- function(x) {
    mn <- 0
    for (i in seq_along(x)) {
        mn <- mn + x[i]
    }
    ## Even without a return() statement,
    mn/length(x) # R will return the last unstored object of a function.
}

## Compare the computation time of your for function versus the
## computaiton time of mean() using the function system.time() and a
## large (long) vector of data.
## Hint: ?system.time

x <- 1:10000
system.time(foo(x))
system.time(mean(x))                  # conclusion, for loops are slow

## 4. Make at least one plot of each of the plot types discussed in
## class using the email dataset.  Describe, with full English
## sentences, each plot.
## Hint: see class notes.

library(ggplot2)
qplot(spam, data=email, geom="bar")
qplot(line_breaks, data=email, geom="histogram", binwidth=50)
qplot(factor(spam), num_char, data=email, geom="boxplot")
qplot(num_char, line_breaks, data=email)

## 5. Make a list (map/dict) containing at least four different types
## of R objects (e.g. boolean, numeric, string, vector, list, data
## frame, matrix) where the key is the name of the value being held.
## Hints: ?list, ?vector, ?matrix, ?data.frame

l <- list(bool=TRUE,
          string="Edward",
          vector=1:5,
          list=list(matrix=matrix(1:6, nrow=2),
                    data.frame=email))

## 6. What is the difference between these two methods of list
## extraction, [ and [[?
## Hint: ?[[

l[1] # a list of length one containing the element requested
l[[1]] # the element requested

## NB.  You've mastered this when you understand whats going on with
## these lines.
l["list"]
l[["list"]]["data.frame"]
## Hint to avoid too much printing: ?str

## 7. Create a vector of length > 1.  Write a function that uses a for
## loop to add 1 to each element.
## Hint: ?c, ?rep

v <- rep(1, 1583)
bar <- function(x) {
    for (i in seq_along(x)) {
        x[i] <- x[i] + 1
    }
    x                                   # no return statement
}

## 8. With your original vector from 7., naively add one to the entire
## vector.  Compare the computation time of these two approaches.
## Hint: http://www.noamross.net/blog/2014/4/16/vectorization-in-r--why.html

system.time(bar(v))
system.time(v+1) # conclusion, vectorization is a thing. Read about it.
