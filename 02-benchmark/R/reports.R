report_plan = drake_plan(
  benchmark_viz = render(knitr_in("Rmd/visualization-report.Rmd"), quiet = TRUE)
)
