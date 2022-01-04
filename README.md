
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cowgillr

<!-- badges: start -->

[![R-CMD-check](https://github.com/MattCowgill/cowgillr/workflows/R-CMD-check/badge.svg)](https://github.com/MattCowgill/cowgillr/actions)
<!-- badges: end -->

cowgillr is a package that allows me to get set up in a new R install
quickly. It installs key packages and their dependencies, sets up
`Makevars` and `.Rprofile` the way I want them, installs fonts, and sets
RStudio light and dark themes.

cowgillr is not intended for use by anyone other than me.

## Installation

You can install the development version of cowgillr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MattCowgill/cowgillr")
```

## Set up an R install

``` r
library(cowgillr)
cowgill_setup()
```
