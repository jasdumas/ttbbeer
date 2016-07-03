![](https://travis-ci.org/jasdumas/ttbbeer.svg?branch=master)

# ttbbeer

### An R data package of beer statistics from U.S. Department of the Treasury, Alcohol and Tobacco Tax and Trade Bureau (TTB)

This package provides the data for materials used at U.S. breweries as listed in the [Beer Monthly Statistical Releases](https://www.ttb.gov/beer/beer-stats.shtml). The motivation behind this package was to provide an analytic-ready data set as the original data is in PDF format which can be difficult to read in into R, given the small ecosystem of PDF parsing R packages such as: tm, and tabulizer. 

## Installation

To install the package type the following:

```r
install.packages("ttbbeer")
library("ttbbeer")
```

Or you can install the development version from Github:

```r
library(devtools)
install_github("jasdumas/ttbbeer")
library(ttbbeer)
```

## How to use this package?

The main and only components of the package is a data set called `beermaterials` with the materials used by U.S. breweries during beer production as reported on a monthly basis to the U.S. Department of the Treasury, Alcohol and Tobacco Tax and Trade Bureau (TTB). Several different types of data analysis project can be conducted by using this data such as: EDA, and time series analysis. The intended audience of this data is everyone but especially for those interested in open government data or beer analytics.

```r
data("beermaterials")
```

This project is released with a [Contributor Code of Conduct](https://github.com/jasdumas/ttbbeer/blob/master/CONDUCT.md). By participating in this project you agree to abide by its terms.

## Contact

Author: Jasmine Dumas [@jasdumas](https://twitter.com/jasdumas) | [jasdumas.github.io](http://jasdumas.github.io/)
