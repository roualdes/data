## re slide: probability.pdf -- Sample Space, examples
## a survey about people's belief in the future lifespan of PHP
## responses = {0, 1, 2, 3, 4, 5}
## each event is recorded as the average of 3 sequential responses
## What's the sample space?






## re slide: probability.pdf -- Probability, example
## Roll two fair dice,  what is P({Roll 1 + Roll 2 == 7})?








## dplyr
## https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
## https://cran.rstudio.com/web/packages/dplyr/vignettes/databases.html
library(dplyr)
speed <- read.csv("https://roualdes.us/data/speed.csv")
onecore <- select(filter(speed, cores==1, year > 2000), system)

## dplyr w/ new data set
library(ape)
data(carnivora)
?carnivora

## semi-complex request
summarise(mutate(group_by(carnivora, Family), brbo = SB/SW), Mn_brbo = mean(brbo, na.rm=TRUE))

## these sort of requests can get long
## dplyr offers new syntax

carnivora %>%
    group_by(Family) %>%
    mutate(relbrainwt = SB/SW) %>%
    summarise(mean.relbrainwt = mean(relbrainwt, na.rm=TRUE))

heavy <- carnivora %>%
    group_by(Family) %>%
    mutate(relbrainwt = SB/SW)

## ggplot2
library(ggplot2)
qplot(Family, relbrainwt, data=heavy,
      geom="boxplot", na.rm=TRUE,
      ylab="Relative brain weight (g/kg)",
      main="Carnivora Families by relative brain weight") +
    theme_bw() +
    theme(axis.text.x = element_text(angle=45, hjust=1))

## other good functions: distinct, n_distinct, order_by, rowwise, sample_n, 
