# Hierarchical modeling course roadmap

## Learning goals

By the end of this course, graduate students should be able to comfortably:

1. Translate biological problems to hierarchical models
2. Recall and use common probability distributions
3. Think in terms of parameter, process, and observation models
4. Understand multi-level models from a Bayesian perspective

## Outline
### 1. Probability theory

I think there is some good philosophical content here, and it serves as a basis for much of what is to come.

- What is probability? Frequentist vs. Bayesian definitions
- joint probabilities
- independence
- conditioning
- marginalization
- factorization & likelihood (tied to independence)
- Bayes' theorem

### 2. Distribution beastiary: 1

The idea here is to give enough background so that we can get into the likelihood and linear regression sections without overwhelming students with a litany of probability distributions.

- PDFs vs. PMFs
- Normal
- Uniform
- Cauchy
- Half-cauchy

### 3. Likelihood

Hopefully this section can serve to crystallize the first two sections. Everything we do for the rest of the semester relies on an understanding of the likelihood.

- Definition
- Maximization (analytic, with pre-made functions, and via optimization)
- Likelihood profiling for simple models
- Computation in R

### 4. Normal linear models

The first main dish. Hopefully students have used `lm` before, and we can get more into depth by approaching this problem from two new angles: optimization of the likelihood function and Bayesian approaches. I suspect this will be a good place to introduce Bayesian inference because the problem of regression should be familiar to most students.

- linear regression with `lm`
- fit linear regression with `optim`
- assumptions and inference
- Bayesian linear regression: intro to Stan and JAGS
- intro to Bayesian computation and MCMC
- multiple linear regression
- interactions
- making good graphics (show the data!)
- notation and linear algebra review: $X\beta$
- centering x and correlation in estimates
- simulation of data & parameter recovery
- empirically verify properties of frequentist estimators (exercise)

### 5. Binomial models
- binomial distribution
- logit link as a map
- implementation with `glm`, `optim`, Stan, and JAGS
- hierarchical model number 1: occupancy model (a classic)
- graphical displays
- model checking
- simulation of data & parameter recovery

### 6. Poisson models
- Poisson distribution
- log link as a map
- implementation with `glm`, `optim`, Stan, and JAGS
- hierarchical model: binomial-poisson hierarchy (e.g. # eggs laid & survival)
- graphical displays
- model checking
- overdispersion: quasi-poisson, Poisson-lognormal with `glmer` and Stan (highlight the occurrence of a hyperparameter here)
- simulation of data & parameter recovery

### 7. Multilevel models
