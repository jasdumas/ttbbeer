#' The beertax dataset
#' @description This dataset contains a list of historical tax rates for
#'  beer per 31 gallon Bbl. from TTB.
#' @source \url{http://catalog.data.gov/dataset/historical-tax-rates}
#' @format A data frame with 10 observations of 3 variables:
#' \describe{
#'  \item{FROM}{FROM, date of starting tax rate. The first date does not have a listed day, so 09/01/1862 is used.}
#'  \item{TO}{TO, date of ending tax rate. The last row is considered the present day rate indicated by the package creation date.}
#'  \item{RATE}{RATE, in dollars. The last two entries are originally '$9/$7' and '$18/$' respectively.}
#'  }
"beertax"
