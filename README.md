# MechaCar’s Statistical Analysis

## Project Overview
### Objective
Perform multiple linear regression analysis to identify productions troubles in manufacturing process for AutoRU. 

### Process:
1. Identify which variables in the dataset predict mpg of MechaCar protype.
2. Collect Summary statistic on PSI from the suspension coils from the manufacturing lots. 
4. Determine if the lots are statistically different from the mean population.
5. Create a study to compare vehicle performance of MechaCar against other manufactures.

### Resources:
- Data Source: Suspension_Coil.csv, MechaCar_mpg.csv
- Software: RStudio and R 4.1.2

## Linear Regression to Predict MPG
### Analysis Questions:
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/summary.jpg" style="width: 585px; height: 335px">
</p>

***Which variables/coefficients provided a non-random amount of variance to mpg values in the data set?***

Evaluating the p-values for the for each variable (setting α =0.05) only the ground clearance (5.21e-08) and vehicle length (2.60e-12) have values that are less than the significance level. The null hypothesis, therefore, can be rejected meaning there is statistically significant relationship between these variables and mpg. For new samples set these variables are more likely to provide a non-random (“equal”) dispersion of their data points from the mean. 


<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/g1.jpg" style=" width: 400px; height: 250px">
</p>
<p align="center"><strong style=”font-size: 125%;”>Explanatory Variables</strong></p>

<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/g2.jpg" style=" width: 585px; height: 250px">
</p>
<p align="center"><strong style=”font-size: 125%;”>Insignificant P-Values Variables</strong></p>

***Is the slope of the linear model considered to be zero? Why or why not?***

The slope of the linear model is not considered to be zero. The estimate coefficient (slope*) for each variable shows the average change in y (mpg) given one unit increase in x (independent variables). As seen in the graphs the slopes of the model are not 0.

***Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?***

To determining the fit of the model, there are several measures to evaluate. Multiple R-squared = .7149 (adjusted R-squared = 68.3%) which means 71.5% of total variation can be explained by the variables to mpg relationship.
F-statistic is 22.07 on 44 degrees of freedom with a p-value (5.35e-11). The p-value shows that the F-statistic is statistically significant which means that the line regression model fits the data better than a model with no independent variables(x). This model can predict a value for mpg effectively contingent on R-squared value being acceptable. Industries have different benchmarks on this measure.


## Summary Statistics on Suspension Coils
*Design specification for the MechaCar’s suspension coils dictates that the variance must not exceed 100 PSIs.* 
***Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?***

<p align="center"><strong style=”font-size: 125%;”>Total Summary</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/total.jpg" style=" width: 385px; height: 90px">
</p>


In the total summary the variance is 62.29 PSI does not exceed the maximum level of the 100PSI meeting the design specification for all lots. However, looking at the lot summary reveals a discrepancy that could account for the production troubles.

<p align="center"><strong style=”font-size: 125%;”>Lot Summary</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/lots.jpg" style=" width: 485px; height: 165px">
</p>


In the lot summary, Lot 1 (0.98 PSI) and 2 (7.47 PSI) variance levels are acceptable to meet the specification standards. Lot 3 (170.29) failed to meet this design specification for suspension coil. 


## T-Tests on Suspension Coils
***Determine if the PSI for each manufacturing lot is statistically different from the population mean of 1500 PSI.***


**One Sample T-Test**

- Null Hypothesis: μ0 = 1500 PSI
- Alternative Hypothesis: μA ≠ 1500 PSI
- Significance Level: α =0.05

<p align="center"><strong style=”font-size: 125%;”>T-Test for Total Lots</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/alllot.jpg" style=" width: 400px; height: 165px">
</p>
This t-test compares the mean of PSI for the total lots against the null hypothesis which states that the population mean is 1500 PSI. The mean of our sample is 1498.78 and our p-value is .06028 (P > α). Based on the p-value, the null hypothesis is acceptable. The mean of the population and total lots are statistically similar. On the lot summary table, the mean of the individual manufacturing lots are either at or close to 1500 PSI. The box plot and t-tests of the three lots reveals the variations in statistically signficance of those means.
<p><br></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/boxplot.jpg" style=" width: 485px; height: 385px">
</p>

<p align="center"><strong style=”font-size: 125%;”>T-Test for Lot 1</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/lot1.jpg" style=" width: 435px; height: 165px">
</p>
<p align="center"></p>
Analysis for T-test for Lot 1:

The mean of this sample is 1500 with a p-value of 1. Since the p-value is greater than the significance level (P > α), the null hypothesis is acceptable. Lot 1 also has a t-stat value of 0, which signifies that this sample average and expected value (our null) is exactly the same. The mean of the population and the sample are statistically the same.</p>
<p align="center"><strong style=”font-size: 125%;”>T-Test for Lot 2</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/lot2.jpg" style=" width: 435px; height: 165px">
</p>
Analysis for T-test for Lot 2:

The mean of this sample is 1500.2 with a p-value of 0.6072. As in Lot 1 the null hypothesis is acceptable since the p-value is greater than the significance level (P > α). The t-stat for Lot 2 is 0.5175 meaning that there is a difference between the sample data and the null hypothesis as compared to Lot 1. On the box plot, there is an outlier that is contributing to the change. The mean of the population and the sample are statistically similar.
<p align="center"><strong style=”font-size: 125%;”>T-Test for Lot 3</strong></p>
<p align="center">
<img src="https://github.com/e-sycheung/MechaCar_Statistical_Analysis/blob/main/Results/lot3.jpg" style=" width: 435px; height: 165px">
</p>
Analysis for T-test for Lot 3:

The mean of this sample is 1496.14 with a p-value of 0.04168. Since the p-value is less than the significance level (P > α) , the null hypothesis can be rejected and alternative (the true mean of this sample is not equal to 1500) can be accepted. The absolute t-stat value is 2.0916 indicating that the difference between this sample and the population is increasing as compared to Lot 2. The box plot shows that the cause is outliers. The mean of the sample and the the population are statistically different. Lot 3 is indicated as the source of production troubles.  

