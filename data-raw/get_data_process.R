## R data package process

# --------- if I already have csv files: ----------- #

library(readr)

beermaterials <- read_csv("~/Desktop/R-directory/ttbbeer/data/materials_used_at_breweries_in_lbs.csv")

devtools::use_data(beermaterials) # creates .rda file in data/

devtools::use_build_ignore("get_data_process.R")  # ignore this file in the package build in .Rbuildignore

devtools::use_data_raw() # adds file to data-raw/


# --------- webscraping & other methods: ----------- #


