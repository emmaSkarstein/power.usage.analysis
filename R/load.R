
#' Clean and prepare power usage data for visualization
#'
#' Tidy up the power usage data by formatting the date correctly and saving month, weekday and year variables separately.
#'
#' @param data A power usage data set.
#'
#' @return A cleaned data frame with a few extra columns to make visualization easier.
#' @export
#'
#' @examples
clean_and_prepare <- function(data){
  data <- dplyr::select(data, Fra, KWH.60.Forbruk)
  colnames(data) <- c("tid", "forbruk")
  data$tid <- as.POSIXct(data$tid, format = "%d.%m.%Y %H:%M")
  data$date <- as.Date(data$tid)
  data$month <- as.factor(lubridate::month(data$tid))
  data$weekday <- factor(weekdays(data$tid), levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
  data$year <- factor(lubridate::year(data$tid), levels = c(2019, 2020, 2021))
  data$hour <- format(data$tid, format = "%H:%M:%S")
  return(tidyr::drop_na(data))
}






