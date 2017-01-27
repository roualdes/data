## Lab Introduction to Stats and R

## 1. Read in our email dataset (creating a data frame).  Please
## download the dataset manually, put it in a folder specific to this
## class and call read.csv() on the file path.
## Hint: ?read.csv

## 2. Using the email dataset, calculate each of the statistics
## discussed in class on variables of your choice.
## Hint: see class notes
## Hint: library(dplyr); ?dply::summarise

## 3. Describe each statistic in plain English.

## 4. On average which emails tend to have a larger mean/standard
## deviation of line breaks, spam or not spam emails?
## Hint, from most recommended, to least:
## library(tidyverse); ?dplyr::group_by
## ?aggregate
## ?which

## 5. Make at least one plot of each of the plot types discussed in
## class, using the email dataset.  Describe, with full English
## sentences, each plot.
## Hint: see class notes and make sure things that supposed to be
## categorical variables are indeed recognized as factors.

## 6. Make a list (map/dict) containing at least four different types
## of R objects (e.g. boolean, numeric, string, vector, list, data
## frame, matrix).
## Hints: ?list, ?vector, ?matrix, ?data.frame

## 7. What is the difference between these two methods of list
## extraction, [ and [[?
## Hint: ?[[

## 8. Create a vector of length > 1.  Write a function that uses a for
## loop to add 1 to each element.
## Hint: ?c, ?rep

## 9. With your original vector from 7., naively add the integer one
## to the entire vector.
## NB: Check out the following link about vectorization:
## http://www.noamross.net/blog/2014/4/16/vectorization-in-r--why.html

## 10. Sample 100 integers between 0 and 10, and store it in
## a vector.
## Hint: ?base::sample

## 11. Check which values are greater than 7, and store the
## output in a new vector.  Print the new vector.
## Hint: ?>

## 12. Use the vector from 11. to index the original vector from 10.
## Hint: ?[

## 13. Use one line of code to calculate the proportion of values in
## the vector from 10. that are greater than 7.
