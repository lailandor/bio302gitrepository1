### load library ###
library(tidyr)

### load weather data ###
height <- read_delim(file = "O:\\biomass2015_H.csv", delim = ",")

#weather data source: https://raw.githubusercontent.com/biostats-r/biostats/main/WorkingInR/data/biomass2015_H.csv
#downloaded locally

#Exercise: With the Mt Gonga data downloaded previously, pivot the data so that the height data (H1-H10) are in one column

height |> pivot_longer(cols = H1:H10)

#not sure what that did
