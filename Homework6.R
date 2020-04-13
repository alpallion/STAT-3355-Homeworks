#Probability of getting heads or tails 1/2. Both are independent of each other
#Binomial Distribution : NCx (w^x)(1-w)^N-x
# N = 10, x = 7 vs N = 10, x = 3
#P(H) :
# Step 1: Count how many different ways more than or 7 heads can occure
# Step 2: Use Binomial Distribution to calculate Probability

#P(T) :
# Step 1: Count how many different ways fewer than or 3 tails can occure
# Step 2: Use Binomial Distribution to calculate Probability

# Calculations:
# P(H) = (10C7 + 10C8 + 10C9 + 10C10) * ((0.5)^7 * (0.5)^3) = 0.17
# P(T) = 10C0 + 10C1 + 10C2 + 10C3) * (0.5)^3 * (0.5)^7 = 0.17
# P(T) = P(H)

library(ggplot2)
#Problem 2
die1 <- c(1:6)
die2 <- c(1:6)
set.seed(20200413)
#You need 2 different dice to be rolled
diceRole1 <- sample(die1, 100, replace = TRUE, prob = rep(1/6,6)) 
diceRole2 <- sample(die2, 100, replace = TRUE, prob = rep(1/6,6))
diceRoleSample <- data.frame(roleNumber = diceRole1 + diceRole2)



ggplot(diceRoleSample, aes(x = roleNumber)) + geom_histogram(bins = 11, binwidth = 1, color = "white", fill = "darkgreen") +
  labs(x = "Number Rolled", y = "Times Seen", title = "Number of Times Each Number was Rolled on 2 Dice")

#Mean = Sum of all roll results / amount of rolls
m <- round(mean(diceRoleSample$roleNumber), 2)  #6.60

#Var(x) = (sum of all (x - mean)^2 ) / (number of rolls - 1 )
variance <- round(var(diceRoleSample$roleNumber), digits = 2)  #6.38


#Problem 3
dbinom(10, 54, 0.131)
pbinom(10, 54, 0.131)
qbinom(0.131, 54, 0.131)
rbinom(10, 54, 0.131)
lefties <- data.frame(numLeft = c(0:20), prob = dbinom(0:20, 54, 0.131))
ggplot(data = lefties, aes(x = numLeft, y = prob)) + geom_bar(stat = "identity", fill = "darkgreen") +
  labs(x = "Number of Left Handed Students", y = "Probability of Existing out of 54", 
       title = "Probability Distribution of having x number of students out of 54 be Left Handed")


#Problem 4

#Probability of a cereal box having a height of 10.7 or fewer inches
pnorm(10.7, mean = 12, sd = 0.5)

#Lower Quartile
round(qnorm(0.25, mean = 12, sd = 0.5), digits = 2)

#Upper Quartile
round(qnorm(0.75, mean = 12, sd = 0.5), digits = 2)

#Median Quartile
round(qnorm(0.5, mean = 12, sd = 0.5), digits = 2)