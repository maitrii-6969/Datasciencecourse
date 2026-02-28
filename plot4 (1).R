library(ggplot2)

# 1. Find SCC codes related to coal combustion
coal_combustion_SCC <- SCC[grepl("comb.*coal", SCC$EI.Sector, ignore.case = TRUE), ]

# 2. Subset NEI data using those SCC codes
coal_NEI <- NEI[NEI$SCC %in% coal_combustion_SCC$SCC, ]

# 3. Aggregate emissions by year
coal_emissions <- aggregate(Emissions ~ year, coal_NEI, sum)

# 4. Open PNG device
png("plot4.png", width=480, height=480)

# 5. Create ggplot
g <- ggplot(coal_emissions, aes(x = factor(year), y = Emissions / 1000)) +
  geom_bar(stat = "identity", fill = "darkred") +
  labs(x = "Year", y = "PM2.5 Emissions (Kilo-tons)", title = "US Coal Combustion-Related Emissions (1999-2008)")

print(g)

# 6. Close device
dev.off()