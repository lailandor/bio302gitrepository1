## Linear Modelling Exercises

1. Import the penguin data from the `palmerpenguin` package
2. Do big birds have big beaks? Fit a linear model between bill length and body mass, and interpret the coefficients.
3. Examine the diagnostics plots. Is everything OK?
  3. Calculate the residual sum of squares (find sum the squared difference between the estimates calculated from the coefficients and the observed values).
4. Recalculate the Residual sum of squares using different values for the coefficients (in the formula yi = Beta + Beta xi + εi).
5. Is the new RSS larger or smaller?
  6. Estimate the slope using covariance and variance.
7. Do you get the same result?
  8. Add species to the model as a predictor.
9. Does species improve the model?
  10. How should the coefficients be interpreted?

# load package

palmerpenguins::penguins

# 2. does body size correlate with beak size?

cor(penguins$bill_length_mm,
    penguins$body_mass_g, 
    use = "pairwise.complete")

## result: correlation coefficient = 0.5951098

cor.test(penguins$bill_length_mm,
    penguins$body_mass_g, 
    use = "pairwise.complete")

## result: t = 13.654; df = 340; p = <2.2e-16; 
## correlation 0-95% interval: 0.522-0.66
## bill lenght appears to correlate with body size 
## given cor. coefficient falls within interval


# 3. creating model "mod" to check diagnostic plots

mod <- lm(bill_length_mm ~ body_mass_g, data = penguins)

#load library
library(ggfortify)

# check diagnostic plot of model "mod"
plot(mod)

# residual sum of sqaures of mod
summary(mod)

#Coefficients:
#Estimate Std. Error t value Pr(>|t|)    
#(Intercept) 2.690e+01  1.269e+00   21.19   <2e-16 ***
#body_mass_g 4.051e-03  2.967e-04   13.65   <2e-16 ***
#where "body_mass_g" 4.051e-03 is the estimated slope

## skipping 4. and 5., no idea what to do

# estimating variance and covariance
car::Anova(mod)
#anova cannot estimate variance or covariance

var(penguins$body_mass_g, na.rm = TRUE)
#variance of x = 643131.1

cov(penguins$bill_length_mm, penguins$body_mass_g, use = "complete.obs")
# covariance = 2605.592

#slope = covariance of xy/varaince of x
#where x = bodymass, y=bill lenght

slope <- 2605.592/643131.1
slope
#slope = 0.004051417
#which is basically 4.051e-03 

