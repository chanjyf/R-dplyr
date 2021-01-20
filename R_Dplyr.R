
###################
# Usar R para ETL #
###################

# library nos pacotes
library(dplyr)
library(ggplot2movies)

# puxar a base de dados
data(movies)

# eu sempre crio uma nova base para fazer minhas alterações.
# nesse caso vou criar uma base nova para cada alteração

#usar rename
movies_rename = movies1 %>%
  dplyr::rename(name = title)

#usar mutate
movies_mutate = movies1 %>%
  dplyr::mutate(diff_mean = length-median(length))

#usar arrange
movies_arrange = movies1 %>%
  dplyr::arrange(desc(year,title))

#usar filter
movies_filter = movies1 %>%
  dplyr::filter(Action == 1)

#usar summarise
#vou aproveitar a última base
movies_filter %>%
  dplyr::group_by(Action) %>%
  summarise(n=n())

#ou podemos juntar alguns verbos que aprendemos
data(movies)
str(movies)
action = movies %>% filter(Action==1)
action %>% summarise(n = n())

#caso queira salvar a base de dados
write.csv(movies, "movies1")
