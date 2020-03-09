# installs dependencies, runs R CMD check, runs covr::codecov()

if (ci_has_env("LATEST")) {
  get_stage("install") %>%
    # for querying deps in Rmd files
    add_step(step_install_cran("rmarkdown")) %>%
    add_code_step(renv::hydrate())
} else {
  get_stage("install") %>%
    add_code_step(renv::restore())
}

get_stage("script") %>%
  add_code_step(setwd("01-intro")) %>%
  add_code_step(drake::r_make()) %>%
  add_code_step(setwd("../02-benchmark")) %>%
  add_code_step(drake::r_make())
