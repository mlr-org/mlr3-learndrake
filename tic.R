# installs dependencies, runs R CMD check, runs covr::codecov()
get_stage("install") %>%
  add_step(step_install_deps())

get_stage("script") %>%
  add_code_step(setwd("01-intro")) %>%
  add_code_step(drake::r_make()) %>%
  add_code_step(setwd("../02-benchmark")) %>%
  add_code_step(drake::r_make())
