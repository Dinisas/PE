#X~normal(mu,sigma^2), Z=((n-1)s^2)/sigma^2 ~ X^2(n-1)

set.seed(1592)
obs <- c(31.8,31.7,35.2,37.1,31.7,36.1,36.3,33.2,34.3,37.5,30.4,34.6,32.4,31.7,30.2,34.3,35.6,34.9,38.9)
n <- 12 #tamanho da amostra

amostra <- sample(obs,n,replace='False')
gamma <- 0.96

a <- qchisq((1 - gamma)/2, df = n-1)
a
b <- qchisq((1 + gamma)/2, df = n-1)
b
intervalo_confianca <- c(((n-1)*var(amostra))/b, ((n-1)*var(amostra))/a) #intervalo de confianca para alpha=0.04
intervalo_confianca

if (!requireNamespace("pracma", quietly = TRUE)) {
  install.packages("pracma")
}
library(pracma)

equations <- function(x) {
  c_val<- x[1]
  d_val<- x[2]
  
  # Primeira equação
  eq1 <- pchisq(d_val, df = n-1) - pchisq(c_val, df = n-1) - gamma
  
  # Segunda equação
  eq2 <- dchisq(d_val, df = n+3) - dchisq(c_val, df = n+3)
  
  return(c(eq1, eq2))
}

# Valor inicial
initial_guess <- c(a, b)

# Resolver as equações para obter (c, d)
solution <- fsolve(f=equations, initial_guess)$x

# Os valores de (c, d)
c<- solution[1]
d<- solution[2]

# Intervalo de confiança revisado para a variância
intervalo_confianca_novo <- c(((n-1)*var(amostra))/d, ((n-1)*var(amostra))/c)
intervalo_confianca_novo

amplitude_original <- intervalo_confianca[2] - intervalo_confianca[1]

# Amplitude do intervalo de confiança revisado
amplitude_nova <- intervalo_confianca_novo[2] - intervalo_confianca_novo[1]

# Diferença entre as amplitudes, arredondada a três casas decimais
diferenca <- round(abs(amplitude_nova - amplitude_original), 3)
print(diferenca)
