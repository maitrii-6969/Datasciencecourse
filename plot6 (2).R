library(ggplot2)

# 1. Subset data for both cities and On-Road vehicles
balt_la_vehicles <- subset(NEI, fips %in% c("24510", "06037") & type == "ON-ROAD")

# 2. Aggregate emissions by year and location (fips)
balt_la_emissions <- aggregate(Emissions ~ year + fips, balt_la_vehicles, sum)

# 3. Add city names for the plot legend/facets
balt_la_emissions$City <- ifelse(balt_la_emissions$fips == "24510", "Baltimore City", "Los Angeles County")

# 4. Open PNG device
png("plot6.png", width=640, height=480)

# 5. Create ggplot
g <- ggplot(balt_la_emissions, aes(x = factor(year), y = Emissions, fill = City)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ City) +
  labs(x = "Year", y = "PM2.5 Emissions (Tons)", title = "Motor Vehicle Emissions: Baltimore vs. Los Angeles") +
  theme(legend.position = "none")

print(g)

# 6. Close device
dev.off()