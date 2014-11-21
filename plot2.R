
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make
# a plot answering this question.

library("dplyr")

NEI <- readRDS("summarySCC_PM25.rds")

data <- NEI %>%
    filter(fips == "24510") %>%
    filter(year >= 1999, year <= 2008) %>%
    group_by(year) %>%
    summarize(total_emission = sum(Emissions))

png(filename = "plot2.png")

barplot(data$total_emission, names.arg = data$year,
        main = "Baltimore City, Maryland",
        xlab = "Year", ylab = "Total PM2.5 emission (tons)")

dev.off()
