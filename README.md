[![Build
Status](https://travis-ci.org/mpadge/tnorm.svg?branch=master)](https://travis-ci.org/mpadge/tnorm)
[![codecov](https://codecov.io/gh/mpadge/tnorm/branch/master/graph/badge.svg)](https://codecov.io/gh/mpadge/tnorm)

tnorm
=====

`tnorm` is an R package for generating random samples from truncated
normal distributions. It exists solely as a faster replacement for the
core functionality of other packages, and it useful in simulation
contexts where speed is important and samples from truncated normal
distributions are required. This functionality already exists in both

1.  [msm::rtnorm](https://cran.r-project.org/package=msm), which is
    entirely R-based, and

2.  [truncnorm::rtruncnorm](https://cran.r-project.org/package=truncnorm),
    which has core code in C.

Even the latter of these is, however, slower than `tnorm` at generating
random values. `tnorm` currently generates distributions centred around
a mean value of 1, truncated to between 0 and 2. Values can be readily
re-scaled to desired mean values and limits.

------------------------------------------------------------------------

Install
-------

``` r
devtools::install_github ('mpadge/tnorm')
```

------------------------------------------------------------------------

Use
---

The one and only function

``` r
z <- tnormn (n=1e5, sd=1)
```

Compare timing with `msm::rtnorm` and `truncnorm::rtruncnorm`
-------------------------------------------------------------

``` r
library (rbenchmark)
n <- 1e6
mn <- sd <- 1
benchmark (
           tnorm::tnormn (n = n, sd = sd),
           msm::rtnorm (n = n, mean = mn, sd = sd, lower = 0, upper = 2),
           truncnorm::rtruncnorm (n = n, sd = sd, a = 0, b = 2),
           replications = 10,
           order = "relative") [, 1:4]
```

    ##                                                           test replications
    ## 1                                tnorm::tnormn(n = n, sd = sd)           10
    ## 3          truncnorm::rtruncnorm(n = n, sd = sd, a = 0, b = 2)           10
    ## 2 msm::rtnorm(n = n, mean = mn, sd = sd, lower = 0, upper = 2)           10
    ##   elapsed relative
    ## 1   0.753    1.000
    ## 3   1.299    1.725
    ## 2   5.595    7.430

And `tnormn` is still several times faster than `rtruncnorm`.
