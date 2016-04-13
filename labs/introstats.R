## comments; are we done here?

## creating variables
x <- 5
y <- "yo"

## vectors -- are weird => recycle
v <- c(1,2,3,4)
w <- v/4                                # 4 recycles

x <- rep(0, 4)                          # initialize vector
x <- c("rza"=1, "gza"=2, "ghostfacekillah"=3, "raekwon"=4)
x["rza"]                              # map-like

## lists
y <- vector("list", 2)                  # initialize list
y[[1]] <- "inspectahdeck"                      # map-like
y[[2]] <- 2:6                           
y[[3]] <- pi                            # R will let you do this
y[["odb"]] <- "dead"                    # or this!
y

y[2]                                    # careful what you ask for
y[[2]]

str(y[2])
str(y[[2]])

z <- list("mastakilla" = 1, "methodman" = pi, "ugod" = Inf) # inefficient
z[[4]] <- "NY"
z

## matrix; elements same type
X <- matrix(c(1,2,3,4,5,6), nrow=2)
Y <- matrix(c("z", "y", "x"), nrow=3)

## arrays
Z <- array(1:3, c(2,4)) # recycle 1:3 "2 2/3 times"
ZZ <- array(1:27, c(3,3,3))

## common functions
mean(v)
sum(w)
length(unique(c(v, w*4)))

## help files
?unique

## libraries
### installing libraries
install.packages(c("ape", "dplyr", "ggplot2"))

### load and use library
library(ape)
data(carnivora)

library(ggplot2)
?qplot
library(help="ggplot2")

## data structures
### data frame
email <- read.csv("https://roualdes.us/data/email.csv")
str(email)
names(email)
is.vector(email$spam)
nrow(email) # ncol(), dim()

rows <- 1:5
cols <- c("spam", "num_char", "format")
email[rows, cols] # fancy indexing on data frame
str(email[rows, cols])

### factor
spam.factor <- factor(email$spam) # one variable, spam
levels(spam.factor) # with two levels

### character
is.character(levels(spam.factor)[1])

## writing functions; 1st class
foo <- function() {
    s <- "Wicked high five, %s"
    f <- function(hifiver) {
        return(sprintf(s, hifiver))
    }
    return(f)
}

g <- foo()
yo <- g("Wu")
print(yo)

bar <- function(f) {
    s <- sample(1:1000, 50)
    print(length(s))
    return(f(s))
}

bar(mean)

## for loops, if else,
zs <- 1:100
for (z in zs) {
    if (z %% 2 == 0) {
        next
    } else if (z %% 3 == 0) {
        print(sprintf("z is a multiple of 3: %d", z))
    }
}

## vectorization cause for loops suck in R
buzz <- function(vs) {
    out <- 0
    for (v in vs) {
        out <- out+v
    }
    return(out)
}

bazz <- function(vs) {
    return(sum(vs))
}

vec <- runif(1e6)
system.time(buzz(vec))
system.time(bazz(vec))

### avoid them with
#### rowSums(), colSums(), rowMeans(), and colMeans(), cumsum(), and diff().

### subsetting can be vectorized
### notice email[rows, cols] above

### another example
spam.char <- email[email$spam==1,"num_char"]
mean(spam.char)

### another example
mean.vec <- mean(vec)
devs <- (vec - mean.vec)^2/(length(vec))
### what will length(devs) return?

    
