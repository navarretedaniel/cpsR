# cpsR
# cps_download
# Author:  Daniel Navarrete <https://github.com/navarretedaniel>
# 2019

# Introduction ---------------------------
#
# Create a function that will download CPS monthly microdata for a given year.
#
# Example:
#    cps_download(2018)

# Function ---------------------------

cps_download <- function(input_1){
  
  months <- c("jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec")
  
  output <- ifelse (input_1 == 2019,
                    for (month in months) {
                      file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201701-/", month, "19pub.zip")
                      tempCPS <- tempfile()
                      download.file(file, tempCPS, mode="wb")
                      unzip(zipfile = tempCPS)
                      print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                      
                    },  ifelse (input_1 == 2018,
                                for (month in months) {
                                  file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201701-/", month, "18pub.zip")
                                  tempCPS <- tempfile()
                                  download.file(file, tempCPS, mode="wb")
                                  unzip(zipfile = tempCPS)
                                  print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                  
                                },  ifelse (input_1 == 2017,
                                            for (month in months) {
                                              if (any(month == "jun" || month == "jul" || month == "aug" || month == "sep" || month == "oct" || month == "nov" || month == "dec")){
                                                file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201701-/", month, "17pub.zip")
                                                tempCPS <- tempfile()
                                                download.file(file, tempCPS, mode="wb")
                                                unzip(zipfile = tempCPS)
                                                print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                                
                                              } else {
                                                file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201501-/", month, "17pub.zip")
                                                tempCPS <- tempfile()
                                                download.file(file, tempCPS, mode="wb")
                                                unzip(zipfile = tempCPS)
                                                print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                              }
                                              
                                            },  ifelse (input_1 == 2016,
                                                        for (month in months) {
                                                          file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201501-/", month, "16pub.zip")
                                                          tempCPS <- tempfile()
                                                          download.file(file, tempCPS, mode="wb")
                                                          unzip(zipfile = tempCPS)
                                                          print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                                          
                                                        },  ifelse (input_1 == 2015,
                                                                    for (month in months) {
                                                                      file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201501-/", month, "15pub.zip")
                                                                      tempCPS <- tempfile()
                                                                      download.file(file, tempCPS, mode="wb")
                                                                      unzip(zipfile = tempCPS)
                                                                      print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                                                      
                                                                    },  ifelse(input_1 == 2014,
                                                                               for (month in months) {
                                                                                 file <- paste0("http://thedataweb.rm.census.gov/pub/cps/basic/201401-/", month, "14pub.zip")
                                                                                 tempCPS <- tempfile()
                                                                                 download.file(file, tempCPS, mode="wb")
                                                                                 unzip(zipfile = tempCPS)
                                                                                 print(paste0("Finished downloading and unzipping ", month, " ", input_1, " data."))
                                                                                 
                                                                               },  "ERROR:  Enter single year between 2014 - 2019 (e.g., 2018)."
                                                                    ))))))
  output
}