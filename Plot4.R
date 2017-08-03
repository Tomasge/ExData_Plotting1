### EXPLORATORY ANALYSIS WEEK 1 : Creating and Saving Plot 4
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
      

# 4. Plot latice graph 2x2

      par(mfcol = c(2,2))
      
      #Plot 1,1
            plot(dfs$DTime, dfs$Global_active_power, type = "l", 
                 ylab = "Global Active Power (Kilowatts)", main = "Global Active Power", xlab = "")
      
      #Plot 2,1
            plot(dfs$DTime, dfs$Sub_metering_1, type = "l",
                 ylab = "Energy sub metering", main = "Energy Sub-Metering", xlab = "")
      
            lines(dfs$DTime, dfs$Sub_metering_2, col="red")
            lines(dfs$DTime, dfs$Sub_metering_3, col="blue")
            legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   lty = c(1, 1), col= c("black", "red", "blue"), cex = 0.8,
                   y.intersp = 0.5, bty = "n", xjust = 1, yjust = 1)
      
      #Plot 1,2
            plot(dfs$DTime, dfs$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
      
      #Plot 2,2            
            plot(dfs$DTime, dfs$Global_active_power, type = "l", xlab = "datetime")
            
      dev.copy(png,"Plot4.png")
      dev.off()
      
