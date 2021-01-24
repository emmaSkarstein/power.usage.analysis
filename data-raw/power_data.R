## code to prepare `power_data` dataset goes here

usethis::use_data(power_data, overwrite = TRUE)

#' Load all power usage data
#'
#' @return A data frame that contains all available power usage data points.
#'
#'
#' @examples
load_all_files <- function(){
  filenames <- list.files("./data-raw")
  megalist <- lapply(filenames, function(i){read.csv(paste0("./data-raw/", i), dec = ",", header = TRUE)})
  megaframe <- dplyr::bind_rows(megalist)
  return(megaframe)
}

load_data_to_package <- function(){
  power_data <- load_all_files()
  usethis::use_data(power_data)
}
