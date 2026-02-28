# 1. Subset data for Baltimore
baltimore_NEI <- subset(NEI, fips == "24510")

# 2. Aggregate Baltimore emissions by year
baltimore_emissions <- aggregate(Emissions ~ year, baltimore_NEI, sum)

# 3. Open PNG device
png("plot2.png", width=480, height=480)

# 4. Create base plot
barplot(baltimore_emissions$Emissions, 
        names.arg = baltimore_emissions$year, 
        xlab = "Year", 
        ylab = "Total PM2.5 Emissions (Tons)", 
        main = "Total PM2.5 Emissions in Baltimore City (1999-2008)", 
        col = "darkorange")

# 5. Close device
dev.off()