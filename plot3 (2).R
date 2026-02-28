# 1. Load ggplot2
library(ggplot2)

# 2. Subset Baltimore data and aggregate by year AND type
baltimore_NEI <- subset(NEI, fips == "24510")
baltimore_type_emissions <- aggregate(Emissions ~ year + type, baltimore_NEI, sum)

# 3. Open PNG device
png("plot3.png", width=640, height=480)

# 4. Create ggplot
g <- ggplot(baltimore_type_emissions, aes(x = factor(year), y = Emissions, fill = type)) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) +
  labs(x = "Year", y = "Total PM2.5 Emissions (Tons)", title = "Baltimore City PM2.5 Emissions by Source Type") +
  theme(legend.position = "none")

print(g)

# 5. Close device
dev.off()