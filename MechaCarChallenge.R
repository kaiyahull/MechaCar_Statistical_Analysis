library(dplyr)

# import MechaCar_mpg file
mecha_car <- read.csv('MechaCar_mpg.csv')

# linear model of mpg versus other vehicle factors
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
     ground_clearance + AWD, data = mecha_car)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
             ground_clearance + AWD, data = mecha_car))

# import Suspension_Coil file
suspension_coil <- read.csv('Suspension_Coil.csv')

# Find mean, median, variance, and standard deviation of PSI 
total_summary <- suspension_coil %>% summarize(Mean = mean(PSI), 
            Median = median(PSI), Variance = var(PSI), SD = sd(PSI))

# Find mean, median, variance, and standard deviation of PSI for each lot
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% 
            summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), 
            SD = sd(PSI))

# T-test of all lots and each individual lots and population mean
t.test(suspension_coil$PSI, mu=1500)
t.test((subset(suspension_coil, Manufacturing_Lot == "Lot1", 
              select = PSI)), mu=1500)
t.test((subset(suspension_coil, Manufacturing_Lot == "Lot2", 
               select = PSI)), mu = 1500)
t.test((subset(suspension_coil, Manufacturing_Lot == "Lot3", 
               select = PSI)), mu = 1500)
