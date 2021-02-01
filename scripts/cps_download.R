# cpsR
# cps_download
# Author:  Daniel Navarrete <https://github.com/navarretedaniel>
# 2019

# Introduction -----------------------------------------------------------------
#
# Creates a function that will download CPS monthly microdata for a given year.
#
# Example:
#    cps_download(2018)

# Function ---------------------------------------------------------------------

cps_download <- function(year, months){
  
  if (year >= 2014){
    
    ifelse(is.numeric(months), months <- list(tolower(month.abb[months])), 
           ifelse(months == "all", 
                  months <- c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"), 
                  months <- list(tolower(months))))
    
    input_year <- as.character(substr(year, 3, 4))
    
    for (month in months){
      url <- paste0("https://www2.census.gov/programs-surveys/cps/datasets/", year, "/basic/", month, input_year, "pub.zip")
      print(month)
      tempCPS <- tempfile()
      download.file(url, tempCPS, mode="wb")
      unzip(zipfile = tempCPS, exdir = 'data')
      print(paste0("Finished downloading and unzipping ", month, " ", year, " data."))}
    
  } else {
    print("ERROR:  Enter single year between 2014 - 2019 (e.g., 2018).")
  }
}
