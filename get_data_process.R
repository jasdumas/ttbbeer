### R data package process

# 1 - find interesting data: https://www.ttb.gov/beer/beer-stats.shtml

# 2 - see if it already exist on CRAN or the internet

# 3 - decide on a package name and make sure it does not
#     already exist on CRAN or on data.gov
#     (https://catalog.data.gov/dataset?q=beer&sort=score+desc%2C+name+asc)

# 4 - start package project in RStudio

# 5 - determine process of retriving the data into a tidy format and
#     make sure that it complies with terms of service

# 6 - do it!

#####

install.packages("pdftools")
library(pdftools)
download.file("https://www.ttb.gov/statistics/2015/201501beer-rev.pdf",
              "201501beer-rev.pdf", mode = "wb")
txt <- pdf_text("201501beer-rev.pdf")

cat(txt[[1]])

#########
library(devtools)
if(!require("ghit")){
  install.packages("ghit")
}
ghit::install_github(c("leeper/tabulizerjars", "leeper/tabulizer"), type = "source", contriburl = contrib)


install.packages("rJava")

ghit::install_github(c("leeper/tabulizerjars", "leeper/tabulizer"), INSTALL_opts = "--no-multiarch", dependencies = c("Depends", "Imports"))
