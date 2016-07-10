#' The champagnetax dataset
#' @description This dataset contains a list of historical tax rates for
#'  champagne or sparkling wine per wine gallon from TTB.
#' @source \url{http://catalog.data.gov/dataset/historical-tax-rates}
#' @format A data frame with 10 observations of 3 variables:
#' \describe{
#'  \item{FROM}{FROM, date of starting tax rate}
#'  \item{TO}{TO, date of ending tax rate. The last row is considered the present day rate indicated by the package creation date.}
#'  \item{RATE}{RATE, in dollars}
#'  }
"champagnetax"
