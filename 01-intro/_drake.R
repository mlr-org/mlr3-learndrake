# Load packages, functions and plan --------------------------------------------

source("packages.R")

sourceDirectory("R")

# Combine plans ----------------------------------------------------------------

plan = bind_plans(learner_plan, task_plan, param_sets_plan, tuning_plan, train_plan)

# Set the config ---------------------------------------------------------------

drake_config(plan, verbose = 2)
