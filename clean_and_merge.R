#this step reads in csv and stroes as GDP_raw
GDP_raw <- read.csv("getdata_data_GDP.csv", skip=5, header=FALSE)

#this step keeps only these columns: 1,2,5 (country code, ranking, economy, and GDP) Others are not needed for this analysis. gdp_clean_1 is an intermediary step before final clean. 
gdp_clean_1 <- GDP_raw[c(1,2,4,5)]

#make the variable names more descriptive
names(gdp_clean_1) <- c("country_code", "ranking", "economy", "GDP_USD_MM")

#get rid of rows/obs not needed and check str again. Those past row 190 are either not country codes or are missing GDP values
gdp_clean_2 <- gdp_clean_1[1:190,]

#this step removes commas from the GDP variable
gdp_clean_2$GDP_USD_MM <- gsub(",","",gdp_clean_2$GDP_USD_MM)

#this step sets each variable to the correct data type.
gdp_clean_2$country_code<-as.character(gdp_clean_2$country_code)
gdp_clean_2$economy<-as.character(gdp_clean_2$economy)
gdp_clean_2$ranking <- as.numeric(as.character(gdp_clean_2$ranking))
gdp_clean_2$GDP_USD_MM<-as.numeric(gdp_clean_2$GDP_USD_MM)

#change object name to final clean
gdp_clean_final <- gdp_clean_2

#this concludes cleaning the GDP data
#we went from GDP_raw to GDP_clean_final

#this begins the education cleaning part

#import education data and store as educ_raw
educ_raw <- read.csv("getdata_data_EDSTATS_Country.csv", stringsAsFactors = FALSE, header=TRUE)

#looking at str function we see a lot of missing data, as well as more than we need for analysis. We will keep only columns 1 - 4.
#we are keeping country code, long name, income group, and region
#we are removing columns after 4 (geographic region)--see variable descriptions in raw data for explanation of each. If further analysis requries these variables, pleas return to raw data

#keep only columns 1 - 4
educ_clean_1 <- educ_raw[c(1:4)]

#make the variable names more descriptive
names(educ_clean_1) <- c("country_code", "country_name", "income_group", "geographic_region")

#take a closer look at these country_name and income_group for any potential problems
sample_1 <- educ_clean_1$country_name
sample_2 <- educ_clean_1$income_group

# put sample_1 and sample_2 in a data frame to see if we can delete where income level equals blank
check_for_problems <- data.frame(sample_1, sample_2)

#the above step shows us that whenever income group is blank, the corresponding counry code is not a country Ex:Heavily indebted poor countries (HIPC)

#create new object educ_clean_final. This will remove the blank income groups found to not be a country in the check_for problems data frame
educ_clean_final <- subset(educ_clean_1, income_group!="")

#merge the data set by country code
combined_data <- merge(gdp_clean_final, educ_clean_final, by="country_code", all=TRUE)

#count NA's in data frame
sum(is.na(combined_data))

#look column by column for NA's
sum(is.na(combined_data$country_code))
sum(is.na(combined_data$ranking))
sum(is.na(combined_data$economy))
sum(is.na(combined_data$GDP_USD_MM))
sum(is.na(combined_data$country_name))
sum(is.na(combined_data$income_group))
sum(is.na(combined_data$geographic_region))

#look at those that only have 1 NA
combined_data[is.na(combined_data$country_name),]
combined_data[is.na(combined_data$income_group),]
combined_data[is.na(combined_data$geographic_region),]

#South sudan needs an updated value, currently shows NA but is South Sudan
combined_data$country_name[is.na(combined_data$country_name)] <- "South Sudan"

#verify those columns with one NA are for sudan
combined_data[is.na(combined_data$income_group),]
combined_data[is.na(combined_data$geographic_region),]

#we can't update the income or geographic region, so we will leave as blank

#show the 21 NA's for economy
combined_data[is.na(combined_data$economy),]

#since country name doesn't have any na, we will drop economy and stick with country name as our indicator of country
combined_data_final <- combined_data[c(1,2,4,5,6,7)]


#sort GDP_USD_MM in ascending order
attach(combined_data_final)
combined_data_final_sorted <- combined_data_final[order(GDP_USD_MM),]
detach(combined_data_final)

#Need to look at the remaining NA's. This logical function will reveal where the NAs are found
look_at_all_na <- apply(combined_data_final_sorted, 1, function(x){any(is.na(x))})

#This step creates a new object to filter out the NA's
combined_data_final_sorted_filtered <- combined_data_final_sorted[!look_at_all_na,]


#write a final csv to WD. This is to be used for further anlaysis if user is interested
write.csv(combined_data_final_sorted_filtered, "tidy_data")

