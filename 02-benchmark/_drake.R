# Load packages, functions and plan --------------------------------------------

source("packages.R")

sourceDirectory("R")

# set mlr3 options globally: suppress progress output of `benchmark()`
#lgr::get_logger("mlr3")$set_threshold("warn")

# Create plans -----------------------------------------------------------------

plan = bind_plans(
  param_sets_plan,
  resampling_plan,
  tuning_plan,
  learners_plan,
  measures_plan,
  benchmark_plan#,
  #report_plan
  )

# Set the config ---------------------------------------------------------------

drake_config(plan, verbose = 3, lock_envir = FALSE,
  #targets = "benchmark_grid",
  # internal parallelization
  prework = quote(future::plan(future.callr::callr, workers = 4)),
  # logging
  log_make = here::here("log/drake.log"))
