% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sim2011.R
\name{sim2011}
\alias{sim2011}
\title{Reproduce the simulation in the paper}
\usage{
sim2011(
  n,
  beta,
  sigma,
  phi,
  M = 100,
  max.iter = 50,
  eps = 1e-09,
  B = 2000,
  method = c("FI", "CFI")
)
}
\arguments{
\item{n}{The number of observations (should be positive integer)}

\item{beta}{A 2-dimensional vector in the mean of conditional distribution of Y1 given X}

\item{sigma}{The standard deviation of conditional distribution of Y1 given X}

\item{phi}{A 3-dimensional vector included in the parameter of Y2 given X and Y1}

\item{M}{The number of imputed value (should be positive integer)}

\item{max.iter}{The maximum number of iteration for EM algorithm (should be positive integer)}

\item{eps}{The convergence criteria in EM algorithm}

\item{method}{Method for imputation. It should be "FI"(fractional imputation) or "CFI"(calibration fractional imputation)}
}
\value{
List of 4 matrices with size B by 3. Each matrix is the result of eta1 to eta4. Each row represent the result in each bootstrap process. Columns represent point estimator, variance estimator under incomplete data, and variance estimator under complete data, respectively.
}
\description{
Reproduce the simulation in the paper
}
\examples{
# Implement fractional imputation
res_FI <- sim2011(n=200, beta=c(1, 2.1), sigma=1, phi=c(-3, 0.5, 0.7), M=5, B=1000, method="FI")
# Implement fractional imputation
res_CFI <- sim2011(n=200, beta=c(1, 2.1), sigma=1, phi=c(-3, 0.5, 0.7), M=5, B=1000, method="CFI")
}
