p = 0.2
n = 0:12
# geometric distribution
dist <- dgeom(x = n, prob = p)
round(dist, 5)

#generating 1000 random variables
beforerand <- rgeom(n = 1000, prob = p)
rand <-beforerand+1

mean_rand <- round(mean(rand),2)
mean_rand
var_rand <- round(var(rand),2)
var_rand
sd_rand <- round(sd(rand),2)
sd_rand

library(dplyr)
library(ggplot2)

data.frame(x = 0:12, prob = dgeom(x = 0:12, prob = p)) %>%
  mutate(Failures = ifelse(x == n, n, "other")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,2), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probability of X = 3 Failures Prior to First Success",
       subtitle = "Geometric(.2)",
       x = "Failures prior to first success (x)",
       y = "Probability") 

hist(rand, main="Histogram of Random Variables",xlab="Random Variables")
