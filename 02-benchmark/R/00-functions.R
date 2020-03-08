#' @title Create a single mlr3 benchmark run including tuning
#' @description Creates an mlr3 learner which performs hyperparameter tuning in nested resampling
create_single_bm <- function(learner,
                             learner_id,
                             task,
                             measures,
                             resampling_inner,
                             resampling_outer,
                             param_set,
                             terminator) {

  learner <- lrn(learner)
  learner$id <- learner_id

  # tuning
  at <- AutoTuner$new(
    learner = learner,
    resampling = resampling_inner,
    measures = msr("classif.ce"),
    tune_ps = rlang::eval_tidy(param_set),
    terminator = terminator,
    tuner = tnr("random_search") # hard coded in this example
  )

  resampling_outer <- resampling_outer

  design <- benchmark_grid(
    tasks = tsk(task), learners = list(at),
    resamplings = resampling_outer
  )
  bm <- benchmark(design)
  return(bm)
}
