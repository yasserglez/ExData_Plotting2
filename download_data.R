
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
data_zip <- "NEI_data.zip"

if (!file.exists(data_zip)) {
    download.file(data_url, data_zip, method = "curl")
}

unzip(data_zip, overwrite = TRUE)
