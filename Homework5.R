# Install the package if you never did
install.packages("ggplot2")
# Load the pacakge
library(ggplot2)
# Load the mpg dataset
data("diamonds")

#PROBLEM 1

#the data is skewed left and not noise. This means that more bin numbers better represent the datas trend. That and
#Rices Rule is relativly simple
k <- ceiling(2*(length(diamonds$carat)^(1/3)))

#(a)
#There are more lower weight diamonds than higher weight ones.
ggplot(data = diamonds, aes(x = carat)) + geom_histogram(bins = k) + 
  labs(x = "Carat", y = "Count", title = "Relationship Between the Amount of Diamonds Within Specific Carat Ranges")

#(b)
#The better the clarity, the more likely the diamond is to have a lower weight.
ggplot(data = diamonds) + geom_point(mapping = aes(x = carat, y = price, color = clarity))

#(c)
#The better the clarity, the more likely the diamond is to have a lower weight. The price and clarity are Sigmoid functions.
ggplot(data = diamonds) + geom_point(mapping = aes(x = carat, y = price, color = clarity), alpha = 0.3) + 
  scale_colour_brewer(palette = "Dark2") + 
  geom_smooth(mapping = aes(x = carat, y = price, color = clarity), method = 'gam') +
  labs(x = "Carat", y = "Price", title = "Relationship between the Price and Carat of Specific Clarity of Diamonds") +
  theme_minimal() + scale_fill_discrete(name='Clarity') 

#(d)
#The better the clarity, the more likely the diamond is to have a lower weight. The price and clarity are polynomial functions.
ggplot(data = diamonds) + geom_point(mapping = aes(x=carat, y=price, color=clarity)) + facet_wrap(~clarity) +
  labs(x = "Carat", y = "Price", title = "Relationship between the Price and Carat of Specific Clarity of Diamonds") +
  theme_minimal() + scale_fill_discrete(name='Clarity') 

#(e)
#The better quality cut, the lower the weight
ggplot(data = diamonds, mapping = aes(y = as.factor(cut), x = carat, color = cut) ) + geom_point() #4

#The better quality cut, the lower the weight
ggplot(data = diamonds, mapping = aes(y = as.factor(cut), x = carat, color = cut) ) + geom_jitter() #3

#The better quality cut, the lower the weight
ggplot(data = diamonds, mapping = aes(y = as.factor(cut), x = carat, color = cut) ) + geom_boxplot() #2

#The better quality cut, the lower the weight
ggplot(data = diamonds, mapping = aes(y = as.factor(cut), x = carat, color = cut) ) + geom_violin() #1


#PROBLEM 2

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