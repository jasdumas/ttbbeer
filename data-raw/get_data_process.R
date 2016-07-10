## R data package process

# --------- if I already have csv files: ----------- #

library(readr)

beermaterials <- read_csv("~/Desktop/R-directory/ttbbeer/data/materials_used_at_breweries_in_lbs.csv")

devtools::use_data(beermaterials, overwrite = T) # creates .rda file in data/

devtools::use_build_ignore("get_data_process.R")  # ignore this file in the package build in .Rbuildignore

devtools::use_data_raw() # adds file to data-raw/


# --------- webscraping & other methods: ----------- #

library(rvest)

# distilled spirit historical tax rate
spirittax <- read_html("https://www.ttb.gov/tax_audit/94a01_4.shtml") %>%
             html_node("#table") %>%
             html_table(fill=T)
# change column names
colnames(spirittax) <- spirittax[3, ]

# remove missing columns
spirittax <- spirittax[-c(12:23, 25:30 ), ]

# remove the first 3 rows
spirittax <- spirittax[-c(1:3), ]

# fix last row
spirittax[15,] <- c("01/01/1991", "7/10/2016", 13.50)

# format FROM and TO columns with date
library(lubridate)

FROM <- mdy(spirittax[, "FROM"])
TO <- mdy(spirittax[, "TO"])

spirittax$FROM <- FROM
spirittax$TO <- TO

# fix RATE column to be numeric
spirittax$RATE <- as.numeric(spirittax$RATE)

# add to data/ folder then add to globalVariables.R
devtools::use_data(spirittax, overwrite = T) # creates .rda file in data/

# ------------------- #

# wine not over 14% ABV historical tax rate (government web developers put
#    the same id for all tables, sadface!)
alltables <- read_html("https://www.ttb.gov/tax_audit/94a01_4.shtml") %>%
             html_table(fill=T)
# ------------------- #
winetax14 <- as.data.frame(alltables[2])
colnames(winetax14) <- winetax14[3, ]
winetax14[14,] <- c("01/01/1991", "7/10/2016", 1.07)
winetax14 <- winetax14[-c(1:3),]
winetax14$FROM <- mdy(winetax14$FROM)
winetax14$TO <- mdy(winetax14$TO)
winetax14$RATE <- as.numeric(winetax14$RATE)
devtools::use_data(winetax14, overwrite = T)

# ------------------- #

winetax1421 <- as.data.frame(alltables[3])
colnames(winetax1421) <- winetax1421[3, ]
winetax1421[14,] <- c("01/01/1991", "7/10/2016", 1.57)
winetax1421 <- winetax1421[-c(1:3),]
winetax1421$FROM <- mdy(winetax1421$FROM)
winetax1421$TO <- mdy(winetax1421$TO)
winetax1421$RATE <- as.numeric(winetax1421$RATE)
devtools::use_data(winetax1421, overwrite = T)

# ------------------- #

winetax2124 <- as.data.frame(alltables[4])
colnames(winetax2124) <- winetax2124[3, ]
winetax2124[14,] <- c("01/01/1991", "7/10/2016", 3.15)
winetax2124 <- winetax2124[-c(1:3),]
winetax2124$FROM <- mdy(winetax2124$FROM)
winetax2124$TO <- mdy(winetax2124$TO)
winetax2124$RATE <- as.numeric(winetax2124$RATE)
devtools::use_data(winetax2124, overwrite = T)

# ------------------- #
# champagne or sparkling wine!
champagnetax <- as.data.frame(alltables[5])
colnames(champagnetax) <- champagnetax[3, ]
champagnetax[18, ] <- c("01/01/1955", "7/10/2016", 3.40)
champagnetax <- champagnetax[-c(1:5, 15:17), ]
champagnetax$FROM <- mdy(champagnetax$FROM)
champagnetax$TO <- mdy(champagnetax$TO)
champagnetax$RATE <- as.numeric(champagnetax$RATE)
devtools::use_data(champagnetax, overwrite = T)

# ------------------- #

artificialcarbontax <- as.data.frame(alltables[6])
colnames(artificialcarbontax) <- artificialcarbontax[3, ]
artificialcarbontax[17, ] <- c("01/01/1955", "7/10/2016", 3.30)
artificialcarbontax[8, ] <- c("06/26/1936", "06/30/1940", 0.0125)
artificialcarbontax <- artificialcarbontax[-c(1:4, 9, 15),]
artificialcarbontax$FROM <- mdy(artificialcarbontax$FROM)
artificialcarbontax$TO <- mdy(artificialcarbontax$TO)
artificialcarbontax$RATE <- as.numeric(artificialcarbontax$RATE)
devtools::use_data(artificialcarbontax, overwrite = T)

# ------------------- #

beertax <- as.data.frame(alltables[7])
colnames(beertax) <- beertax[3, ]
beertax[19, ] <- c("01/01/1991", "7/10/2016", 18)  # $18/$7
beertax[18, 3] <- 9  # $9/$7"
beertax <- beertax[-c(1:3), ]
beertax$FROM <- mdy(beertax$FROM)
beertax$TO <- mdy(beertax$TO)
beertax$RATE <- as.numeric(beertax$RATE)
beertax[1, 1] <- mdy("09/01/1862")
devtools::use_data(beertax, overwrite = T)

# ------------------- #
# tobacco and products

tobaccotax <- as.data.frame(alltables[8])
colnames(tobaccotax) <- tobaccotax[2,]
# fill in the blanks
tobaccotax[c(4:8), 1] <- "SMALL CIGARETTE"
tobaccotax[c(10:14), 1] <- "LARGE CIGARETTES"
tobaccotax[c(16:19), 1] <- "SMALL CIGARS"
tobaccotax[c(21:25), 1] <- "LARGE CIGARS"
tobaccotax[c(27:30), 1] <- "CHEWING TOBACCO"
tobaccotax[c(32:35), 1] <- "SNUFF"
tobaccotax[c(37:40), 1] <- "PIPE TOBACCO"
tobaccotax[42, 1] <- "Roll Your Own Tobacco"
tobaccotax[c(44:45), 1] <- "Cigarette Papers"
tobaccotax[c(47:48), 1] <- "Cigarette Tubes"
# fix some of the dates
tobaccotax[3, 2] <- "01/01/1951"  # originally "101/01/1951"
tobaccotax[15, 2] <- "01/01/1954" # originally "Prior to 1954
tobaccotax[8, 3] <- "03/31/2009"  # originally "103/31/2009"
tobaccotax[14, 3] <- "03/31/2009"  # originally "103/31/2009"
tobaccotax[19, 3] <- "03/31/2009"  # originally "103/31/2009"
tobaccotax[20, 2:3] <- "02/01/1977" # originally "Prior to 02/01/77"
tobaccotax[25, 3] <- "03/31/2009"  # originally "103/31/2009"
tobaccotax[42, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[43, 2] <- "01/01/1993" # originally 1993
tobaccotax[46, 2] <- "01/01/1993" # originally 1993
tobaccotax[42, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[40, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[45, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[48, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[30, 3] <- "03/31/2009" # originally "103/31/2009"
tobaccotax[35, 3] <- "03/31/2009"
# change date format
tobaccotax$FROM <- mdy(tobaccotax$FROM)
tobaccotax$TO <- mdy(tobaccotax$TO)

# extract out rate from column
library(stringr)
RATE <- str_extract(tobaccotax$RATE, "\\$[-0-9.,]+")
RATE <- gsub("\\$","", RATE)
RATE <- as.numeric(RATE)
tobaccotax$RATE <- RATE

# remove rows
tobaccotax <- tobaccotax[-c(1:2), ]
# save to data/ folder
devtools::use_data(tobaccotax)
