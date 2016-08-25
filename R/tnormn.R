#' tnormn
#'
#' Generates a truncated normal distribution
#'
#' @param n Number of truncated normally distributed observations to be
#' simulated
#' @param sd Standard deviation of truncated normal distribution
#' @param seed Random seed
#'
#' @return A vector of n truncated normally distributed values
#'
#' @examples
#' x <- tnormn (n=100, sd=0.1)
#'
#' @export
tnormn <- function (n, sd, seed)
{
    if (missing (n)) stop ('n must be given')
    if (!is.numeric (n)) stop ('n must be numeric')
    if (n <= 0.0) stop ('n must be positive')

    if (missing (sd)) stop ('sd must be given')
    if (!is.numeric (sd)) stop ('sd must be numeric')
    if (sd <= 0.0) stop ('sd must be positive')

    if (!missing (seed)) set.seed (seed)

    rcpp_trunc_ndist (n, sd)
}
