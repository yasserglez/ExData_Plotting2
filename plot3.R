
# Of the four types of sources indicated by the type (point, nonpoint,
# onroad, nonroad) variable, which of these four sources have seen
# decreases in emissions from 1999–2008 for Baltimore City? Which have
# seen increases in emissions from 1999–2008? Use the ggplot2
# plotting system to make a plot answer this question.

library("dplyr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI %>%
    filter(fips == "24510") %>%
    filter(year >= 1999, year <= 2008) %>%
    group_by(year, type) %>%
    summarize(total_emission = sum(Emissions))

p <- ggplot(data, aes(x = year, y = total_emission, group = type)) +
    geom_point(aes(colour = type), size = 4.5) +
    geom_line(aes(colour = type), size = 1.5) +
    labs(title = "Baltimore City, Maryland",
         x = "Year", y = "Total PM2.5 emission (tons)")

ggsave("plot3.png", p)
