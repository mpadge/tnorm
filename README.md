[![Build Status](https://travis-ci.org/mpadge/tnorm.svg?branch=master)](https://travis-ci.org/mpadge/tnorm) [![codecov](https://codecov.io/gh/mpadge/tnorm/branch/master/graph/badge.svg)](https://codecov.io/gh/mpadge/tnorm)

tnorm
=====

This package exists merely as a faster replacement for the core functionality of other packages. It generates vectors of random values from a truncated normal distribution. This functionality already exists in both

1.  [msm::rtnorm](https://cran.r-project.org/package=msm), which is entirely R-based, and

2.  [truncnorm::rtruncnorm](https://cran.r-project.org/package=truncnorm), which has core code in C.

Even the latter of these is, however, slower than `tnorm` at generating random values. `tnorm` currently generates distributions centred around a mean value of 1, truncated to between 0 and 2. Values can be readily re-scaled to desired mean values and limits.

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
fns <- c ('tnormn', 
          get ('rtnorm', asNamespace ('msm'), mode='function'),
          get ('rtruncnorm', asNamespace ('truncnorm'), mode='function'))
n <- 1e5
mn <- sd <- 1
args <- list (list (n=n, sd=sd), 
              list (n=n, mean=mn, sd=sd, lower=0, upper=2),
              list (n=n, mean=mn, sd=sd, a=0, b=2))
st <- sapply (1:3, function (i) {
                  set.seed (1)
                  system.time (do.call (fns [[i]], args [[i]]))[1]
              })
st
```

    ## user.self user.self user.self 
    ##     0.012     0.332     0.044

And the speed-ups are

``` r
as.numeric (st [2] / st [1]); as.numeric (st [3] / st [1])
```

    ## [1] 27.66667

    ## [1] 3.666667

And `tnormn` is still several times faster than `rtruncnorm`.
