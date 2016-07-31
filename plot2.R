library(dplyr)
library(lubridate)

# read only 1st and 2nd Feb 2007 data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# make date and time ready for plotting along with active power
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

#setting up write to png (quartz is added since this has been run on a mac machine)
png(filename = "plot2.png", width=480, height=480, units="px", type="quartz")
# using with to make it more readable to plot the graph
with(data, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()