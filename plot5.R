
# How have emissions from motor vehicle sources changed from 1999–2008
# in Baltimore City?

library("dplyr")
library("magrittr")
library("stringr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI %>%
    filter(fips == "24510") %>%
    filter(type == "ON-ROAD") %>%
    filter(year >= 1999, year <= 2008) %>%
    group_by(year) %>%
    summarize(total_emission = sum(Emissions))

p <- ggplot(data, aes(x = factor(year), y = total_emission)) +
    geom_bar(stat = "identity") +
    labs(title = "Motor vehicle emissions in Baltimore City",
         x = "Year", y = "Total PM2.5 emission (tons)")

ggsave("plot5.png", p)
