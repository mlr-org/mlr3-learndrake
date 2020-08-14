### alternatively: automate "pretty" learner id creation (remove the
### "learner_id" column of the tribble() above if you want to try this)
# %>% dplyr::rowwise() %>% # string extraction won't work otherwise
# %>% mutate(learner_id = paste0(
#   toupper(str_split_fixed(learner, "[.]", n = 2)[2]),
#   "-",
#   paste0("PS", str_extract(param_set, "(\\d)+")),
#   "-",
#   task)
# )

benchmark_plan <- drake_plan(
  benchmark_grid = target(tibble::tribble(

    # write learner/ParamSet grid
    ~learner, ~learner_id,
    "classif.svm", "SVM-PS1",
    "classif.svm", "SVM-PS2",
    "classif.kknn", "KNN-PS1",
    "classif.kknn", "KNN-PS2"
  ) %>%
    dplyr::mutate(search_space = search_space_list) %>%
    tidyr::crossing(task = c("iris", "spam"))),

  bm = target(

    create_single_bm(
      learner = benchmark_grid$learner,
      learner_id = benchmark_grid$learner_id,
      task = benchmark_grid$task,
      measure = measure,
      search_space = benchmark_grid$search_space[[1]],
      resampling_inner = resampling_inner,
      resampling_outer = resampling_outer,
      terminator = terminator
    ),
    dynamic = map(benchmark_grid)
  ),

  # combine benchmark results (all)
  bm_agg = target(
   do.call(c, bm)
  ),
  #
  # # combine BMR by tasks
  # # from R/model-functions.R
  # agg_task = target(
  #   combine_benchmarks(bm),
  #   transform = combine(bm, .by = task)
  # )
)
