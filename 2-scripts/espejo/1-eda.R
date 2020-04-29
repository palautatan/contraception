library(readr)
library(dplyr)
library(ggplot2)
library(ggmosaic)

contra <- read_csv('../../1-data/contraceptive_for_students.csv')

# palette=['#27706B', '#DF6589', '#FFC3AF']
palette <- c('#27706B', '#DF6589', '#FCFAF1', '#FFC3AF')

contra %>%
  select(c(husband_education, wife_education)) %>%
  ggplot() +
    geom_mosaic(aes(x=product(husband_education, wife_education), fill=as.factor(husband_education)), alpha=1) +
    xlab('Wife - Education Level') +
    ylab('Husband - Education Level') +
    ggtitle('Education Levels Between Husbands and Wives') +
    labs(fill='Husband - Education Level') +
    scale_fill_manual(values=palette) +
    theme_classic()
ggsave('../../4-visuals/mosaic-education-levels.png', height=10, width=10, dpi=400)  


# new_age <- vector(mode='list', length=nrow(contra))
# new_age[contra$wife_age < 50] <- '4'
# new_age[contra$wife_age < 40] <- '3'
# new_age[contra$wife_age < 30] <- '2'
# new_age[contra$wife_age < 20] <- '1'
# 
# 
# contra$new_age <- unlist(new_age)
# 
# 
# contra %>%
#   select(c(wife_age, contraceptive)) %>%
#   reshape2::melt(id.vars='contraceptive') %>%
#   ggplot(aes(x=contraceptive, y=value, fill=value)) +
#     geom_bar(stat='identity', position='dodge') +
#     scale_fill_gradient2(low=palette[3], mid=palette[2], high=palette[4]) +
#     theme_classic() +
#     xlab('Choice of Contraception') +
#     ylab('Wife Age') +
#     ggtitle('Age by Contraception Choices') +
#     labs(fill='Husband - Education Level') 
