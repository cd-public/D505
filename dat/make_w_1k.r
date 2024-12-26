# make_w_1k.r

saveRDS(wine[sample(nrow(readRDS("wine.rds")), 1000), ], "w_1k.rds")