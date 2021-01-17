library(dplyr)
mpg_data <- read.csv('MechaCar_mpg.csv')
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mpg_data)) #generate summary statistics

sus_coil <- read.csv('Suspension_Coil.csv')

total_summary <- sus_coil %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups =  'keep' )

lot_summary <- sus_coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), SD = sd(PSI), .groups =  'keep' )


t.test(sus_coil$PSI,mu=mean(sus_coil$PSI))

t.test(sus_coil$PSI, subset = sus_coil[sus_coil$Manufacturing_Lot=='Lot1'],mu=mean(sus_coil$PSI))
t.test(sus_coil$PSI, subset = sus_coil[sus_coil$Manufacturing_Lot=='Lot2'],mu=mean(sus_coil$PSI))
t.test(sus_coil$PSI, subset = sus_coil[sus_coil$Manufacturing_Lot=='Lot3'],mu=mean(sus_coil$PSI))