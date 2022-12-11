# USE THE LIBRARY FUNCTION TO LOAD REQUIRED PACKAGES
library(dplyr)
library(tidyverse)

# IMPORT AND READ REQUIRED CSV FILE AS DATAFRAME
MC_mpg <- read.csv('../DATA/MechaCar_mpg.csv')
head(MC_mpg)

# PERFORM LINEAR REGRESSION PASSING ALL SIX VARIABLES AND OBTAIN SUMMARY STATISTICS
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MC_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MC_mpg))

# IMPORT AND READ REQUIRED CSV FILE AS DATAFRAME
SC_data <- read.csv('../DATA/Suspension_Coil.csv')
head(SC_data)

# OBTAIN THE MEAN, MEDIAN, VARIANCE AND STANDARD DEVIATION OF THE DATAFRAMES PSI COLUMN
total_summary <- SC_data %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))
print(total_summary)

# OBTAIN THE MEAN, MEDIAN, VARIANCE AND STANDARD DEVIATION OF THE DATAFRAMES PSI COLUMN GROUPED BY LOT
lot_summary <- SC_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
print(lot_summary)

# USE A T.TEST TO DETERMINE IF PSI ACROSS ALL MANUFACTURING LOTS IS STATISTICALLY DIFFERENT FROM POPULATION MEAN
t.test((SC_data$PSI), mu=1500)

# USE A T.TEST TO DETERMINE IF PSI FOR EACH MANUFACTURING LOT IS STATISTICALLY DIFFERENT FROM POPULATION MEAN
t.test(subset(SC_data, Manufacturing_Lot == "Lot1")$PSI, mu = 1500)
t.test(subset(SC_data, Manufacturing_Lot == "Lot2")$PSI, mu = 1500)
t.test(subset(SC_data, Manufacturing_Lot == "Lot3")$PSI, mu = 1500)

