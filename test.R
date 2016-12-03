rm(list=ls())

library(Hmisc)

L <- c(58.33, 43.11, 55.41, 62.72, 59.83, 57.74, 61.66, 56.19, 55.50, 63.26)
M <- c(28.93, 44.03, 32.38, 27.43, 30.82, 31.97, 24.57, 33.94, 34.71, 26.62)
S <- c(12.74, 12.86, 12.21, 9.85, 9.35, 10.29, 13.77, 9.87, 9.79, 10.12)

ml <- rcorr(M,L)
print("ML")
print(ml)

mls <- rcorr(M-L, S)
print("MLS")
print(mls)

A <- c(98.63, 99.57, 98.28, 98.38, 99.49, 101.03, 98.73, 99.87, 99.27, 100.61)
B <- c(99.02, 98.48, 98.46, 97.70, 99.51, 98.36, 97.78, 99.85, 98.27, 97.91)

tab <- t.test(A,B)
print("TAB")
print(tab)

tabg <- t.test(A,B, alternative="greater")
print("TABg")
print(tabg)

ta <- t.test(A, mu=100)
print("TA")
print(ta)

tb <- t.test(B, mu=100)
print("TB")
print(tb)

tal <- t.test(A, mu=100, alternative="less")
print("TAl")
print(tal)

#========================#

Bar1 = read.csv("Bar1.csv", header=FALSE)
Bar2 = read.csv("Bar2.csv", header=FALSE)

Bars = data.frame(Bar1[,2],Bar2[,2])

bar7 <- rcorr(Bars$Bar1,Bars$Bar2)
print("Bars7")
print(bar7)

lmbar7 <- lm(Bars$Bar2 ~ Bars$Bar1)
