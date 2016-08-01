![](https://travis-ci.org/jasdumas/ttbbeer.svg?branch=master) 

# ttbbeer

### An R data package of beer statistics from U.S. Department of the Treasury, Alcohol and Tobacco Tax and Trade Bureau (TTB)

This package provides the **one** data set for materials used at U.S. breweries as listed in the [Beer Monthly Statistical Releases](https://www.ttb.gov/beer/beer-stats.shtml), and **eight** data sets for [historical tax rates](https://www.ttb.gov/tax_audit/94a01_4.shtml) of distilled spirits, wine, beer, champagne, and tobacco. 

The motivation behind this package was to provide analysis-ready data sets as the original data for the `beermaterials` is in PDF format which can be difficult to read into R, given the small ecosystem of PDF parsing R packages such as: `tm`, and `tabulizer`. Other goals of this package are to provide more data sets to the R ecosystem for beer analytics from *open government data portals*.

## How to install this package?

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

The components of the package are a data set called `beermaterials` which includes the materials used by U.S. breweries during beer production as reported on a monthly basis to the U.S. Department of the Treasury, Alcohol and Tobacco Tax and Trade Bureau (TTB) from 2006 to 2015. The other components of this package include **eight data sets** depicting the historical tax rate of distilled spirits, wine, beer, champagne, and tobacco. 

Several different types of data analysis projects can be conducted by using this data such as: **Exploratory Data Analysis**, and **Time Series Analysis**. The intended audience of this data is everyone but especially for those interested in open government data or beer analytics.

```r
data("beermaterials")
data("artificialcarbontax")
data("champagnetax")
data("spirittax")
data("winetax14")
data("winetax1421")
data("winetax2124")
data("beertax")
data("tobaccotax")
```

This project is released with a [Contributor Code of Conduct](https://github.com/jasdumas/ttbbeer/blob/master/CONDUCT.md). By participating in this project you agree to abide by its terms.

## Contact

Package Author: Jasmine Dumas [@jasdumas](https://twitter.com/jasdumas) | [jasdumas.github.io](http://jasdumas.github.io/) | [Package Wiki](https://github.com/jasdumas/ttbbeer/wiki)
