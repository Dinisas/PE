set.seed(4588)
n <- 100 # dimensao dos pares
m <- 5000 #numeros de pares
lambda_H0 <- 2.40
lambda_H1 <- 2.65
k <- 2.623

erro_tipo1 <- 0 #Ho verdadeira mas foi rejeitada pelo teste
erro_tipo2 <- 0 #Ho falsa mas foi aceite pelo teste

for (i in 1:m) {
  # Gerar amostras
  amostra_H0 <- rpois(n, lambda_H0)
  amostra_H1 <- rpois(n, lambda_H1)
  
  # Verificar erro tipo I (H0 verdadeira, mas rejeitada)
  if (mean(amostra_H0) > k) {
    erro_tipo1 <- erro_tipo1 + 1
  }
  
  # Verificar erro tipo II (H1 verdadeira, mas H0 não rejeitada)
  if (mean(amostra_H1) <= k) {
    erro_tipo2 <- erro_tipo2 + 1
  }
}

quociente_erros <- erro_tipo2 / erro_tipo1 
print(quociente_erros)