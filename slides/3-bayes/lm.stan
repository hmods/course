data {
  int n;
  int p;
  matrix[n, p] X;
  vector[n] y;
}

parameters {
  vector[p] beta;
  real<lower=0> sigma;
}

model {
  beta ~ normal(0, 2);
  sigma ~ cauchy(0, 5);
  y ~ normal(X * beta, sigma);
}
