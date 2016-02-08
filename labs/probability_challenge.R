# Suppose you have three bags, one contains two white marbles,
# one two black, and the third one of each color.
# You pick a random bag and take out one marble.  It is a white marble.
# What is the probability that the remaining marble from the same bag is white?

bags <- vector('list', 3)
bags[[1]] <- c(1, 1)
bags[[2]] <- c(0, 0)
bags[[3]] <- c(1, 0)
n <- 1e6

# probability draw 1 is white
pa <- mean(unlist(lapply(sample(bags, n, replace=TRUE),
                         function(x) sample(x, 1))))

# probability draw 2 is white | draw 1 is white
outB <- rep(NA, n)
for (i in seq_len(n)) {
    b1 <- unlist(sample(bags, 1))
    d1 <- sample(b1, 1)
    while (d1 != 1) {
        b1 <- unlist(sample(bags, 1))
        d1 <- sample(b1, 1)
    }
    w <- which(b1 == 1)[1]
    outB[i] <- b1[-w]
}
mean(outB)
