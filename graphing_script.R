library(ggplot2)
penguins <- read.csv("data/penguins.csv")


plot1 <- ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                     y = flipper_length_mm)) +
  geom_point()


plot2 <- ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                     y = flipper_length_mm,
                     color = species)) + 
  geom_point()

plot3 <- ggplot(data = penguins,
                mapping = aes(x = bill_depth_mm, 
                              y = flipper_length_mm,
                              shape = species)) +
  geom_point()

species_cols = c("Adelie" = "blue", 
              "Chinstrap" = "red",
              "Gentoo" = "green")

ggplot(data = penguins,
       mapping = aes(x = bill_depth_mm,
                     y = flipper_length_mm,
                     color = species,
                     shape = sex)) + 
  geom_point() + 
  scale_color_manual(values = species_cols) + 
  theme_minimal() + 
  #theme(legend.position = "bottom") + 
  labs(title = "Relationship between flipper length and body mass",
       subtitle = "Data collected on Antarctic penguins",
       x = "bill depth",
       y = "flipper length", caption = "Graph by CARPHA")


plot3

plot2
plot1

### Extra stuff: feel free to ignore
library(patchwork)

combined <- plot1 | plot2
combined

## Making a histogram of bill lengths 

ggplot(data = penguins,
       aes(x = bill_length_mm)) + 
  geom_histogram(fill = "purple", colour = "black",
                 bins = 50)

## histogram of body masses

ggplot(data = penguins,
       aes(x = body_mass_g)) + 
  geom_histogram(fill = "#734B5E", color = "black") + 
  facet_wrap(~species, ncol = 1)

ggplot(data = penguins,
       aes(x = body_mass_g)) + 
  geom_histogram(fill = "#734B5E", color = "black") + 
  facet_grid(sex~species)

## An example of a linear model (using OLS) 
model1 <- lm(body_mass_g~flipper_length_mm, data = penguins)

summary(model1)

ggplot(data = penguins,
       aes(y = species, x = body_mass_g)) + 
  geom_boxplot()

penguins2 <- penguins |>
  filter(!is.na(sex))

ggplot(data = penguins2,
       aes(y = species, x = body_mass_g, color = sex)) + 
  geom_boxplot()










