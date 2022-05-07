# mlr3-learndrake

# DEPRECATED - please see https://github.com/mlr-org/mlr3-targets

<!-- badges: start -->
![fixed](https://github.com/mlr-org/mlr3-learndrake/workflows/fixed/badge.svg)
![latest](https://github.com/mlr-org/mlr3-learndrake/workflows/latest/badge.svg)
<!-- badges: end -->

The goal of mlr3-learndrake is to show how to use the [mlr3](https://github.com/mlr-org/mlr3) package framework in combination with the workflow package [drake](https://github.com/ropensci/drake).

## Usage

To clone this course, excecute the following code locally

```r
usethis::use_course("mlr-org/mlr3-learndrake")
```

To install a **fixed snapshot** of the required R packages call

```r
renv::restore()
```

To install the **latest** versions of the required R packages call

```r
renv::hydrate()
```

After installing the dependencies, open the examples:

```r
rstudioapi::openProject("01-intro", newSession = TRUE)
rstudioapi::openProject("02-benchmark", newSession = TRUE)
```

and call `drake::r_make()` to run the complete project:

- This will build all R objects (or "targets" in drake's DSL) in the correct order.
- You can visualize the project dependency structure via `r_vis_drake_graph()`.
- To load specific R objects into the global environment, call `drake::loadd(<object name>)`.

See the [drake manual](https://books.ropensci.org/drake/) for more information on {drake}.

## Examples

**01-intro**: Hyperparameter tuning and training of a Random Forest classifier on the "iris" dataset

**02-benchmark**: Benchmark analysis of multiple learners using different hyperarameter ranges on the "iris" and "spam" dataset

## Slides

[drake](https://rawcdn.githack.com/mlr-org/mlr3-learndrake/c46dda78d2e4177a1e458c218056c3d00ec55407/slides/drake/index.html)  <img src="https://docs.ropensci.org/drake/reference/figures/logo.svg" alt="logo" height = "15">

[mlr3](https://github.com/mlr-org/mlr-outreach/blob/master/2019_whyr_warsaw/slides.pdf) 
<img src="https://raw.githubusercontent.com/mlr-org/mlr/master/man/figures/logo.png" alt="logo" height="10">

# Other _drake_ learning resources

- [presentations](https://ropenscilabs.github.io/drake-manual/index.html#presentations)
- [drake-examples](https://github.com/wlandau/drake-examples)
- [learndrake](https://github.com/wlandau/learndrake)
- [real-world use cases](https://github.com/ropensci/drake#use-cases)

# Acknowledgements

- [Will Landau](https://github.com/wlandau) for developing and maintaing _drake_ in an awesome way
- [Garrick Aden-Buie](https://github.com/gadenbuie) for the great slides about _drake_
- [The mlr3 team](https://github.com/mlr-org/mlr3) for developing the mlr3 package framework
