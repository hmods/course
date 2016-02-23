data {
  // integer inputs
  int n;  // the number of samples
  int n_pred;  // the number of predictors
  int n_cohort;  // the number of cohorts
  int n_test; // number of individuals in the test data


  // integer vector inputs
  int<lower=0, upper=1> y[n];   // observed malignancies
  int<lower=0, upper=1> y_test[n_test];   // observed for test data

  // design matrix
  matrix[n,n_pred + n_cohort] X;
  matrix[n_test, n_pred + n_cohort] X_test;
}

parameters {

  // vector intercept, betas for predictors and cohort means
  vector [n_pred + n_cohort] beta; //
}

model {


  // define priors for continuous predictors
  beta[1:n_pred] ~ cauchy(0, 3);

  // define priors for cohort effects
  beta[n_pred + 1:11] ~ cauchy(0,5);
  beta[12] ~ normal(0,5); #shrinks estimate for cohort 4 towards 50%
  beta[13:n_pred+n_cohort] ~ cauchy(0,5);

  // define the likelihood
  y ~ bernoulli_logit(X*beta);

}

generated quantities {
  real loglik_test;
  vector[n_test] logit_p_test;

  logit_p_test <- X_test * beta;
  loglik_test <- bernoulli_logit_log(y_test, logit_p_test);
  //returns the sum of the log likelihoods (the joint log-likelihood)
}
