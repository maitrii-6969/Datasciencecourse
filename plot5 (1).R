library(ggplot2)

# 1. Subset data for Baltimore and On-Road (Motor Vehicles)
baltimore_vehicles <- subset(NEI, fips == "24510" & type == "ON-ROAD")

# 2. Aggregate emissions by year
baltimore_veh_emissions <- aggregate(Emissions ~ year, baltimore_vehicles, sum)

# 3. Open PNG device
png("plot5.png", width=480, height=480)

# 4. Create ggplot
g <- ggplot(baltimore_veh_emissions, aes(x = factor(year), y = Emissions)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(x = "Year", y = "PM2.5 Emissions (Tons)", title = "Baltimore City Motor Vehicle Emissions (1999-2008)")

print(g)

# 5. Close device
dev.off()