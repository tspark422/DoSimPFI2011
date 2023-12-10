
<!-- README.md is generated from README.Rmd. Please edit that file -->

# DoSimPFI2011

<!-- badges: start -->
<!-- badges: end -->

The goal of DoSimPFI2011 is to reproduce simulation section in
Parametric fractional imputation for missing data analysis (Kim,
[2011](https://doi.org/10.1093/biomet/asq073)).

## Installation

You can install the development version of DoSimPFI2011 from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("tspark422/DoSimPFI2011")
```

## Usage

You can change parameters in simulation if they are compatible. For
example, beta can be any vector if it is two-dimensional.  
$\eta_{1} = \mathit{E} \left( Y_{1} \right)$ This is a basic example
which shows you how to reproduce the simulation:

``` r
library(DoSimPFI2011)
## Simulation setting
n=200; beta=c(1, 0.7); sigma=1; phi=c(-3, 0.5, 0.7)
suppressWarnings({ 
 # result with fractional imputation method (method='FI')
 res_FI <- sim2011(n=n, beta=beta, sigma=sigma, phi=phi, M=100, max.iter=50, eps=1e-09, B=20, method='FI')
 
 # Obtain point estimator of eta1, variance of eta1 under incomplete data, variance of eta1 under complete data
 point_estimator_eta1 <- colMeans(res_FI$eta1)
 print(point_estimator_eta1)
 
  # result with calibration fractional imputation method (method='CFI')
 res_CFI <- sim2011(n=n, beta=beta, sigma=sigma, phi=phi, M=5, max.iter=50, eps=1e-09, B=20, method='CFI')
 
 # Obtain point estimator of eta2, variance of eta2 under incomplete data, variance of eta2 under complete data
 point_estimator_eta2 <- colMeans(res_CFI$eta2)
 print(point_estimator_eta2)
}) 
#> ℹ SHA-1 hash of file is "343099b74cec49239b107eca4246083f6f2d59c3"
#> ℹ SHA-1 hash of file is "8a8c6a8be122ca158f5f3a9988351cbdceb5e42d"
#> [1] 2.40374492 0.01015167 0.00765372
#> ℹ SHA-1 hash of file is "34595737875a2c3d799e42ddac78319cfae175ce"
#> ℹ SHA-1 hash of file is "8a8c6a8be122ca158f5f3a9988351cbdceb5e42d"
#> [1] 0.442510131 0.001560256 0.001235873
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
