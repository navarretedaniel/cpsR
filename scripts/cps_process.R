# cpsR
# cps_process
# Author:  Daniel Navarrete <https://github.com/navarretedaniel>
# 2019

# Introduction -----------------------------------------------------------------
#
# For a given year, parse through the downloaded .dat files and array the 
# information into a dataframe based on the columns defined in cps_variables.
#
# Objects- ---------------------------------------------------------------------
# Define CPS Variables for each survey year.

# Define function.
cps_process <- function(input_1){
  input_year <<- as.character(substr(input_1, 3, 4))
  source("~/cps/scripts/cps_variables.R")
  files <- as.vector(list.files(pattern = "\\.dat$"))
  input <- paste0(input_year, "pub.dat$")
  
  # Create a list of files matching our CPS year.
  files <- list.files(pattern = input, full.names = TRUE)
  
  # Clean-up file name text.
  i = 1
  for (file_name in files){
    file_name <- gsub("./", "", file_name)
    files[i] <- file_name
    i = i+1
  }
  
  # Process CPS .dat file into CSV.
  output <- if(input_1 == 2014) {
    for (file_name in files) {
      
      print(paste0('>1 Reading CPS file "', file_name, '" into memory.'))
      
      cps_file <- read.fwf(file_name, widths = widths_14)
      
      print(paste0('>>2 Determining .dat column widths for "', file_name, '".'))
      
      names(cps_file) <- names_14
      
      print('>>>3 Assigning variable names to dataframe.')
      
      print(">>>>4 Writing .csv file to working directory.")
      
      write.csv(cps_file, paste0(substr(file_name, 1, 8), ".csv"), row.names = FALSE)
      
    }} else if (input_1 == 2015) {
      for (file_name in files){
        
        print(paste0('>1 Reading CPS file "', file_name, '" into memory.'))
        
        cps_file <- read.fwf(file_name, widths = widths_15)
        
        print(paste0('>>2 Determining .dat column widths for "', file_name, '".'))
        
        names(cps_file) <- names_15
        
        print('>>>3 Assigning variable names to dataframe.')
        
        print(">>>>4 Writing .csv file to working directory.")
        
        write.csv(cps_file, paste0(substr(file_name, 1, 8), ".csv"), row.names = FALSE)
        
      }} else if (input_1 == 2016) {
        
        for (file_name in files) {
          
          print(paste0('>1 Reading CPS file "', file_name, '" into memory.'))
          
          cps_file <- read.fwf(file_name, widths = widths_16)
          
          print(paste0('>>2 Determining .dat column widths for "', file_name, '".'))
          
          names(cps_file) <- names_16
          
          print('>>>3 Assigning variable names to dataframe.')
          
          print(">>>>4 Writing .csv file to working directory.")
          
          write.csv(cps_file, paste0(substr(file_name, 1, 8), ".csv"), row.names = FALSE)
          
        }} else if (input_1 == 2017) {
          
          for (file_name in files) {
            
            print(paste0('>1 Reading CPS file "', file_name, '" into memory.'))
            
            cps_file <- read.fwf(file_name, widths = widths_17)
            
            print(paste0('>>2 Determining .dat column widths for "', file_name, '".'))
            
            names(cps_file) <- names_17
            
            print('>>>3 Assigning variable names to dataframe.')
            
            print(">>>>4 Writing .csv file to working directory.")
            
            write.csv(cps_file, paste0(substr(file_name, 1, 8), ".csv"), row.names = FALSE)
            
          }} else if (input_1 == 2018) {
            
            for (file_name in files) {
              
              print(paste0('>1 Reading CPS file "', file_name, '" into memory.'))
              
              cps_file <- read.fwf(file_name, widths = widths_18)
              
              print(paste0('>>2 Determining .dat column widths for "', file_name, '".'))
              
              names(cps_file) <- names_18
              
              print('>>>3 Assigning variable names to dataframe.')
              
              print(">>>>4 Writing .csv file to working directory.")
              
              write.csv(cps_file, paste0(substr(file_name, 1, 8), ".csv"), row.names = FALSE)
              
            }} else {
              print("ERROR:  Please enter a single year (e.g., 2018) between the year range 2014 - 2019.")
            }
}


if(exists("input_year")) {
  rm(list = "input_year")
}
