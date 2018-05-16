refine_original <- read_csv("~/Downloads/refine_original.csv")
library(dplyr)
library(tidyr)
library(magrittr)
library(tibble)
View(refine_original)
refine_original[refine_original$company == "Phillips","company"] <- "philips"
refine_original[refine_original$company == "phillips","company"] <- "philips"
refine_original[refine_original$company == "fillips","company"] <- "philips"
refine_original[refine_original$company == "phlips","company"] <- "philips"
refine_original[refine_original$company == "phillps","company"] <- "philips"
refine_original[refine_original$company == "phllips","company"] <- "philips"
refine_original[refine_original$company == "phillipS","company"] <- "philips"
refine_original[refine_original$company == "ak zo","company"] <- "akzo"
refine_original[refine_original$company == "akz0","company"] <- "akzo"
refine_original[refine_original$company == "Akzo","company"] <- "akzo"
refine_original[refine_original$company == "AKZO","company"] <- "akzo"
refine_original[refine_original$company == "Van Houten","company"] <- "van houten"
refine_original[refine_original$company == "van Houten","company"] <- "van houten"
refine_original[refine_original$company == "unilver","company"] <- "unilever"
refine_original[refine_original$company == "Unilever","company"] <- "unilever"
refine_original <- mutate(refine_original,"product_number" = "NA")
refine_original <- mutate(refine_original,"product_code" = "NA")
refine_original <- mutate(refine_original,"product_category" = "NA")
refine_original <- refine_original %>% separate(2,into = c("product_code","product_number"),sep = "-")
refine_original[refine_original$product_code == "p","product_category"] <- "Smartphone"
refine_original[refine_original$product_code == "v","product_category"] <- "TV"
refine_original[refine_original$product_code == "x","product_category"] <- "Laptop"
refine_original[refine_original$product_code == "q","product_category"] <- "Tablet"
refine_original <- mutate(refine_original,"full_address" = "NA")
refine_original <- unite(refine_original,"full_address",c("address","city","country"),sep = ",")
refine_original <- add_column(refine_original,company_philips = 0)
refine_original <- add_column(refine_original,company_akzo = 0)
refine_original <- add_column(refine_original,company_van_houten = 0)
refine_original <- add_column(refine_original,company_unilever = 0)
refine_original <- add_column(refine_original,product_smartphone = 0)
refine_original <- add_column(refine_original,product_tv = 0)
refine_original <- add_column(refine_original,product_laptop = 0)
refine_original <- add_column(refine_original,product_tablet = 0)
refine_original[refine_original$company == "philips","company_philips"] <- 1
refine_original[refine_original$company == "akzo","company_akzo"] <- 1
refine_original[refine_original$company == "van houten","company_van_houten"] <- 1
refine_original[refine_original$company == "unilever","company_unilever"] <- 1
refine_original[refine_original$product_category == "Smartphone","product_smartphone"] <- 1
refine_original[refine_original$product_category == "TV","product_tv"] <- 1
refine_original[refine_original$product_category == "Laptop","product_laptop"] <- 1
refine_original[refine_original$product_category == "Tablet","product_tablet"] <- 1
write.csv(refine_original,'~/Downloads/refine_clean.csv')