## fish simulation

#load pwr 
library(pwr)
pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.8)
0.1/0.2
#the growup would need at least 64 fish per group to reach their goals
# d based on expected result (0.1) divided by standard deviation (0.2) (which was their aim of average weight gain + 0.1 kg)

#by changing the power level to 0.55:
pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.19)
#n = 9.58
#using just 10 fish per group would only give a 19% chance of a preventing a type II error

#7966 vs R5
pwr.t.test(d = 0.9, sig.level = 0.05, power = 0.90)
#27 samples (might be doable)


## fish simulation continued

## load library
library(tidyverse)

# data info
n <- 10 #number observations in each group
delta <- 0.1 # difference between means, in this case the 0.1 kg interest
sd <- 0.2 # standard deviation

# simulate means
mu <- rep(c(0, delta), each = n)

# add noise
y <- mu + rnorm(length(mu), sd = sd)

# predictor
x <- factor(rep(c("A", "B"), each = n))

# run test
test <- t.test(y ~ x)
test

## simulating the test 100 times
sim_t_test <- function(n, delta, sd, ...){
  # simulate means
  mu <- rep(c(0, delta), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  test
  broom::tidy(test) |>  mutate(n = n, delta = delta, sd = sd)
}

sim_t_test <- function(n, delta, sd, ...){
  # simulate means
  mu <- rep(c(0, delta), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  broom::tidy(test) %>% mutate(n = n, delta = delta, sd = sd)
}

sim_t_test(n = 10, delta = 0.1, sd = 0.2)
nrep = 100

n <- rep(seq(10, 100, 20), each = nrep)

runs <- n |> 
  map_dfr(~sim_t_test(n = .x, delta = 0.1, sd = 0.2)) |> 
  mutate(sig = p.value <= 0.05)

p <- runs  |> 
  group_by(n) |> 
  summarise(power = mean(sig)) |> 
  ggplot(aes(x = n, y = power)) +
  geom_line() +
  geom_point()

n
p

## null hypothesis is true:

# data info
n <- 10 #number observations in each group
delta1 <- 0 # difference between means, in this case the 0.1 kg interest
sd <- 0.2 # standard deviation

# simulate means
mu <- rep(c(0, delta1), each = n)

# add noise
y <- mu + rnorm(length(mu), sd = sd)

# predictor
x <- factor(rep(c("A", "B"), each = n))

# run test
test <- t.test(y ~ x)
test

## simulating the test 100 times
sim_t_test <- function(n, delta1, sd, ...){
  # simulate means
  mu <- rep(c(0, delta1), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  test
  broom::tidy(test) |>  mutate(n = n, delta1 = delta1, sd = sd)
}

sim_t_test <- function(n, delta1, sd, ...){
  # simulate means
  mu <- rep(c(0, delta1), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  broom::tidy(test) %>% mutate(n = n, delta1 = delta1, sd = sd)
}

sim_t_test(n = 10, delta = 0, sd = 0.2)
nrep = 100

n <- rep(seq(10, 100, 20), each = nrep)

runs <- n |> 
  map_dfr(~sim_t_test(n = .x, delta1 = 0, sd = 0.2)) |> 
  mutate(sig = p.value <= 0.05)

p <- runs  |> 
  group_by(n) |> 
  summarise(power = mean(sig)) |> 
  ggplot(aes(x = n, y = power)) +
  geom_line() +
  geom_point()
p

#might be a good idea not to change the name of delta, just the values 


# data info
n <- 10 #number observations in each group
delta <- 0 # difference between means, in this case the 0.1 kg interest
sd <- 0.2 # standard deviation

# simulate means
mu <- rep(c(0, delta), each = n)

# add noise
y <- mu + rnorm(length(mu), sd = sd)

# predictor
x <- factor(rep(c("A", "B"), each = n))

# run test
test <- t.test(y ~ x)
test

## simulating the test 100 times
sim_t_test <- function(n, delta, sd, ...){
  # simulate means
  mu <- rep(c(0, delta), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  test
  broom::tidy(test) |>  mutate(n = n, delta = delta, sd = sd)
}

sim_t_test <- function(n, delta, sd, ...){
  # simulate means
  mu <- rep(c(0, delta), each = n)
  # add noise
  y <- mu + rnorm(length(mu), sd = sd)
  # predictor
  x <- factor(rep(c("A", "B"), each = n))
  
  # run test
  test <- t.test(y ~ x)
  broom::tidy(test) %>% mutate(n = n, delta = delta, sd = sd)
}

sim_t_test(n = 10, delta = 0, sd = 0.2)
nrep = 100

n <- rep(seq(10, 100, 20), each = nrep)

runs <- n |> 
  map_dfr(~sim_t_test(n = .x, delta = 0, sd = 0.2)) |> 
  mutate(sig = p.value <= 0.05)

p <- runs  |> 
  group_by(n) |> 
  summarise(power = mean(sig)) |> 
  ggplot(aes(x = n, y = power)) +
  geom_line() +
  geom_point()

n
p
