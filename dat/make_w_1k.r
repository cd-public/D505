# make_w_1k.r
wine <- readRDS("wine.rds")
saveRDS(wine[sample(nrow(wine), 1000), ], "w_1k.rds")