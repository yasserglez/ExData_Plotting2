
# Have total emissions from PM2.5 decreased in the United States from
# 1999 to 2008? Using the base plotting system, make a plot showing
# the total PM2.5 emission from all sources for each of the years
# 1999, 2002, 2005, and 2008.

library("dplyr")

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI %>%
    filter(year >= 1999, year <= 2008) %>%
    group_by(year) %>%
    summarize(total_emission = sum(Emissions))

png(filename = "plot1.png")

barplot(data$total_emission, names.arg = data$year,
        xlab = "Year", ylab = "Total PM2.5 emission (tons)")

dev.off()
