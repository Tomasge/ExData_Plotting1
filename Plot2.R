### EXPLORATORY ANALYSIS WEEK 1 : Creating and Saving Plot 2
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


# 4. Plot Line Graph of Global ACtive Power

      par(mfcol = c(1, 1))
      
      plot(dfs$DTime, dfs$Global_active_power, type = "l", 
           ylab = "Global Active Power (Kilowatts)", main = "Global Active Power", xlab = "")
      
      dev.copy(png,"Plot2.png")
      dev.off()
      
