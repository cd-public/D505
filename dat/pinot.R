library(tidyverse)
wine <- readRDS(gzcon(url("https://cd-public.github.io/courses/rmls25/dat/wine.rds"))) %>% 
  filter(variety %in% c("Pinot Noir","Burgundy","Pinot Nero")) %>% 
  mutate(province = fct_lump(province,5)) %>% 
  mutate(province = as.character(province)) %>% 
  filter(province != "Other") %>% 
  select(province, price, points, year, taster_name, description) %>% 
  drop_na() %>% 
  mutate(province = str_replace_all(province, " ", "_")) 

as.data.frame(wine) %>% 
  write_rds("pinot_orig.rds")