param_sets_plan = drake_plan(
  search_space_rf = target(
    ParamSet$new(params = list(
      ParamInt$new("mtry", lower = 1, upper = 5), # random choice
      ParamInt$new("num.trees", lower = 100, upper = 300) # random choice
    ))
  )
)
