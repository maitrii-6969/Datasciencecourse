# 1. Aggregate total emissions by year
total_emissions <- aggregate(Emissions ~ year, NEI, sum)

# 2. Open PNG device
png("plot1.png", width=480, height=480)

# 3. Create base plot
barplot(total_emissions$Emissions / 1000, 
        names.arg = total_emissions$year, 
        xlab = "Year", 
        ylab = "Total PM2.5 Emissions (Kiloto-tons)", 
        main = "Total US PM2.5 Emissions (1999-2008)", 
        col = "steelblue")

# 4. Close device
dev.off()