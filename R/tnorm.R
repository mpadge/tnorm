#' tnorm
#'
#' Generates a truncated normal distribution
#'
#' @param n Number of truncated normally distributed observations to be
#' simulated
#' @param sd Standard deviation of truncated normal distribution
#' @param method Select method for generation
#' @param seed Random seed
#'
#' @return A vector of n truncated normally distributed values
#'
#' @examples
#' x <- tnorm (n=100, sd=0.1)
#'
#' @export
tnorm <- function (n=100, sd=0.1, method=1, seed)
{
    if (missing (n)) stop ('n must be given')

    if (sd <= 0.0) stop ('sd must be positive')

    if (!missing (seed)) set.seed (seed)

    if (method == 1)
        rcpp_trunc_ndist (n, sd)
    else
        rcpp_trunc_ndist2 (n, sd)
}
