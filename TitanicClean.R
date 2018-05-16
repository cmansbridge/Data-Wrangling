library(dplyr)
library(tidyr)
library(magrittr)
library(tibble)
titanic_original <- read.csv("~/Downloads/titanic_original.csv")
View(titanic_original)
titanic_original[titanic_original$embarked == "","embarked"] <- "S"
titanic_original[titanic_original$embarked == " ","embarked"] <- "S"
mn_age <- mean(titanic_original$age, na.rm=TRUE)
mn_age
replace_na(titanic_original$age,age = mn_age)
titanic_original$boat = factor(titanic_original$boat,levels = c(levels(titanic_original$boat),"NA"))
titanic_original[titanic_original$boat == "","boat"] <- "NA"
titanic_original <- mutate(titanic_original,"has_cabin_number" = 0)
titanic_original[titanic_original$cabin != "","has_cabin_number"] <- 1
write.csv(titanic_original,'~/Downloads/titanic_clean.csv')