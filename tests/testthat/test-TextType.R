testthat::context("TextType")

testthat::test_that("we can create TextType from a simple character string", {

## using a simple character string
a <- set_TextType(text = "This is the abstract")
ab <- as(a, "abstract")
testthat::expect_is(ab, "abstract")

})

## Using an external markdown file
testthat::test_that("we can create TextType using an external markdown file", {
  
f <- system.file("examples/hf205-abstract.md", package = "EML")
a <- set_TextType(f)
ab <- as(a, "abstract")
testthat::expect_is(ab, "abstract")
})

testthat::test_that("we can create TextType in a .docx MS Word file.", {
f <- system.file("examples/hf205-abstract.docx", package = "EML")
a <- set_TextType(f)
ab <- as(a, "abstract")
testthat::expect_is(ab, "abstract")
})

testthat::test_that("Documents can have richer formatting.  Documents with title headings use `section` instead of `para` notation", {
f <- system.file("examples/hf205-methods.docx", package = "EML")
d <- set_TextType(f)
node <- as(d, "description")
testthat::expect_is(node, "description")


get_TextType(node, view = FALSE, output = tempfile())
})

