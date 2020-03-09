report_plan <- drake_plan(
  benchmark_viz = render(knitr_in(here("Rmd/visualization-report.Rmd")),
    quiet = TRUE
  )
)
