
# mlr3-learndrake

<!-- badges: start -->
<!-- badges: end -->

The goal of mlr3-learndrake is to show how to use the [mlr3](https://github.com/mlr-org/mlr3) package framework in combination with the workflow package [drake](https://github.com/ropensci/drake).

## Usage

To clone this course, excecute the following code locally

```r
usethis::use_course("mlr-org/mlr3-learndrake")
```

To make sure you have installed all required packages, call

```r
devtools::install_dev_deps()
```

To open the respective example projects, call one of the following

```r
rstudioapi::openProject("01-intro", newSession = TRUE)
rstudioapi::openProject("02-benchmark", newSession = TRUE)
rstudioapi::openProject("03-pipelines", newSession = TRUE)
```

## Slides

mlr3: `utils::browseURL(here::here("slides/mlr3/whyr2019_mlr3.html"))`
