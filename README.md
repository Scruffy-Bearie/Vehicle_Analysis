# Statistical Analysis of MechaCar Manufacturing: The Pieces and The Whole

## Overview
Statistical analysis of data often involves not only generating summary statistics for data sets but also producing multiple linear regression models to examine the correlations between relevant variables and performing t-tests to compare data sub-groups to the overall population and each other.  R-Studio is a public domain software package frequently employed by academia that, in addition to including a comprehensive visualisation library, provides a robust and complete set of tools for statistical analysis.  The client for this project, a vehicle manufacturer called AutosRU’s experiencing difficulties with production of their latest model, the MechaCar, requested a statistical analysis of both the vehicle itself and individual manufacturing lots in the interests of identifying the root cause of said difficulties.  The following analysis represents an attempt to address the aforementioned request.

## Results
To identify variables related to ideal vehicle performance in terms of fuel efficiency as measured in miles driven per gallon of gasoline consumed (mpg), AutosRU’s assembled 50 MechaCar prototypes with variations in the design of vehicle length, vehicle weight, spoiler angle, drive train and ground clearance and determined the mpg for each vehicle.  To determine the “correlation” between eacch variable and fuel efficiency, a multiple linear regression model was constructed and summary statistics pertaining to each variable in the model obtained (See Figure 1).

### Figure 1: Multiple Linear Regression Model and Summary Statistics for the MechaCar Prototypes
![]( https://github.com/Scruffy-Bearie/Vehicle_Analysis/blob/main/IMAGES/Figure1.png)

To determine if manufacturing of suspension coils was consistent across different manufacturing lots, summary statistics for all manufacturing lots and each manufacturing lot were generated for analysis (See Figure 2).

### Figure 2: Summary Statistics for Suspension Coil Manufacturing for All and Individual Lots
![]( https://github.com/Scruffy-Bearie/Vehicle_Analysis/blob/main/IMAGES/Figure2.png)

To determine if manufacturing of suspension coils for all manufacturing lots and each manufacturing lots was statistically different to the population, t-tests were used to compare suspension coil performance in pounds per square inch (PSI) for all lots and each individual lot to the accepted population mean of 1500 PSI (See Figure 3). 

### Figure 3: T-Tests for Suspension Coil Performance for All and Individual Lots
![]( https://github.com/Scruffy-Bearie/Vehicle_Analysis/blob/main/IMAGES/Figure3.png)


## ANALYSIS

### (i) Linear Regression to Predict MPG
The significance of each individual variable in the multiple linear regression model was determined by examining values in the Pr(>|t|) column in the summary statistics for the model (see Figure 1).  A low value for Pr(>|t|) indicates that the variable in question is statistically unlikely to have produced random variance to the model and as such, it was determined that the most significant contributors to the model for predicting MPG of the MechaCar Prototype were “vehicle length” and “ground clearance”.

To determine if the slope of the multiple linear regression model was considered to be “0”, the “p-value” for the model was used to assess the null hypothesis “the slope of the linear model = 0”.  Given the calculated p-value for the model was found to be 5.35e-11 (see Figure 1), well below our accepted p-value of 0.05, the null hypothesis was rejected and it was determined that the slope of the multiple linear regression model was NOT equal to “0”.

Although the multiple R-squared value for the model was 0.7149 (see Figure 1), suggesting that the model would accurately predict approximately 71% of results, the abundance of insignificant variables (as indicated the by the high Pr(>|t|)  values associated with “vehicle weight”, “spoiler angle” and “awd”) taken in conjunction with the low Pr(>|t|) value associated with the intercept suggest that model has been overfit and that there are likely other variables contributing to variance.  As such, as much as the model may accurately predict results within the current data set, it is statistically unlikely that it would make accurate predictions within other/future data sets.

### (ii) Summary Statistics on Suspension Coils
Given that the variance in the MechaCar suspension coils must not exceed 100 pounds per square inch (PSI), the summary statistics generated (see Figure 2) demonstrated that although this requirement was being met for ALL lots (variance = 62.3 PSI), it was NOT being met within individual lots.  Wherein the variance for Lots 1 and 2 was found to be well within the required limit (0.98 and 7.47 PSI respectively), the variance for Lot 3 was found to be outside of the required limit (170 PSI) suggesting that there may have been a “manufacturing issue” associated with Lot 3 and that the suspension coils associated with those vehicles may have been “problematic”.

### (iii) T-Tests on Suspension Coils
The results obtained for the t-test on suspension coil data from all manufacturing lots (see Figure 3) indicated that the estimated mean was 1498.8 PSI with a 95% confidence interval of 1497.5 PSI to 1500.1 PSI.  Given an accepted value for support offered by suspension coils for the population of 1500 PSI, the p-value associated for the t-test was found to be 0.06028, meaning that the null hypothesis (the value for all lots is different than the population mean) can be rejected in favour of the alternative hypothesis: the estimated mean for all manufacturing lots is not statistically different than the accepted population mean.

The results obtained for the t-test on suspension coil data from each individual manufacturing lot, however, resulted in different conclusions (see Figure 3).  For Lots 1 and 2, the 95% confidence for the sample estimates of the mean (1499.7 to 1500.3 PSI and 1499.7 to 1500.9 PSI respectively) included the accepted population mean of 1500 PSI and the p-values (1.0 and 0.61 respectively) indicated that null hypothesis should be rejected – i.e. that the estimate of mean PSI for Lots 1 and 2 was not statistically different from the population mean.  The results for Lot 3 indicated that the 95% confidence interval for the mean estimated by the sample was found to be from 1492.4 PSI to 1499.8 PSI with an associated p-value of 0.042.  Given a desired confidence of 5% or higher – i.e. that the accepted population mean was NOT included in the 95% confidence interval, these results indicated that for Lot 3 the null hypothesis should be accepted – i.e. that the estimate of the mean suspension coil PSI or Lot 3 IS statistically different than the accepted population mean.


### (iv) Study Design: MechaCar vs. Competition
If AutosRU’s MechaCar were to be compared to the competition, it would be assumed that the end objective would be to produce a comparison that would be viewed favourably in the eyes of consumers and be correlated with increased sales (and associated revenues).  Given the current “climate” surrounding environmental impact of motor vehicles (as it pertains to the correlation to consumption of fossil fuels) taken in conjunction with the current price of fossil fuels for the consumer, the comparison of MechaCar to the competition would be in terms of average fuel efficiency in miles per gallon (MPG) or liters per kilometer (L/km) as measured for both city and highway driving.

In such a study, the null hypothesis proposed would be that the fuel efficiency of the MechaCar is, statistically speaking, no different, or worse, than that of the competition while the alternative hypothesis would be that fuel efficiency of the MechaCar is, statistically speaking, better than that of the competition.

In the interests of propriety, and conducting a “fair” study, the data set to be analysed would have to have been generated from a sample of MechaCars large enough for useful comparison to the overall population and an equal number of each of the competition’s vehicles.  All vehicles – the MechaCars and all of the competitors vehicles – would have to have been driven in the exact same locations under exactly the same conditions, using the same fuel types with their respective fuel efficiencies measured independently of their onboard computers by a third party.

The data from such a study would be analysed using one sided t-tests to compare fuel efficiency off the MechaCar to both ALL competitors and each individual competitor with a desired confidence level of no less than 95%.  As such a p-value of less than 0.05 associated with either/any of the t-test(s) would suggest that the null hypothesis could be rejected and the fuel efficiency of the MechCar WAS better than either the net results for ALL competitors or ANY individual competitor depending on the results of the specific t-test.

