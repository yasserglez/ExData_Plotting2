
# Compare emissions from motor vehicle sources in Baltimore City with
# emissions from motor vehicle sources in Los Angeles County,
# California (fips == "06037"). Which city has seen greater changes over
# time in motor vehicle emissions?

library("dplyr")
library("magrittr")
library("stringr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI %>%
    filter(fips == "24510" | fips == "06037") %>%
    filter(type == "ON-ROAD") %>%
    filter(year >= 1999, year <= 2008) %>%
    mutate(County = ifelse(fips == "24510", "Baltimore City", "Los Angeles")) %>%
    group_by(County, year) %>%
    summarize(total_emission = sum(Emissions))

p <- ggplot(data, aes(x = factor(year), y = total_emission, group = County)) +
    geom_point(aes(colour = County), size = 4.5) +
    geom_line(aes(colour = County), size = 1.5) +
    labs(title = "Motor vehicle emissions",
         x = "Year", y = "Total PM2.5 emission (tons)")

ggsave("plot6.png", p)
