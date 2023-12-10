#Check that an error message shows for un-existed country input for x.
test_that('Unexisted Country input x', {
  expect_error(CountryPopulation("ABC") )
})
