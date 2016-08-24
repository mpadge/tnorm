[![Build Status](https://travis-ci.org/mpadge/truncnorm?branch=master)](https://travis-ci.org/mpadge/truncnorm) [![codecov](https://codecov.io/gh/mpadge/truncnorm/branch/master/graph/badge.svg)](https://codecov.io/gh/mpadge/truncnorm)

truncnorm
=========

There are a few ways to generate truncated normal distribution in `R`, but these are **s l o w**. `truncnorm` is simply faster. Currently generates distributions centred around a mean value of 1, truncated to between 0 and 2. Values can be readily re-scaled to desired mean values and limits.

------------------------------------------------------------------------

Install
-------

``` r
devtools::install_github ('mpadge/truncnorm')
```

------------------------------------------------------------------------

Use
---

The one and only function

``` r
z <- tnorm (n=1e5, sd=1)
```

Compare timing with `msm::rtnorm`
---------------------------------

``` r
set.seed (1); 
st1 <- system.time (z <- tnorm (n=1e5, sd=1))
```

Compare with `msm::rtnorm`:

``` r
set.seed (1); 
st2 <- system.time (z <- msm::rtnorm (n=1e5, mean=1, sd=1, lower=0, upper=2))
st1; st2
```

    ##    user  system elapsed 
    ##   0.016   0.000   0.015

    ##    user  system elapsed 
    ##   1.180   0.016   1.195

And the speed-up is

``` r
as.numeric (st2 [3] / st1 [3])
```

    ## [1] 79.66667
