context("encodings")

test_that("String encodings", {
  strings <- c(
    "Zürich",
    "北京填鴨们",
    "ผัดไทย",
    "寿司",
    rawToChar(as.raw(1:40)),
    "?foo&bar=baz!bla\n"
  )
  obj_utf8 <- structure(as.list(enc2utf8(strings)), names = letters[seq_along(strings)])

  # Test all UTF-8 strings
  expect_equal(ocpu_post_multipart('/library/base/R/list', obj_utf8), obj_utf8)
  expect_equal(ocpu_post_encoded('/library/base/R/list', obj_utf8), obj_utf8)
  expect_equal(ocpu_post_json('/library/base/R/list', obj_utf8), obj_utf8)
  expect_equal(ocpu_post_rds('/library/base/R/list', obj_utf8), obj_utf8)
  expect_equal(ocpu_post_pb('/library/base/R/list', obj_utf8), obj_utf8)

  # Test all native strings (usualy only on Windows)
  #obj_native <- structure(as.list(enc2native(strings)), names = letters[seq_along(strings)])
  #expect_equal(ocpu_post_multipart('/library/base/R/list', obj_native), obj_utf8)
  #expect_equal(ocpu_post_encoded('/library/base/R/list', obj_native), obj_utf8)
  #expect_equal(ocpu_post_json('/library/base/R/list', obj_native), obj_utf8)
  #expect_equal(ocpu_post_rds('/library/base/R/list', obj_native), obj_utf8)
  #expect_equal(ocpu_post_pb('/library/base/R/list', obj_native), obj_utf8)
})