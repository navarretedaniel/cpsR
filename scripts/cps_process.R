# cpsR
# cps_process
# Author:  Daniel Navarrete <https://github.com/navarretedaniel>
# 2019

# Introduction -----------------------------------------------------------------
#
# Creates a function that converts CPS .dat file(s) into CSV file(s).
#
# Example:
#    cps_process(2018)

# Function ---------------------------------------------------------------------
library(tidyverse)

cps_process <- function(year){
  input_year <<- as.character(substr(year, 3, 4))
  source("~/cpsR/scripts/cps_variables.R")
  files <- as.vector(list.files(pattern = "\\.dat$"))
  
  input <- paste0(input_year, "pub.dat$")
  
  # Create a list of files matching our CPS year.
  files <- list.files(path = "data", pattern = input, full.names = TRUE)

  # Clean-up file name text.
  i = 1
  for (file_name in files){
    file_name_short <- gsub("data/", "", file_name)
    files[i] <- file_name
    i = i+1}
  
  # Process CPS .dat file into CSV.

  if (year < 2014 || year > 2019) {
      print("ERROR:  Please enter a single year (e.g., 2018) between the year range 2014 - 2019.")
    
  } else if (length(files) == 0) {
      print("ERROR:  Data for the given year not found. Download data using the download_cps() function.")
    
  } else {
    for (file_name in files) {
      
      print(paste0('>1 Reading CPS file ', file_name_short, ' into memory.'))
      
      cps_file <- if (year == 2014) {
          read.fwf(file_name, widths = widths_14, col.names = names_14)
      } else if (year == 2015) {
          read.fwf(file_name, widths = widths_15, col.names = names_15)
      } else if (year == 2016) {
          read.fwf(file_name, widths = widths_16, col.names = names_16)
      } else if (year == 2017) {
          read.fwf(file_name, widths = widths_17, col.names = names_17)
      } else if (year == 2018) {
          read.fwf(file_name, widths = widths_18, col.names = names_18)
      } else if (year == 2019) {
          read.fwf(file_name, widths = widths_19, col.names = names_19)
      }
      
      print(paste0('>>2 Determining column widths for ', file_name_short, '.'))
      
      print('>>>3 Assigning variable names to dataframe.')
      
      print(">>>>4 Writing .csv file to working directory.")
      
      write.csv(cps_file, paste0('data/', substr(file_name_short, 1, 8), ".csv"), row.names = FALSE)
    }
  }
}

if(exists("input_year")) {
  rm(list = "input_year")
}
