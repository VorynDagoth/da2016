library(downloader)
library(dplyr)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

sat.seed(1)
dat.ns <- sample(bwt.nonsmoke, 25)
m <- runif(400)
m <- matrix(m, nrow = 20)
rownames(m) <- letters[1:20]
heatmap(m)

install.packages("ggplot2")
library(ggplot2)
qplot(data = iris, x = Sepal.Lenght, y = Petal.Lenght)
qplot(data = iris, 
      x = Sepal.Length,
      y = Petal.Length,
      color = Species,
      size = Petal.Width,
      alpha = I(0.7))

