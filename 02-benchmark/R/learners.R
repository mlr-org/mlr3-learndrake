learners_plan = drake_plan(
  learner_names = c("classif.svm",
                    "classif.kknn"),

  learners = target(
    lrn(learner_names),
    dynamic = map(learner_names)
    )
)
