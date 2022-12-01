library(readxl)
library(tidyr)


hospitals <- read_xlsx("data/HospitalData.xlsx") |> 
  pivot_wider(names_from = age_group, values_from = cases)


hospitals_wider <- read_xlsx("data/HospitalData.xlsx") |>
  pivot_wider(names_from = hospital, values_from = cases)

?pivot_wider
