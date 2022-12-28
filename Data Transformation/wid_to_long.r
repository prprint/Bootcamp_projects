#library (tidyr)
library(tidyverse)
url <- "https://gist.githubusercontent.com/toyeiei/d9e267754d0b7a7045e182b3d0011636/raw/04cf2d5b211dc3df279b36d968fde11ed1c9bb67/worldphone.csv"

#read data
wp <- read_csv(url)

#transform from wide to long format for data analysis
wp %>%
  gather(N.Amer:Mid.Amer, key = "region", value = "sale")

long_wp <- wp %>%
  pivot_longer(-Year, names_to = "region",
               values_to = "sale")
#transform from long to wide format for do report
long_wp %>%
  pivot_wider(names_from = "region",
               values_from = "sale")

#read JSON 
url <- "https://gist.githubusercontent.com/toyeiei/df5e729c0bbe111318530f254d90546e/raw/22fd0ea0780215b8fe08a5c1daa52998f2fe9afb/employees_for_R.json"
library(jsonlite)

fromJSON(url)
emp_list <- url %>% fromJSON()
#emp_list$Name 
#"Rick"     "Dan"      "Michelle" "Ryan"     "Gary"     "Nina"    
#"Simon"    "Guru"
emp_list <- url %>% fromJSON()
  emp_df <- data.frame(emp_list)
  
  
  # myPlaylist <- list(Album = c("A","B","C"),Artist = c("Palmy","1975","LAUV"))
  # > myPlaylist
  # $Album
  # [1] "A" "B" "C"
  # 
  # $Artist
  # [1] "Palmy" "1975"  "LAUV"
  #toJSON(myPlaylist)
  
  
