#' tnorm
#'
#' Generates truncated normal distributions. Current best R method is
#' \code{msm::rtnorm}, but this is entirely R-based and therefore s l o w.
#' \code{trunc-norm} is \code{Rcpp}-based and much faster.
#'
#' @section Functions:
#' \tabular{ll}{
#' \code{tnormn}\tab The sole function; used to generate truncated normal
#' distributions
#' }
#'
#' @name tnorm
#' @docType package
#' @importFrom Rcpp evalCpp
#' @importFrom truncnorm rtruncnorm
#' @useDynLib tnorm
NULL
