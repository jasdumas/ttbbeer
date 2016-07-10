#' The winetax2124 dataset
#' @description This dataset contains a list of historical tax rates for wine
#'  21 - 24% ABV per wine gallon from TTB.
#' @source \url{http://catalog.data.gov/dataset/historical-tax-rates}
#' @format A data frame with 11 observations of 3 variables:
#' \describe{
#'  \item{FROM}{FROM, date of starting tax rate}
#'  \item{TO}{TO, date of ending tax rate. The last row is considered the present day rate indicated by the package creation date.}
#'  \item{RATE}{RATE, in dollars}
#'  }
"winetax2124"
