# Hierarchical modeling course roadmap

## Learning goals

By the end of this course, graduate students should be able to comfortably:

1. Translate biological problems to hierarchical models
2. Recall and use common probability distributions
3. Think in terms of parameter, process, and observation models
4. Understand multi-level models from a Bayesian perspective
5. Link model results to graphical outputs and vice versa
6. Understand mixed and random effects models as a subset of hierarchical models

## Outline

### 1. Linear models

The idea here is to understand the mechanics of linear models. Here is where I think a number of key topics can be introduced that will make understanding hierarchical models easier (hopefully), ease the transitions from non-hierarchical to hierarchical models, and allow students to build and fit models with more confidence about what's going on.

#### Priorities

- linear regression with `lm`
- intercepts, "categorical" effects
- varying model structure to estimate effects and standard errors
- interactions as variation in slope estimates for different groups
- centering input variables and intepreting resulting parameters
- assumptions and unarticulated priors
- understanding residual variance (Gaussian)
- understanding all of the above graphically

#### Optional

- understanding and plotting output of lm
- notation and linear algebra review: $X\beta$

#### Reading

Schielzeth, H. 2010. Simple means to improve the interpretability of regression coefficients. Methods in Ecology and Evolution 1:103–113.  

Enqvist, L. 2005. The mistreatment of covariate interaction terms in linear model analyses of behavioural and evolutionary ecology studies. Animal Behaviour 70:967–971.  

Chapters from Gelman and Hill on linear modeling

### (2). Probability and Distributions

I'm not convinced that this material should be a class on its own in a short modeling based course and I wonder whether it could spread out among other class periods where necessary.

- What is probability?
- joint probabilities
- independence
- conditioning
- marginalization
- factorization & likelihood (tied to independence)
- PDFs vs. PMFs
- Normal
- Binomial
- Uniform
- Cauchy
- Poisson


### 2. Fitting linear models (Likelihood Approaches)

My thought here is to combine the probability and likelihood functions directly with simple model fitting. May or may not be too much for one class, but I worry that a classes just on probability distributions and likilhood wouldn't be practical enough for a short course. 

Hopefully students have used `lm` before, and we can get more into depth by approaching this problem from two new angles: optimization of the likelihood function and Bayesian approaches. I suspect this will be a good place to introduce Bayesian inference because the problem of regression should be familiar to most students.

#### Priorities

- definition of likelihood
- single parameter models: MLE and optim
- model of the mean with unknown variance 
- fitting simple linear models with liklihood (glm with gaussian link?)
- assumptions and inference
- separation (as a preview of why priors are nice...)

#### Optional

- restricted maximum likelihood vs. maximum likelihood


### 3. Fitting linear models (Bayesian Approaches)

#### Priorities

- Bayes' theorem and Bayesian probability
- relationsihp between likelihood and Bayesian inference
- priors (generally, informative vs. non-informative)
- interpreting posterior disributions (mean, mode, intervals)
- intro to Bayesian computation and MCMC
- single parameter models: MLE vs. Bayesian treatments
- Bayesian linear regression: intro to Stan & JAGS

#### Optional

- comparing posterior distributions for different parameter estimates (i.e. are they "significantly" different)
- proper vs. improper priors 

### 4. Generalized Linear models (Poisson models)

Here is my preference for teaching Poisson models first. I (personally) prefer to start with poisson because (1) IMO log links are more intuitive than logit (probit etc) links (2) latent variables remain between zero and infinity (3) IMO overdispersion is easier to understand than in binomial models

#### Priorties

- non-gaussian data (counts, proportions, binary, exponential)
- link functions and latent variables
- Poisson distribution
- log link as a map (what are we actually estimating -- mean or rate)
- understanding effects sizes in Poisson models
- dependence of mean and variance in non-Gaussian models 
- overdispersion : quasi-Poisson and negative-binomial
- overdispersion as unaccounted for variation (maybe a simple example -- sex effects)
- implementation with `glm`, Stan, JAGS
- graphical displays 
- model checking


#### Optional
- simulation of data & parameter recovery


### 4. Binomial models

Here, the students will continue to use a combination of methods for implementation. Key points to take away from this section include the properties/behavior of bionomial models, ways to check binomial modles, and a hint that Bayesian approaches are going to be more flexible.  The binomial-Poisson hierarchical model is a classic that should reinforce the notion that Bayesian approaches will generally be easier for more complex examples.

#### Priorities

- binomial distribution (relationship between mean and variance)
- logit link as a map
- proportion vs. binary models (will help with understanding hierarchical models later)
- implementation with `glm`
- overdispersion in proportion models and understanding the difference between individual and group level probabilities
- implementation with  Stan, JAGS
- hierarchical model number 1: occupancy model (a classic) (maybe, or we could do it later)
  - review marginalization 
- graphical displays
- model checking

#### Optional

- simulation of data & parameter recovery



### 5. Intro to hierarchical models (Part I - Partial pooling and likelihood)

The main dish. I'd like to avoid a recipe-based approach where we discuss varying intercept and varying slope models as primary objectives. Instead, I think it's important to cover these topics as special cases of the general approach of hierarchical modeling as a means to impose probabilistic structures on parameters. From that perspective, students should be able to better extend these methods for their own work.

#### Priorities

- definition
- review previous examples
- hyperparameters (they've always been there even when we don't acknowledge them)
- varying intercepts (NBA freethrow example) with `lme4`
- partial pooling
- clearing up confusion about nestedness
- simple hierarchical models with likelihood
- continous predictors for multiple levels

#### Optional

- plotting estimates for different levels from lme4 models


### 6. Intro to hierarchical models (Part II - Bayesian)

#### Priorities

- varying intercepts (NBA freethrow example) with `Stan`
- hierarchical models in Stan
- highlight Bayesian connection to priors
- classic examples: 
    - hierarchical model number 1: occupancy model (a classic)
    - hierarchical model: binomial-Poisson hierarchy (e.g. # eggs laid & survival)
- introduction to the multivariate normal distribution
- parameters for hierarchical variance parameters
- prediction (new vs. observed groups)
- priors 
- note crossing of the 'ease' threshold (?)


#### Optional

- posterior prediction
- basic Bayesian models in MCMCglmm
- random effects, fixed effects, mixed effects models as special instances of hierarchical linear models



#### Reading

Gelman, A., J. Hill, and M. Yajima. 2012. Why We (Usually) Don’t Have to Worry About Multiple Comparisons. Journal of Research on Educational Effectiveness 5:189–211.  
Gelman and Hill discussion of random effects terminology (very good)

### 7. Hierarchical model construction

This is where I think we will have the greatest impact on students future work. Translating problems to models is a key skill, and it may take a fair bit of practice. Tools to implement include graphical skills (e.g. drawing DAGs), and familiarity with probability distributions.

- parameter, process, and observation models
- building complexity from simple pieces
- translating biological problems and observations to models
- example: what method works best for detecting a species?
- example: error in variables models
- more practice in developing models (don't necessarily have to implement)

### 8. Comparing between models 

I envisions this as occuring a bit more ad hoc during the second half as students start to build their own models

- start with simpler models and build (may be counterintuitive for those used to step-down procedures)
- posterior prediction
- DIC, wAIC
- cross-checking
- simulated data

#### Reading

Hooten, M. B., and N. T. Hobbs. 2015. A guide to Bayesian model selection for ecologists. Ecological Monographs 85:3–28.  



### 9. Student projects

This will help to make the class more valuable for the students, who doubtless have a ton of their own work to do on top of coursework.

- students develop models for their own systems
- student presentations on their projects
