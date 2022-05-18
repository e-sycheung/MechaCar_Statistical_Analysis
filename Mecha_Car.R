## Linear Regression to Predict MPG
# load dplyr package in R
library(dplyr)
# import and read csv file as df
Mcar_mpg <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)
# check for variables (ie columns)
head(Mcar_mpg)

vehicle_length vehicle_weight spoiler_angle ground_clearance AWD      mpg
1       14.69710       6407.946      48.78998         14.64098   1 49.04918
2       12.53421       5182.081      90.00000         14.36668   1 36.76606
3       20.00000       8337.981      78.63232         12.25371   0 80.00000
4       13.42849       9419.671      55.93903         12.98936   1 18.94149
5       15.44998       3772.667      26.12816         15.10396   1 63.82457
6       14.45357       7286.595      30.58568         13.10695   0 48.54268

# perform linear regression 
lm(mpg ~ vehicle_length +vehicle_weight +spoiler_angle +ground_clearance +AWD, data=Mcar_mpg)

Coefficients:
(Intercept)    vehicle_length    vehicle_weight     spoiler_angle     ground_clearance        AWD  
-1.040e+02        6.267e+00         1.245e-03         6.877e-02         3.546e+00        -3.411e+00 


# determine p-value and r^2 value for the linear regression model 
summary(lm(mpg ~ vehicle_length +vehicle_weight +spoiler_angle +ground_clearance +AWD, data=Mcar_mpg))

Residuals:
  Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                    Estimate  Std. Error t value  Pr(>|t|)    
     (Intercept)   -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
  vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
  vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
   spoiler_angle    6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance    3.546e+00  5.412e-01   6.551 5.21e-08 ***
             AWD   -3.411e+00  2.535e+00  -1.346   0.1852    

  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11

## Visualization of the all variables 
ggplot(Mcar_mpg, aes(x=vehicle_length,y=mpg)) +geom_point() + geom_smooth(method = "lm")
ggplot(Mcar_mpg, aes(x=vehicle_weight,y=mpg)) +geom_point() + geom_smooth(method = "lm")
ggplot(Mcar_mpg, aes(x=spoiler_angle,y=mpg)) +geom_point() + geom_smooth(method = "lm")
ggplot(Mcar_mpg, aes(x=ground_clearance,y=mpg)) +geom_point() + geom_smooth(method = "lm")
ggplot(Mcar_mpg, aes(x=AWD,y=mpg)) +geom_point() + geom_smooth(method = "lm")

## Create Visualization for Trip Analysis 
# import and read csv
Sus_Coil <- read.csv(file = 'Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

# get the mean, median, variance and standard deviation for all lots of PSI of Sus. Coils
total_stat <- Sus_Coil %>% summarise(Mean= mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI), .groups = "keep")

# get the mean, median, variance and standard deviation for each lot
lot_stat <- Sus_Coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean= mean(PSI), Median= median(PSI), Variance= var(PSI), SD= sd(PSI), .groups = "keep")

## Visualization of the lot summary
plt <- ggplot(Sus_Coil,aes(x=Manufacturing_Lot,y=PSI)) 
plt + geom_boxplot() +geom_point()

## T-test on Suspension Coils
# run T-test on the whole population
t.test(Sus_Coil$PSI,mu=mean(Sus_Coil$PSI))

	One Sample t-test

data:  Sus_Coil$PSI
t = 0, df = 149, p-value = 1
alternative hypothesis: true mean is not equal to 1498.78
95 percent confidence interval:
 1497.507 1500.053
sample estimates:
mean of x 
    1498.78 

# run T-test for Lot 1
 t.test(subset(Sus_Coil,Manufacturing_Lot=="Lot1")$PSI,mu=1500)

 	One Sample t-test

data:  subset(Sus_Coil, Manufacturing_Lot == "Lot1")$PSI
t = 0, df = 49, p-value = 1
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.719 1500.281
sample estimates:
mean of x 
     1500 

# run T-test for Lot 2
t.test(subset(Sus_Coil,Manufacturing_Lot=="Lot2")$PSI,mu=1500)

	One Sample t-test

data:  subset(Sus_Coil, Manufacturing_Lot == "Lot2")$PSI
t = 0.51745, df = 49, p-value = 0.6072
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1499.423 1500.977
sample estimates:
mean of x 
   1500.2 

# run T-test for Lot 3
t.test(subset(Sus_Coil,Manufacturing_Lot=="Lot3")$PSI,mu=1500)

	One Sample t-test

data:  subset(Sus_Coil, Manufacturing_Lot == "Lot3")$PSI
t = -2.0916, df = 49, p-value = 0.04168
alternative hypothesis: true mean is not equal to 1500
95 percent confidence interval:
 1492.431 1499.849
sample estimates:
mean of x 
  1496.14 







