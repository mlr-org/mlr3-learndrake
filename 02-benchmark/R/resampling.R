resampling_plan <- drake_plan(
  resamplings = target(
    list(resampling_inner, resampling_outer)
  ),

  resampling_inner = target({
    rsmp("cv", folds = 5)
  }),

  resampling_outer = target({
    rsmp("repeated_cv", folds = 2, repeats = 1)
  })
)
