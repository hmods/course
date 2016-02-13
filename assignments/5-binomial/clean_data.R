setwd('~/Downloads')
library(dplyr)
d <- read.table('cancer.txt', sep = ',', comment.char = '#', header=TRUE)
d$cohort <- rep(1:8, times = c(367, 70, 31, 17, 48, 49, 31, 86))
d$group <- sample(c('train', 'test'), nrow(d), replace = TRUE)
d$malignant <- as.numeric(d$class == 4)
d <- d %>%
  select(-class) %>%
  arrange(desc(group), cohort, id)
write.csv(d, file = 'breast_cancer.csv', row.names = FALSE)

d <- read.csv('breast_cancer.csv')
d$cohort <- paste0('cohort_', d$cohort)
