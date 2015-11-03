# Hierarchical modeling course roadmap

## Learning goals

By the end of this course, graduate students should be able to comfortably:

1. Translate biological problems to hierarchical models
2. Recall and use common probability distributions
3. Think in terms of parameter, process, and observation models
4. Understand multi-level models from a Bayesian perspective

## Outline

### 1. Probability

This serves as a basis for much of what is to come.

- What is probability? Frequentist and Bayesian definitions
- joint probabilities
- independence
- conditioning
- marginalization
- factorization & likelihood (tied to independence)
- Bayes' theorem

### 2. Distributions

The idea here is to give enough background so that we can get into the likelihood and linear regression sections without overwhelming students with a litany of probability distributions.

- PDFs vs. PMFs
- Normal
- Binomial
- Uniform
- Cauchy
- Poisson

### 3. Likelihood

This section should crystallize the first two sections. Everything we do for the rest of the semester relies on an understanding of the likelihood.

- Definition
- Maximization (analytic, with pre-made functions, and via optimization)
- Likelihood profiling for simple models
- Computation in R
- Bayesian inference & MCMC
- Single parameter models: MLE and Bayesian treatments

### 4. Normal linear models

The first round of appetizers. Hopefully students have used `lm` before, and we can get more into depth by approaching this problem from two new angles: optimization of the likelihood function and Bayesian approaches. I suspect this will be a good place to introduce Bayesian inference because the problem of regression should be familiar to most students.

- model of the mean with unknown variance
- linear regression with `lm`
- fit linear regression with `optim`
- assumptions and inference
- Bayesian linear regression: intro to Stan & JAGS
- intro to Bayesian computation and MCMC
- multiple linear regression
- interactions
- making good graphics (show the data!)
- notation and linear algebra review: $X\beta$
- centering x and correlation in estimates
- simulation of data & parameter recovery
- empirically verify properties of frequentist estimators (exercise)

### 5. Binomial models

Here, the students will continue to use a combination of methods for implementation. Key points to take away from this section include the properties/behavior of bionomial models, ways to check binomial modles, and a hint that Bayesian approaches are going to be more flexible.

- binomial distribution
- logit link as a map
- implementation with `glm`, `optim`, Stan, JAGS
- hierarchical model number 1: occupancy model (a classic)
  - review marginalization
- graphical displays
- model checking
- simulation of data & parameter recovery

### 6. Poisson models

Here students should be able to build on their prior knowledge of glms and become familiar with the behavior of Poisson models. The binomial-Poisson hierarchical model is a classic that should reinforce the notion that Bayesian approaches will generally be easier for more complex examples.

- Poisson distribution
- log link as a map
- implementation with `glm`, `optim`, Stan, JAGS
- hierarchical model: binomial-Poisson hierarchy (e.g. # eggs laid & survival)
- graphical displays
- model checking
- overdispersion: quasi-Poisson, Poisson-lognormal with `glmer` and Stan (highlight the occurrence of a hyperparameter here)
- simulation of data & parameter recovery

### 7. Intro to hierarchical models

The main dish. I'd like to avoid a recipe-based approach where we discuss varying intercept and varying slope models as primary objectives. Instead, I think it's important to cover these topics as special cases of the general approach of hierarchical modeling as a means to impose probabilistic structures on parameters. From that perspective, students should be able to better extend these methods for their own work.

- definition
- review previous examples
- varying intercepts (NBA freethrow example) with `lme4` and Stan
- partial pooling
- prediction (new vs. observed groups)
- highlight Bayesian connection to priors
- note crossing of the 'ease' threshold
- parameters for hierarchical variance parameters
- different likelihood functions
- clearing up confusion about nestedness
- introduction to the multivariate normal distribution
- a multi-species experiment: varying responses to treatment
- building structure: explaining variation in responses as a function of species traits
- alternative likelihoods: normal, binomial, Poisson

### 8. Hierarchical model construction

This is where I think we will have the greatest impact on students future work. Translating problems to models is a key skill, and it may take a fair bit of practice. Tools to implement include graphical skills (e.g. drawing DAGs), and familiarity with probability distributions.

- parameter, process, and observation models
- building complexity from simple pieces
- translating biological problems and observations to models
- example: what method works best for detecting a species?
- example: error in variables models
- more practice in developing models (don't necessarily have to implement)

### 9. Student projects

This will help to make the class more valuable for the students, who doubtless have a ton of their own work to do on top of coursework.

- students develop models for their own systems
- student presentations on their projects
