test_that("write_targets_scripts creates _targets.R file", {
  expect_true(
    {
      withr::with_tempdir({
        write_targets_script()
        fs::file_exists('_targets.R')
      })
    }, TRUE)
})

test_that("write_r_profile creates .Rprofile file", {
  expect_true(
    {
      withr::with_tempdir({
        write_r_profile()
        fs::file_exists('.Rprofile')
      })
    }, TRUE)
})
