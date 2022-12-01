library(tidyverse)

cars2020 <- read_csv("data/cars2020.csv",
                     show_col_types = FALSE)

# getting the count of different transmission types in the data set
transmission_counts <- count(cars2020, transmission)


## Getting manual transmission cars only 
manual <- filter(cars2020, transmission == "Manual")


### How do we get all cars with 6 or more cyl?

cyl6plus <- filter(cars2020, cyl >= 6)

## Question: how many cars have manual transmissions and 6 or more cylinders

man6plus <- filter(cars2020, transmission == "Manual",
                   cyl >= 6)

temp <- filter(cars2020, transmission == "Manual")
man6alt <- filter(temp, cyl >= 6)


### Using select 

##  keep only the model, mpg, transmission and cyl columns?

cars_narrow <- select(cars2020, model, mpg, transmission, cyl)


## keep everything other than startStop and aspiration

cars_alt <- select(cars2020, -startStop, -aspiration)

## What if I wanted to remove startStop and aspiration and then filter down to
## only the automatic cars?

## 1 way
cars_temp <- select(cars2020, -startStop, -aspiration)
answer <- filter(cars_temp, transmission == "Automatic")

## other way
auto_narrow <- select(cars2020, -startStop, -aspiration) |>
  filter(transmission == "Automatic")


### Using arrange to sort data


### finding the least fuel-efficient vehicles
cars_sorted <- arrange(cars2020, mpg)

## can use arrange to sort on multiple variables

cars_transmission_sorted <- arrange(cars2020, transmission, desc(mpg))

cars_trans_sorted2 <- cars2020 |> 
  select(make, model, mpg, transmission) |>
  arrange(transmission, desc(mpg))

cars_experiment <- read_csv("data/cars2020.csv") |>
  select(make, model, mpg, transmission) |>
  arrange(transmission, desc(mpg))

## Using summarise to get summary statistics

report <- summarise(cars2020, num_cars = n(),
                    avg_mpg = mean(mpg))

grouped_cars <- group_by(cars2020, make) 
new_report <- summarise(grouped_cars, num_cars = n(),
          avg_mpg = mean(mpg))

report2 <- cars2020 |> group_by(make) |>
  summarise(num_cars = n(),
            avg_mpg = mean(mpg))

modified_cars <- read_csv("data/cars2020_modified.csv")

modified_report <- modified_cars |> 
  group_by(make) |>
  summarise(num_cars = n(),
            avg_mpg = mean(mpg, na.rm = TRUE))










  












































