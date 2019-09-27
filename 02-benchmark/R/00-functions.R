#' @title Combine mlr3 benchmark results
combine_benchmarks = function(...) {
  benchmarks = list(...)
  final_benchmark = benchmarks[[1]]$clone(deep = TRUE)
  for (i in tail(seq_along(benchmarks), -1)) {
    final_benchmark$combine(benchmarks[[i]])
  }
  return(final_benchmark)
}

#' @title Create a single mlr3 benchmark run including tuning
#' @description Creates an mlr3 learner which performs hyperparameter tuning in nested resampling
create_single_bm = function(learner, learner_id, task, measures,
  resampling_inner, resampling_outer, param_set, terminator) {

  set.seed(123456)

  learner = lrn(learner)
  learner$id = learner_id

  task = task
  measures = measures
  param_set = param_set
  terminator = terminator
  resampling_inner = resampling_inner

  # tuning
  at = AutoTuner$new(
    learner = learner,
    resampling = resampling_inner,
    measures = msr("classif.ce"),
    tune_ps = param_set,
    terminator = terminator,
    tuner = tnr("random_search") # hard coded in this example
  )

  resampling_outer = resampling_outer
  design = benchmark_grid(tasks = task, learners = list(at), resamplings = resampling_outer)
  bm = benchmark(design)
  return(bm)
}
