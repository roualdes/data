## Lab 02: Probability

## Video game designers (at least used to) use a variation on the theme,
## make bad guy jump out with probability p, where the magnitude of p
## depends on the difficulty level.  For instance, there is a bad guy
## over there 30% of the time when on easy, 50% when on medium, and 80%
## when on hard.  The probability is a limiting relative frequency.

## 1. Generate and store some large number of uniformly distributed
## random values between 0 and 1, by using the function runif.
## Hint: ?runif

## 2. Find the proportion of these values less than .25.

## 3. Find the proportion of these values less than .75.

## 4. Find the proportion of these values less than .95.

## 5. What do you notice from 2., 3., and 4.?

## 6. Write a function that takes the argument named `difficulty`, a
## string, and then prints "Ahhh, bad guy!" if a randomly generated
## uniform value between 0 and 1 is less than p, where p depends on
## the value of `difficulty`, and otherwise prints "Shwew, safe.".
## Hint: ?function
## Hint: ?if
## Hint: here's a simple function taking a string as its only argument.
hello <- function(strng) {
    output <- paste("Hello,", strng)
    return(output)
}
hello("Edward")

## Check that your function from 6. presents a bad guy only p% of the
## time.

## 7. Repeatedly call your function from 6. some large amount
## of times and store each result.
## Hint: ?replicate

## 8. Calculate the proprotion of times "Ahhh, bad guy!" shows
## up.
## Hint: ?==

## 9. Make a plot, like the one on slide 19 named "Probability,
## example" from the lecture titled Probability.
