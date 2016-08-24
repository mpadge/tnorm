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

    std::vector <double> z;
    z.resize (0);
    while (z.size () < len)
    {
        eps = Rcpp::rnorm (len, 1.0, sd);
        for (Rcpp::NumericVector::iterator it = eps.begin ();
                it != eps.end (); ++it)
            if (*it >= 0.0 && *it <= 2.0)
                z.push_back (*it);
    }
    z.resize (len);

    std::copy (z.begin (), z.end (), eps.begin ());
    z.resize (0);

    return eps;
}
