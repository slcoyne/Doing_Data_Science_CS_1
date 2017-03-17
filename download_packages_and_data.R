#download the needed pacckages ggplot2 and downloader. This step may be skipped if already downloaded.
library(ggplot2)
library(downloader)

#download the GDP data set and save to working directory
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="getdata_data_GDP.csv")

#download the Education data set and save to working directory
download("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="getdata_data_EDSTATS_Country.csv")


