# Doing_Data_Science_CS_1
Case study 1 for Doing Data Science

This case study accomplishes data cleansing, merging, analysis, and visualization of two data sets from the World Bank. The case study write up contains the summary, analysis, and conclusion. This README also offers interested readers a place to learn more about the variables and their description. Some of these variables may be of interest for additional research. The makefile structure of this analysis will download the data sources to one's working directory as well as clean up any data formatting issues (NAs, etc.). For those without an economics background, a glossary of terms can be found in the case study write up.

Source files:
Original filename: getdata_data_EDSTATS_Country
clean filename: education

getdata_data_GDP variable names--raw data:

ranking: rank of each country's GDP, where GDP is expressed in US dollars

economy: name of country

millions of us dollars: GDP expressed in US dollars

getdata_data_EDSTATS_Country--raw data:

CountryCode:three letter code designating country

Long Name: The complete country name for the country code

Income Group: classification/grouping of country.There are five levels of income group:
	1.) High Income: nonOECD
	2.) High Income: oECD
	3.) Low Income
	4.) Lower middle income
	5.) Upper middle income
	
Region: geographic classification

Lending Category: lending category
	1.) IDA
	2.) IBRD
	3.) Blend
	
Other Groups: Other lending groups

Currency Unit:currency of country

Latest population census: year when the last census was conducted

Latest household survey: name and data of household survey

Special Notes: this is designated for other comments. This variable will not impact the analysis. 

National accounts base year: base year

National accounts reference year: reference year

System of National Accounts: year

SNA price valuation: System of National Accounts price valuation

Alternative conversion factor: year range

PPP survey year:PPP survey year

Balance of Payments Manual in use: balance

External debt Reporting status: reporting method

System of trade: general vs. special

Government Accounting concept: Consolidated vs. Budgetary

IMF data dissemination standard: GDDS or SDDS

Source of most recent Income and expenditure data: data source

Vital registration complete: Yes or No

Latest agricultural census: Year last taken

Latest industrial data: Year last taken

Latest trade data: Year

Latest water withdrawal data: Year

2-alpha code: two alpha country code

WB-2 code: two alpha country code

Table Name: country name

Short Name: short country name

notes on terms: 

OECD = The Oranisation for Economic co-Operation and Development: "The mission...is to promote policies that will improve the economic and social well-being of people around
the world"(oecd.org/about).

IDA = International Development Association: "...a multi-issue institution, supporting a range of development activities" (ida.worldbank.org/about/what-we-do)

Blend=countries eligible for both IDA and IBRD loans (paraphrased from ida.worldbank.org/about/borrowing-countries)

IBRD = Internaional Bank for REconstruction and Development: "IBRD provides loans and other assistance primarily to middle income countries" (http://www.worldbank.org//en/about/what-we-do/brief/ibrd)

SNA = source (https://stats.oecd.org/glossary/about.asp#Acronyms)
