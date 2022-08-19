## Code to prepare `power_data` dataset goes here

library(dplyr)

# Test that the files can be joined
file1 <- read.csv("./data-raw/19_01.csv", dec = ",", header = TRUE)
file2 <- read.csv("./data-raw/22_02.csv", dec = ",", header = TRUE)
file_joined <- bind_rows(file1, file2)

load_all_files <- function(){
  file_names <- setdiff(list.files(path="./data-raw"), "save_data.R")
  all_power_data <- file_names %>%
    lapply(function(i){read.csv(paste0("./data-raw/", i), dec = ",", header = TRUE)}) %>%
    dplyr::bind_rows()

  return(all_power_data)
}

load_data_to_package <- function(){
  power_data <- load_all_files()
  usethis::use_data(power_data, overwrite = TRUE)
}

load_data_to_package()
