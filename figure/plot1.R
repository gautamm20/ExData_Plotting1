library(dplyr)
library(lubridate)

# read only 1st and 2nd Feb 2007 data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# Convert Active power to numeric to plot
data <- data %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

# create histogram
hist(data$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")

png(filename = "plot1.png", width=480, height=480, units="px", type="quartz")