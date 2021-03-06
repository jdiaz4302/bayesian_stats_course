


### Question 2M1 ###
### Part 1
# Packages
library(rethinking)

# Grid, values for "proportion"
p_grid <- seq(from = 0,
              to = 1,
              length.out = 20)

# Prior P(proportion)
prior <- rep(1, 20)

# Likelihood
likelihood <- dbinom(3, size = 3,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")

### Part 2
# Likelihood
likelihood <- dbinom(3, size = 4,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")

### Part 3
# Likelihood
likelihood <- dbinom(5, size = 7,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")


### Question 2M2 ###
### Part 1
# The new prior
prior <- ifelse(p_grid < 0.5, 0, 2)

# Likelihood
likelihood <- dbinom(3, size = 3,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")

### Part 2
# Likelihood
likelihood <- dbinom(3, size = 4,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")

### Part 3
# Likelihood
likelihood <- dbinom(5, size = 7,
                     prob = p_grid)

# Compute the unstandardized posterior
unstd.posterior <- likelihood * prior

# Standardize the posterior
posterior <- unstd.posterior / sum(unstd.posterior)

# Plot it
plot(p_grid, posterior, type = "b",
     xlab = "Proportion that is Water",
     ylab = "Posterior Probability")


### Question 2M3 ###
# Earth is 30% land, Mars is 100%
# You toss a globe, don't know which planet it is, and
# You get land. Show P(Earth|land) = 0.23
# P(Earth|land) = P(land|Earth)*P(Earth)/P(land)
# P(Earth) = 0.5
# P(land|Earth) = 0.3
# P(land) = 10 + 3 / 20 = 0.65
numerator <- 0.5 * 0.3

prob_earth_given_land <- numerator/0.65
# 0.2307692
# 0.23


### Question 2M4 ###
# There are three cards
# One is black on both sides
# One is white on both sides
# One is black on one side while white on the other
# A card is placed with a black side showing
# Show P(other side black|this side black) = 2/3
# P(this side black) = 1/2
# P(this side black|other side black) = 2/3
# P(other side black) = 1/2
numerator <- 2/3 * 1/2

prob_other_side_black_given_this_is <- numerator / (1/2)
# 0.666666666666666667
# 2/3


### Question 2M5 ###
# Another black on both sides card is added
# Calculate P(other side B|this side B)
# P(this side B) = 5/8
# P(this side B|other side B) = 4/5
# P(other side B) = 5/8
numerator <- 4/5 * 5/8

prob_other_side_black_given_this_is <- numerator / (5/8)
# 0.8
# 4/5


### Question 2M6 ###
# Same as 2M4 but black ink is heavy so
# Cards with black faces are less likely
# To get pulled
# 1 way to get B/B - 1B + 1B
# 2 ways to get B/W - 2B + 2W
# 3 ways to get W/W - 3W + 3W
# 12 ways total
# P(this side B) = 4/12 = 1/3
# P(this side B|other side B) = (1 + 1 + 0)/4 = 1/2
# P(other side B) = 4/12 = 1/3
numerator <- 1/3 * 1/2

prob_other_side_black_given_this_is <- numerator / (1/3)
# 0.5
# 1/2


### Question 2M7 ###
# Same as 2M4...
# You draw 1 black face
# Before looking at its other side
# You draw another card, this new face is white
# Show that the P(other side of 1st card is B) = 0.75
# P(other side of 1st card is B|1st card face is B & 2nd card face is W) =
#    P(1st card face is B & 2nd card face is W|other side of 1st card is B) *
#    P(other side of 1st card is B) /
#    P(1st card face is B & 2nd card face is W)
#
# P(1st card face is B & 2nd card face is W) = P(1st card B) * P(1st card B & 2nd card W|1st card B)
# P(1st card B) = 3/6
#
# P(1st card B & 2nd card W|1st card B) = P(1st card B & 2nd card W|1st card B/B) * 2/3  +
#                                         P(1st card B & 2nd card W|1st card B/W) * 1/3
# P(1st card B & 2nd card W|1st card B/B) = 3/4
# P(1st card B & 2nd card W|1st card B/W) = 1/2
# P(1st card B & 2nd card W|1st card B) = (3/4 * 2/3 + 1/2 * 1/3) = (1/2 + 1/6) = 2/3
#
# P(1st card face is B & 2nd card face is W) = (3/6 * 2/3) = 1/3
#
# P(other side of 1st card is B) = 3/6
#
# P(1st card face is B & 2nd card face is W|other side of 1st card is B) = 2/3 * 3/4 = 1/2
numerator <- 1/2 * 1/2

prob_other_side_black_given_this_is <- numerator / (1/3)
# 0.75
# 3/4


# Question 2H1
# Two species of pandas
# Equally common and live in same places
# They look and eat the same
# Only differ in family size
# Species A has 10% chance of twins
# Species B has 20%
# This is considered certain
# Female panda gives birth to twins
# What is P(her next birth is twins)
# P(her next birth is twins) = P(twins|she is A) * P(she is A) +
#                              P(twins|she is B) * P(she is B)
#
# A has 10% of twins, B has 20%, so
# 1/3 chance she is A, 2/3 chance she is B
# P(her next birth is twins) = (1/10 * 1/3 + 2/10 * 2/3)
prob_her_next_birth_is_twins <- 1/30 + 4/30
# 0.1666666666666667
# 1/6


### Question 2H2 ###
# She had twins
# We species B has double (20%) as many twins as species A (10%)
prob_she_is_A <- .10/(.10+.20)
# 0.3333333333
# 1/3


### Question 2H3 ###
# She has 2nd birth
# Not twins, P(she is A) now
prob_A_has_twins <- 0.10

A_prob_half_birth_are_twins <- dbinom(1, size = 2, prob = prob_A_has_twins)

prob_B_has_twins <- 0.20

B_prob_half_birth_are_twins <- dbinom(1, size = 2, prob = prob_B_has_twins)

denominator <- (A_prob_half_birth_are_twins + B_prob_half_birth_are_twins)

prob_she_is_A_now <- A_prob_half_birth_are_twins / denominator
# 0.36


### Question 2H4 ###
# New genetic test to determine panda species
# It isn't perfect though
# P(correctly identifies A) = 0.80
# P(correctly identifies B) = 0.65
### Part 1
# P(test = A|species = A) = 0.80
# P(test = A|species = B) = 0.35
# P(test = B|species = B) = 0.65
# P(test = B|species = A) = 0.20
#
# P(test = A) = P(test = A|species = A) * P(species = A) +
#               P(test = A|species = B) * P(species = B)
#
# P(species = A) = P(species = B) = 0.5
#
prob_test_says_A <- 8/10 * 1/2 + 35/100 * 1/2

prob_test_says_A_correctly <- 8/10 * 1/2 

prob_she_is_A_with_test_saying_so <- prob_test_says_A_correctly / prob_test_says_A
# 0.6956522
#
### Part 2
# incorporate the birth of twins and birth of singleton
# P(species = A) = 0.36
# P(species = B) = 0.64
prob_test_says_A_now <- 8/10 * 36/100 + 35/100 * 64/100

prob_test_says_A_now_correctly <- 8/10 * 36/100

prob_she_is_A_now_with_test_saying_so <- prob_test_says_A_now_correctly / prob_test_says_A_now
# 0.5625


