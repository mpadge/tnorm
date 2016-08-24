#include <Rcpp.h>
#include "tnorm.h"

//' rcpp_trunc_ndist
//'
//' Truncated normal distribution (mean 1, respective upper and lower limits of
//' 0 and 2).
//'
//' @param len Number of elements to be simulated
//' @param sd Standard deviation
//'
//' @return A vector of truncated normally distributed values
//'
// [[Rcpp::export]]
Rcpp::NumericVector rcpp_trunc_ndist (int len, double sd)
{
    double tempd;

    // Set up truncated normal distribution
    Rcpp::NumericVector eps (len);
    eps = Rcpp::rnorm (len, 1.0, sd);
    // TODO: Check timing with simple explicit loop instead of any
    while (Rcpp::is_true (Rcpp::any (eps <= 0.0)))
    {
        tempd = Rcpp::rnorm (1, 1.0, sd) (0);
        if (tempd >= 0.0 && tempd <= 2.0)
            eps (Rcpp::which_min (eps)) = tempd;
    }
    while (Rcpp::is_true (Rcpp::any (eps >= 2.0)))
    {
        tempd = Rcpp::rnorm (1, 1.0, sd) (0);
        if (tempd >= 0.0 && tempd <= 2.0)
            eps (Rcpp::which_min (eps)) = tempd;
    }

    return eps;
}
