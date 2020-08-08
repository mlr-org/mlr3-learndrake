tuning_plan = drake_plan(
  # AutoTuner = mlr::makeTunerWrapper()
  rf_tuned = target({
    AutoTuner$new(
      learner = learner_rf, # from learner.R
      resampling = rsmp("holdout"),
      measure = msr("classif.ce"),
      search_space = param_set_rf, # from param-sets.R
      terminator = trm("evals", n_evals = 5), # tuning budget
      tuner = tnr("random_search")
    )
  })
)
