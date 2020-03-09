# Install the package if you never did
install.packages('UsingR')
# Load the pacakge
library(UsingR)
# Load the cereal dataset
data('UScereal')


#Changes the levels mfr factor
levels(UScereal$mfr) <- c('General Mills', 'Kelloggs',
                          'Nabisco', 'Post', 'Quaker Oats',
                          'Ralston Purina')

#Makes shelf into a factor and sets the levels
UScereal$shelf <- factor(UScereal$shelf)
levels(UScereal$shelf) <- c('low', 'middle', 'high')

#creates a new column and sets it to the dataset rownames
UScereal$product <- rownames(UScereal)

str(UScereal)

