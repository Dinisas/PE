n <- 4
seed <- 2126
r <- 150
m <- 130
proportions <- numeric(n)

set.seed(seed)

for (i in 1:r) {
  num_lower <- 0
  for (j in 1:m) {
    T = sqrt(n) * rnorm(1) / sqrt(sum(rnorm(n - 1)^2))
    if (T <= -0.9) {
      num_lower = num_lower + 1
    }
  }
  proportions[i] <- num_lower / m
}

result = abs(mean(proportions) - pt(-0.9, df=n))
result_percentage = result * 100
result_percentage <- round(result_percentage, 5)
result_percentage