rm(list=ls())

library(Hmisc)

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

pdf("corr3.pdf")
print(p3)
dev.off()
