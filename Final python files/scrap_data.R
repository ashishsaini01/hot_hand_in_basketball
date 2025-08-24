# importing libraries
library(tidyverse)
library(rvest)

# Read PBP table from basketball-reference.com
link2 <- 'https://www.basketball-reference.com/boxscores/pbp/202205130GSW.html'

read_html(link2) #read the link

# Select the PBP table
scrap_data <- 
  read_html(link2) %>%
  html_nodes("#all_pbp") %>%
  html_table()

#scrap_data
# create a dataframe
data_new <- data.frame(scrap_data)           # Duplicate data frame
colnames(data_new) <- data_new[1, ]          # Convert first row to header
head(data_new[-1,])                          # Print updated data frame

# write data into csv file
write.csv(x=data_new[-1,], file="gsw_vs_mem_series_game6.csv")
