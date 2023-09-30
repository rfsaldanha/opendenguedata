test_that("read_data with extract national works", {
  res <- read_data(extract = "national", as_data_frame = FALSE, cache = FALSE)

  expect_equal(nrow(res), 31032)
})


test_that("read_data with extract spatial works", {
  res <- read_data(extract = "spatial", as_data_frame = FALSE, cache = FALSE)

  expect_equal(nrow(res), 2476894)
})

test_that("read_data with extract temporal works", {
  res <- read_data(extract = "temporal", as_data_frame = FALSE, cache = FALSE)

  expect_equal(nrow(res), 2484356)
})
