
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?

library("dplyr")
library("magrittr")
library("stringr")
library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_comb_SCCs <- SCC %>%
    filter(str_detect(SCC$Short.Name, ".*Comb /.*Coal /.*")) %>%
    select(SCC) %>%
    extract2("SCC")

data <- NEI %>%
    filter(SCC %in% coal_comb_SCCs) %>%
    filter(year >= 1999, year <= 2008) %>%
    mutate(year = as.factor(year)) %>%
    group_by(year) %>%
    summarize(total_emission = sum(Emissions))

p <- ggplot(data, aes(x = year, y = total_emission)) +
    geom_bar(stat = "identity") +
    labs(title = "Coal combustion-related emissions",
         x = "Year", y = "Total PM2.5 emission (tons)")

ggsave("plot4.png", p)
