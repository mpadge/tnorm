context ('tnorm')

test_that ('n', {
           expect_error (n <- tnormn (), "n must be given")
           expect_error (n <- tnormn (n='a'), "n must be numeric")
           expect_error (n <- tnormn (n=0), "n must be positive")
})

test_that ('sd', {
           expect_error (n <- tnormn (n=100), "sd must be given")
           expect_error (n <- tnormn (n=100, sd='z'), "sd must be numeric")
           expect_error (n <- tnormn (n=100, sd=0), "sd must be positive")
})

test_that ('all_good', {
               expect_silent (n <- tnormn (n=100, sd=1))
})
