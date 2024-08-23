setwd("E:/Statistik/Übung/Daten")
install.packages("readxl")
library(readxl)

#Den Datensatz mit Values für perceived knowledge einfügen
data.ar <- read_excel("AR Intervention 2nd Pilot-Study_June 30, 2023_10.41.xlsx")
install.packages("dplyr")
library(dplyr)

#Nur die Items für perceived knowledge in einem neuen Datensatz einfügen 
AR <- select(data.ar, sr_know1, sr_know2)

#Die erste Zeile löschen, da sie nur die Beschreibung des entsprechenden Items ist. 
nrow(AR)
AR.1 <- AR[-c(1), ]

#Perceived knowledge Items von character ins numerisch invertieren.
sapply(AR.1, class)
AR.1$sr_know1 <- as.numeric(AR.1$sr_know1)
AR.1$sr_know2 <- as.numeric(AR.1$sr_know2)

#Mittelwert für jedes Item individuell berechnen.
mean(AR.1$sr_know1)
mean(AR.1$sr_know2)

#Standardabweichung für jedes Item individuell berechnen.
sd(AR.1$sr_know1)
sd(AR.1$sr_know2)

#Datensatz mit values für tested knowledge einfügen
data.arknow <- read_excel("AR Intervention 2nd Pilot-Study_June 30, 2023_10.41 tested knowledge.xlsx")

#Nur die Items für tested knowledge in einem neuen Datensatz einfügen.
ARKnow <- select(data.arknow, test_know1, test_know2, test_know3, test_know4, test_know5, test_know6, test_know7, test_know8, test_know9, test_know10, test_know11,) 

#Die erste Zeile löschen, da sie nur die Beschreibung des entsprechenden Items ist.
nrow(ARKnow)
ARKnow.1 <- ARKnow[-c(1), ]

sapply(ARKnow.1, class)

#Antworten umkodieren: "r" <- 1, "f" <- 0
ARKnow.1 <- as.character(ARKnow.1)
ARKnow.1[ARKnow.1 == "r"] <- 1 
ARKnow.1[ARKnow.1 == "f"] <- 0

ARKnow.1 <- as.numeric(ARKnow.1)

ARKnow.1$test_know1 <- as.character(ARKnow.1$test_know1)
ARKnow.1[ARKnow.1 == "r"] <- 1 

#Items von double zu integer umkodieren
typeof(test_know1)
as.integer(test_know1)


                   