### load library ###
library(tidyverse)
### load data ###
data("penguins", package = "palmerpenguins")
### show data ###
penguins
### penguin species ###
penguins |>
select(species)
### penguin bill lenght per species ###
penguins |>
select(species, bill_length_mm)
### all penguin data except year ###
penguins |> select(-year)
### all penguin non-numerical data ###
penguins |> select(where(is.character))
# wrong code
# try again
penguins |> select(where(is.factor))
### penguin species and columns ening in mm ###
penguins |> select(end_with("mm"))
#typo
# try again
penguins |> select(ends_with("mm"))
### specifically species ending in "mm" ###
penguins |> select(species(where(ends_with("mm")))
)
#did not work
# try again
penguins |> select(species) |>
select(where(ends_with("mm"))
)
# try again
penguins |> select(species) |>
+ where(ends_with("mm"))
penguins |> select(species) |>
where(ends_with("mm"))
#try again
penguins |> select(species) |>
where(in.factor) |>
ends_with("mm")
penguins |> select(penguins, species), in.factor) |> select(ends_with("mm"))
penguins |> select(species), in.factor) |> select(ends_with("mm"))
##fail
### filter penguin data by species names ###
penguins |> filter(species = "Gentoo")
## use == for test
penguins |> filter(species == "Gentoo")
#filter both Gentoo and Adelie
penguins |> filter(species == "Gentoo"| species == Adelie)
penguins |> filter(species == "Gentoo"| species == "Adelie")
#remember ""
###filter penguins by mass and bill lenght###
penguins |>
filter(body_mass_g == 5000, body_mass_g > 5000)
# did not work?
## select body mass
penguins |> select(body_mass_g)
# are there penguins over 5000?
penguins |> filter(body_mass_g > 5000)
#yes
#are there penguins with body mass of exactly 5000?
penguins |> filter(body_mass_g = 5000)
#remember ==
penguins |> filter(body_mass_g == 5000)
# so, 61 + 6 penguins have the bodymass 5000 or larger
### filter penguins by bill lenght between 45 and 50 mm ###
penguins |> filter(bill_length_mm > 45 | bill_length_mm < 50)
### try again to filter penguins weighing 5000 g or more
penguins |> filter(!body_mass_g > 5000)
# the previous estimate of number of penguins was wrong
## apparently >= can be used for equal or greater
### filter Gentoo penguins that are not from Dream Island
penguins |> filter(species == "Gentoo", -"Dream Island")
###no idea how to do that, moving on
###finding distinct values of penguin species ###
penguins |> distinct(species)
#three distinct species
### distinct values for species, island and sex ###
penguins |> distinct(species, island, sex)
#13 distinct combinations
### converting flipper lenght into cm ###
penguins |> mutate(flipper_lenght_cm = flipper_length_mm * 1000)
### testing ratio of bill width to depth ###
penguins |> mutate(bill_width_depth_ratio = bill_depth_mm / bill_length_mm)
## filter bill depth/lenght
penguins |> mutate(bill_width_depth_ratio = bill_depth_mm / bill_length_mm) |> filter(bill_width_depth_ratio)
penguins |> mutate(bill_width_depth_ratio = bill_depth_mm / bill_length_mm) select(bill_width_depth_ratio)
penguins |> select(bill_width_depth_ratio)
# the column disappears, I was not able to get the information
###assign pipes if needed for furher work
### assign min and max bill length ###
penguins |>
summarise(bill_length_mm = max(bill_length_mm, na.rm = TRUE))
penguins |>
summarise(bill_length_mm = min(bill_length_mm, na.rm = TRUE))
#maximum bill lenght 59.6 mm, minumum 32.1 mm
### min and max bill lenght all species
penguins |>
group_by(species) |>
summarise(max_bill_lenght = max(bill_length_mm))
savehistory("O:/bio302gitrepository1/penguin_exercise_tidyverse.Rhistory")
