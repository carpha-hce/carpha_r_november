## Input data from various file types


## Spreadsheet example

library(readxl)

hospitals <- read_xlsx("data/HospitalData.xlsx")


## importing Stata format data

library(haven)

gss <- read_dta("data/GSS_2021_stata/GSS2021.dta")



### reading a .sav file
## read_sav is also in the haven package. No need to reload the package. 

newdrug <- read_sav("data/newdrug.sav")

### reading a shapefile 

library(sf)

ubn <- read_sf("data/Unmet-Basic-Needs-Shape-Files/unmet_basic_needs.shp")

library(ggplot2)

ggplot(data = ubn) + geom_sf()+ theme_bw()


df <- read_csv("")














