context ('tnorm')

test_that ('n', {
           expect_error (tnormn (), "n must be given")
           expect_error (tnormn (n='a'), "n must be numeric")
           expect_error (tnormn (n=0), "n must be positive")
})

test_that ('sd', {
           expect_error (tnormn (n=100), "sd must be given")
           expect_error (tnormn (n=100, sd='z'), "sd must be numeric")
           expect_error (tnormn (n=100, sd=0), "sd must be positive")
})

test_that ('all_good', {
               expect_silent (tnormn (n=100, sd=1))
})
