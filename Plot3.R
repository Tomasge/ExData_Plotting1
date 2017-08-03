### EXPLORATORY ANALYSIS WEEK 1 : Creating and Saving Plot 3
# Created by TGE Aug 3, 2017
#######################################################################

# 1. Read Data
      
      df <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",
                       colClasses="character", header = TRUE)


# 2. Convert character columns to appropriate types and create new date-time column
      
      df[,c(3:9)] <- apply( df[, c(3:9)], 2, function (x) as.numeric(x) )
      df$DTime <- paste(df$Date,df$Time, sep = "-")
      df$DTime <- strptime(df$DTime, format = "%d/%m/%Y-%H:%M:%S")
      df$Date <- dmy(df$Date)


# 3. Subset the relevant data
      
      dfs <- df[(df$Date >= "2007-02-01" & df$Date <= "2007-02-02"), ]


# 4. Plot the line graphs for Energy sub-metering

      par(mfcol = c(1, 1))
      
      plot(dfs$DTime, dfs$Sub_metering_1, type = "l",
           ylab = "Energy sub metering", main = "Energy Sub-Metering", xlab = "")
      
      lines(dfs$DTime, dfs$Sub_metering_2, col="red")
      lines(dfs$DTime, dfs$Sub_metering_3, col="blue")
      
      legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1, 1), col= c("black", "red", "blue"), cex = 0.75)
      
      dev.copy(png,"Plot3.png")
      dev.off()

