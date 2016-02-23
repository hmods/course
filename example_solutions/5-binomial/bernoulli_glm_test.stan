data {
  int n; // sample size
  int p; // number of coefficients
  matrix[n, p] X;
  int y[n];
  int n_test;
  int y_test[n_test];
  matrix[n_test, p] X_test;
}

parameters {
  vector[p] beta;
}

model {
  beta ~ normal(0, 1);
  y ~ bernoulli_logit(X * beta);
}


generated quantities {
  // I wrote this section for you as a hint
  real loglik_test;
  vector[n_test] logit_p_test;
  
  logit_p_test <- X_test * beta;
  loglik_test <- bernoulli_logit_log(y_test, logit_p_test);  
  //returns the sum of the log likelihoods (the joint log-likelihood)
}
