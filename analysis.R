#make a new object for incomes equal only to: "High income: OECD and "High income: nonOECD"
rich <-  combined_data_final_sorted_filtered[combined_data_final_sorted_filtered$income_group %in% c("High income: OECD","High income: nonOECD"), ]

#calculate the mean rank of these countries
rich_ranks <- rich$ranking
mean(rich_ranks)

#make a new object for incomes equal only to: "High income: OECD"
rich_OECD <-  combined_data_final_sorted_filtered[combined_data_final_sorted_filtered$income_group %in% ("High income: OECD"), ]

#calculate the mean rank of these high income OECD countries
OECD_ranks <- rich_OECD$ranking
mean(OECD_ranks)

#make a new object for incomes equal only to "High income: nonOECD"
high_income_nonOECD <-  combined_data_final_sorted_filtered[combined_data_final_sorted_filtered$income_group %in% ("High income: nonOECD"), ]

#calcualte mean rank of the high income nonOECD group
high_income_rank <- high_income_nonOECD$ranking
mean(high_income_rank)

#create a bar chart by income level and plot against GDP-combine both OECD members and nonOECD members
graph_of_GDP <- ggplot(data=combined_data_final_sorted_filtered, aes(x=reorder(income_group,-GDP_USD_MM), y=GDP_USD_MM)) + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank()) + geom_bar(aes(fill=income_group), stat="identity", color="black", position=position_dodge())
graph_of_GDP

#create a dot plot for all countries, fill by income group
dot <- ggplot(combined_data_final_sorted_filtered, aes(x=country_code, y=GDP_USD_MM, fill=income_group)) + geom_dotplot(binaxis='y', stackdir='center') + theme(axis.title.x=element_blank(), axis.text.x=element_blank(), axis.ticks.x=element_blank())
dot

#create quantile variable
attach(combined_data_final_sorted_filtered)
combined_data_final_sorted_filtered$quantile[ranking <= 38] <- 1
combined_data_final_sorted_filtered$quantile[ranking >= 39 & ranking <= 76] <- 2
combined_data_final_sorted_filtered$quantile[ranking >= 77 & ranking <= 114] <- 3
combined_data_final_sorted_filtered$quantile[ranking >= 115 & ranking <= 152] <- 4
combined_data_final_sorted_filtered$quantile[ranking >= 153 & ranking <= 190] <- 5
detach(combined_data_final_sorted_filtered)

#subset data for quantile 1
top_quantile <- subset(combined_data_final_sorted_filtered, quantile==1)

#make a table out of quantile 1 data
count_quantile_1 <- table(top_quantile$income_group, top_quantile$ranking)

#do a count of rows-there are 5 in lower middle but in quantile 1
rowSums(count_quantile_1)

