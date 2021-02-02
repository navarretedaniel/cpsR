<!-- badges: start -->
[![R-CMD-check](https://github.com/navarretedaniel/cpsR/workflows/R-CMD-check/badge.svg)](https://github.com/navarretedaniel/cpsR/actions)
[![Build Status](https://www.travis-ci.com/navarretedaniel/cpsR.svg?branch=master)](https://www.travis-ci.com/navarretedaniel/cpsR)
<!-- badges: end -->

# cpsR
R scripts to download, parse, and save Census' Current Population Survey (CPS) microdata.

Download and parsing of CPS data is currently limited to survey years between 2014 - 2019.

The raw data files referenced in these scripts can be found on Census' CPS datasets site at:  https://www2.census.gov/programs-surveys/cps/datasets/

## Data download
Download CPS data for a given year and month using:
`cps_download(year, month)`

To download the January 2018 dataset, for example:
`cps_download(2018, 1)`

## Data parsing
Once your dataset(s) have been downloaded, parse through the .dat file and convert to .csv:
`cps_process(year)`

To parse through the January 2018 dataset, for example:
`cps_process(2018)`

### To Do:
Add functionality to parse through specific months (rather than all datasets for a given year).

# Credit
Credit to Jean Roth at the National Bureau for Economic Research (NBER) for making their SAS and SPSS code freely available. Years' column names and variable widths are based on the information made available by NBER.  To learn more about NBER and their data, please see https://www.nber.org/cps/.

# Contributing
Please feel free to offer suggestions, corrections, and contributions via the Issues feature and Pull requests.
