tuning_plan = drake_plan(
  # AutoTuner = mlr::makeTuneWrapper()
  rf_tuned = target({
    AutoTuner$new(
      learner = learner_rf, # from learner.R
      resampling = rsmp("holdout"),
      measure = msr("classif.ce"),
      search_space = search_space_rf, # from param-sets.R
      terminator = trm("evals", n_evals = 5), # tuning budget
      tuner = tnr("random_search")
    )
  })
)
