## gall wasp intercept model prior predictive distribution
# y ~ pois(lambda)
# loglambda ~ n(2, 2)

# start by drawing parameters
ndraw <- 10000
loglambda <- rnorm(ndraw, 1, 1)

# then simulate data using the draws from the prior
y_sim <- rpois(ndraw, lambda = exp(loglambda))
hist(y_sim, breaks = 50)
summary(y_sim)

## Bayesian linear regression
# y ~ n(mu, sigma)
# mu = a + bx
# a ~ n(0, 3)
# b ~ n(0, 3)
# sigma ~ cauchy+(0, 5)

# start by drawing parameters
a <- rnorm(ndraw, 0, 20)
b <- rnorm(ndraw, 0, 3)
sigma <- abs(rnorm(ndraw, 0, 3))
pairs(data.frame(a, b, sigma))

# simulate data using draws from the prior
x <- runif(ndraw, 0, 5)
y <- rnorm(ndraw, a + b * x, sigma)

plot(x, y)
for (i in 1:ndraw) abline(a[i], b[i], col = 2)
points(x, y)
