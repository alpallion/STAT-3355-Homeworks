# Install the package if you never did
install.packages("ggplot2")
# Load the pacakge
library(ggplot2)
# Load the mpg dataset
data("diamonds")

#the data is skewed left and not noise. This means that more bin numbers better represent the datas trend. That and
#Rices Rule is relativly simple
k <- ceiling(2*(length(diamonds$carat)^(1/3)))

hist(diamonds$carat, xlab = "Carat", 
     breaks = seq(min(diamonds$carat), max(diamonds$carat), length.out = k))

plot(carat ~ price, data = diamonds, col = (as.factor(diamonds$clarity)), xlab = "Price", ylab = "Carat", main = "Carat vs Price",
     type = 'p', pch  = 20, cex = 0.75)
legend("topleft", levels(as.factor(diamonds$clarity)), col = as.factor(diamonds$clarity), pch = 20)


ggplot(data = diamonds) + geom_point(mapping = aes(x = price, y = carat, color = clarity), alpha = 0.3) + 
  scale_colour_brewer(palette = "Dark2") + 
  geom_smooth(mapping = aes(x = price, y = carat, color = clarity), method = 'gam') +
  labs(x = "Price", y = "Carat", title = "Relationship between the Price and Carat of Diamonds")



plot(carat ~ price, data = diamonds, col = diamonds$clarity, xlab = "Price", ylab = "Carat", main = "Carat vs Price",
     type = 'p', pch  = 20, cex = 0.75)

#I1   SI2   SI1   VS2   VS1  VVS2  VVS1    IF
d <- as.data.frame(diamonds)
ggplot(data = diamonds) + geom_point(mapping = aes(y = carat, x = price), color = d$clarity)
ggplot(data = diamonds) + geom_smooth(mapping = aes(y = carat, x = price))


xtabs(~ clarity + cut, data = diamonds)
d <- as.data.frame(xtabs(~ clarity + cut, data = diamonds))


#(a)
ggplot(data = diamonds) + geom_bar(mapping = aes(x = clarity, fill = as.factor(cut)), position = 'dodge') +
  labs(x = "Clarity", y = "Count", title = "Relationship between the Quanitity and Clarity of Specific Cuts of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Cut') 

ggplot(data = diamonds) + geom_bar(mapping = aes(x = clarity, fill = as.factor(cut)), position = 'dodge') +
  facet_grid(cut ~.) +
  labs(x = "Clarity", y = "Count", title = "Relationship between the Quanitity and Clarity of Specific Cuts of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Cut') 

#(b)
ggplot(data = diamonds) + geom_smooth(mapping = aes(x = carat, y = price, color = clarity), method = lm, se = FALSE)+
  labs(x = "Carat", y = "Price", title = "Relationship between the Price and Carat of Specific Clarities of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Clarity') 

#(c)
ggplot(data = diamonds) + geom_boxplot(mapping = aes(x = clarity, y = price, color = cut))+
  labs(x = "Clarity", y = "Price", title = "Relationship between the Price and Clarity of Specific Cuts of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Cut') 

#(d)
ggplot(data = subset(diamonds, round(carat) < 4)) + 
  geom_boxplot(mapping = aes(x = as.factor(round(carat)), y = price, color = cut))+
  labs(x = "Carat", y = "Price", title = "Relationship between the Price and Carat of Specific Cuts of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Cut') 

#(e)
ggplot(data = diamonds, aes(x = depth)) + geom_histogram(aes(y = ..density..), binwidth = 0.1) + facet_grid(cut ~.)+
  labs(x = "Depth", y = "Density", title = "Relationship between the Density of Depth of Specific Cuts of Diamonds") +
  theme_minimal() +
  scale_fill_discrete(name='Cut') 