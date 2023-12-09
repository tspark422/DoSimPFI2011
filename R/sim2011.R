#' Reproduce the simulation in the paper
#'
#' @param n The number of observations (should be positive integer)
#' @param beta A 2-dimensional vector in the mean of conditional distribution of Y1 given X
#' @param sigma The standard deviation of conditional distribution of Y1 given X
#' @param phi A 3-dimensional vector included in the parameter of Y2 given X and Y1
#' @param M The number of imputed value (should be positive integer)
#' @param max.iter The maximum number of iteration for EM algorithm (should be positive integer)
#' @param eps The convergence criteria in EM algorithm
#' @param method Method for imputation. It should be "FI"(fractional imputation) or "CFI"(calibration fractional imputation)
#'
#' @return List of 4 matrices with size B by 3. Each matrix is the result of eta1 to eta4. Each row represent the result in each bootstrap process. Columns represent point estimator, variance estimator under incomplete data, and variance estimator under complete data, respectively.
#' @export
#'
#' @examples # Implement fractional imputation
#' res_FI <- sim2011(n=200, beta=c(1, 2.1), sigma=1, phi=c(-3, 0.5, 0.7), M=5, B=1000, method="FI")
#' # Implement fractional imputation
#' res_CFI <- sim2011(n=200, beta=c(1, 2.1), sigma=1, phi=c(-3, 0.5, 0.7), M=5, B=1000, method="CFI")
sim2011 <- function(n, beta, sigma, phi, M=100, max.iter=50, eps=1e-09, B=2000, method=c("FI", "CFI")){
  # Check n
  if (n<=0 | n%%1!=0) stop("The number of observations, n, should be positive integer")

  # Check beta
  if (length(beta)!=2) stop("beta should be 2-dimensional vector")

  # Check sigma
  if (sigma<=0) stop("sigma should be positive")

  # Check phi
  if (length(phi)!=3) stop("phi should be 3-dimensional vector")

  # Check M
  if (M<=0 | M%%1!=0) stop("The number of imputed value, M, should be positive integer")

  # Check max.iter
  if (max.iter<=0 | max.iter%%1!=0) stop("The maximum number of iteration for EM algorithm, max.iter, should be positive integer")

  # Check eps
  if (eps <= 0) stop("The convergence criteria in EM algorithm, eps, should be positive")

  # Check B
  if (B<=0 | B%%1!=0) stop("The number of bootstrap process, B, should be positive integer")

  # Check method
  if (method=="FI"){
    devtools::source_url("https://github.com/tspark422/DoSimPFI2011/blob/main/R/myPFI.R?raw=TRUE")
    res <- myPFI(n=n, beta=beta, sigma=sigma, phi=phi, M=M, max.iter=max.iter, eps=eps, B=B)
  } else if (method=="CFI"){
    devtools::source_url("https://github.com/tspark422/DoSimPFI2011/blob/main/R/myPCFI.R?raw=TRUE")
    res <- myPCFI(n=n, beta=beta, sigma=sigma, phi=phi, M=M, max.iter=max.iter, eps=eps, B=B)
  } else {
    stop("method should be 'FI' or 'CFI'")
  }

  return(res)
}
