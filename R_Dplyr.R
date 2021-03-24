
###################
# Usar R para ETL #
###################

# library in all packages
library(dplyr)
library(ggplot2movies)

# database
data(movies)

# I will create a new database for every change, so the original will be safe

#using rename
movies_rename = movies1 %>%
  dplyr::rename(name = title)

#using mutate
movies_mutate = movies1 %>%
  dplyr::mutate(diff_mean = length-median(length))

#using arrange
movies_arrange = movies1 %>%
  dplyr::arrange(desc(year,title))

#using filter
movies_filter = movies1 %>%
  dplyr::filter(Action == 1)

#using summarise
#I'll use the database on the last exercise (filter)
movies_filter %>%
  dplyr::group_by(Action) %>%
  summarise(n=n())

#we can use a lot of dplyr verbs together as well
data(movies)
str(movies)
action = movies %>% filter(Action==1)
action %>% summarise(n = n())

#if you want to save the database
write.csv(movies, "movies1")
