rm(list=ls())

library(Hmisc)


######
# Exercise 1
######

L <- c(58.33, 43.11, 55.41, 62.72, 59.83, 57.74, 61.66, 56.19, 55.50, 63.26)
M <- c(28.93, 44.03, 32.38, 27.43, 30.82, 31.97, 24.57, 33.94, 34.71, 26.62)
S <- c(12.74, 12.86, 12.21, 9.85, 9.35, 10.29, 13.77, 9.87, 9.79, 10.12)

# We compute the M~L correlation
ml <- rcorr(M,L)
print("ML")
print(ml)

#We compute the M-L~S correlation
mls <- rcorr(M-L, S)
print("MLS")
print(mls)


######
# Exercise 2
######

A <- c(98.63, 99.57, 98.28, 98.38, 99.49, 101.03, 98.73, 99.87, 99.27, 100.61)
B <- c(99.02, 98.48, 98.46, 97.70, 99.51, 98.36, 97.78, 99.85, 98.27, 97.91)

# We compute the Student test. A and B have the same mean
tab <- t.test(A,B)
print("TAB")
print(tab)

# We compute the Student test. A has a greater mean than B
tabg <- t.test(A,B, alternative="greater")
print("TABg")
print(tabg)

# We compute the Student test. A has a mean equal to 100mg
ta <- t.test(A, mu=100)
print("TA")
print(ta)

# We compute the Student test. B has a mean equal to 100mg
tb <- t.test(B, mu=100)
print("TB")
print(tb)


######
# Exercise 3
######

# We import the data of the two barometers (7d, first line removed in .csv)
Bar1 <- read.csv("Bar1.csv", header=FALSE)
Bar2 <- read.csv("Bar2.csv", header=FALSE)

# We put the pressures in a dataframe
Bars <- data.frame(Bar1[,2],Bar2[,2])

# We compute the Spearman correlation between the pressures of the 2 barometers
bar7 <- rcorr(Bars$Bar1,Bars$Bar2, type="spearman")
print("Bars7")
print(bar7)

# We fit a linear model to the correlation between the two barometers
lmbar7 <- lm(Bars$Bar2 ~ Bars$Bar1)
summary(lmbar7)

# We import the data of the first barometer (30d, first line removed in .csv)
Bar130 <- read.csv("Bar130.csv", header=FALSE)

# We select only the last 23 days and put these in a dataframe
Bar23 <- data.frame( Bar130[1:(length(Bar130[,2]) - length(Bars$Bar1)),2])

# We compute the two samples Kolmogorov-Smirnov test
t723 <- ks.test(Bar23,Bars$Bar1)
print(t723)


# We import the data of the second thermometer (30d, first line removed in .csv)
Air2 = read.csv("Air2.csv", header=FALSE)

# We compute the correlation between the data of the barometer and the thermometer
ap <- rcorr(Bar130[,2],Air2[,2])
print("AP")
print(ap)

# We fit a linear model to the correlation between the barometer and the thermometer
lmAP <- lm(Bar130[,2]~Air2[,2])
summary(lmAP)
