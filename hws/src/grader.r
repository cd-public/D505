library(caret)
library(tidyverse)


grader <- function(f) {
    fast <- readRDS(gzcon(url("https://github.com/cd-public/D505/raw/refs/heads/master/dat/secret.rds")))

    profit <- fast["Profit"]
    fast <- fast |> select(-Profit) |> f() |> select(1:10)
    fast["Profit"] = profit

    train(Profit ~ .,
        data = fast, 
        method = "lm",
        trControl = trainControl(method = "cv", number = 2))$results$RMSE
}