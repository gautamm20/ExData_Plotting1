library(dplyr)
library(lubridate)

# read only 1st and 2nd Feb 2007 data
data <- read.table("household_power_consumption.txt", sep = ";", skip = 66637, nrows = 2880)

# converting sub_metering columns to numeric
data <- data %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V7 = as.numeric(as.character(V7)),
                        V8 = as.numeric(as.character(V8)),
                        V9 = as.numeric(as.character(V9))) %>% select(V1,V7:V9)

# building the plot one by one for each metering column
with(data, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(data, points(V1,V7, col="black", type="l"))
with(data, points(V1,V8, col="red", type="l"))
with(data, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

#export to png (quartz is added since this has been run on a mac machine)
png(filename = "plot3.png", width=480, height=480, units="px", type="quartz")