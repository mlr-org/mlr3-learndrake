report_plan = drake_plan(
  benchmark_viz = render(knitr_in("visualization-report.Rmd"), quiet = TRUE)
)
