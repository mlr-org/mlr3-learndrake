tuning_plan = drake_plan(
  # AutoTuner = mlr::makeTunerWrapper()
  rf_tuned = target({
    AutoTuner$new(
      learner = learner_rf, # from learner.R
      resampling = rsmp("holdout"),
      measures = msr("classif.ce"),
      tune_ps = param_set_rf, # from param-sets.R
      terminator = term("evals", n_evals = 5), # tuning budget
      tuner = tnr("random_search")
    )
  })
)
