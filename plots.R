rm(list=ls())

#library(Hmisc)
library(ggplot2)

L <- c(58.33, 43.11, 55.41, 62.72, 59.83, 57.74, 61.66, 56.19, 55.50, 63.26)
M <- c(28.93, 44.03, 32.38, 27.43, 30.82, 31.97, 24.57, 33.94, 34.71, 26.62)
S <- c(12.74, 12.86, 12.21, 9.85, 9.35, 10.29, 13.77, 9.87, 9.79, 10.12)

data1 <- data.frame(L,M,S)


p <- ggplot(data1, aes(M,L))
p = p + geom_point() + geom_smooth(method=lm)
pdf("corr1.pdf")
print(p)
dev.off()

p2 <- ggplot(data1, aes(M-L, S))
p2 = p2 + geom_point() + geom_smooth(method=lm)
pdf("corr2.pdf")
print(p2)
dev.off()

#=============================================#

Bar1 = read.csv("Bar1.csv", header=FALSE)
Bar2 = read.csv("Bar2.csv", header=FALSE)

Bars = data.frame(Bar1[,2],Bar2[,2])

p3 <- ggplot(Bars, aes(Bars$Bar1, Bars$Bar2))
p3 = p3 + geom_point() + geom_smooth(method=lm) + labs(x = "Barometer 1", y="Barometer 2")

p4 <- ggplot(Bar1, aes(Bar1[,2] ~ Bar1[,1]))
p4 <- p4 + geom_line()

pdf("Baro1.pdf")
plot(Bar1[,2], type="l", main="", xlab="", ylab="")
title(main = "Pressure for the 7 last days (Barometer 1)", xlab="Hours", ylab="Pressure (hPa)")
dev.off()

pdf("Baro2.pdf")
plot(Bar2[,2], type="l", main="", xlab="", ylab="")
title(main = "Pressure for the 7 last days (Barometer 2)", xlab="Hours", ylab="Pressure (hPa)")
dev.off()

pdf("corr3.pdf")
print(p3)
dev.off()

Bar130 <- read.csv("Bar130.csv", header=FALSE)
Air2 = read.csv("Air2.csv", header=FALSE)

pdf("Air2.pdf")
plot(Air2[,2], type="l", main="", xlab="", ylab="")
title(main = "Air temperature for the 30 last days", xlab="Hours", ylab="Air temperature (°C)")
dev.off()

PA30 <- data.frame(Air2[,2],Bar130[,2])
p5 <- ggplot(PA30, aes(Air2...2.,Bar130...2.))
p5 <- p5 + geom_point() + geom_smooth(method=lm)

pdf("PresTemp.pdf")
print(p5)
dev.off()
