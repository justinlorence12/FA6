p = 0.2
n = 0:12
# geometric distribution
dist <- dgeom(x = n, prob = p)
round(dist, 5)

#generating 1000 random variables
rand <- rgeom(n = 1000, prob = p)
mean_rand <- mean(rand)
mean_rand
var_rand <- var(rand)
var_rand
sd_rand <- sd(rand)
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
