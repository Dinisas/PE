library(ggplot2)
theme_set(theme_light())

paises_pib <- read.csv("C:/Users/dinis/OneDrive/Desktop/Projeto_R_PE/Paises_PIB_ICH.csv")
continentes <- c("Americas","Europe")
paises_pib <- paises_pib[paises_pib$Continent %in%continentes,]
paises_especiais <- c("Lithuania", "Iceland", "United States", "Saint Lucia")
paises_especiais_simbolo <-paises_pib[paises_pib$Country %in% paises_especiais,]

ggplot(paises_pib) + geom_point(aes(x = GDP, y = HCI, color = Continent)) + scale_x_log10() +
  geom_point(data=paises_especiais_simbolo,aes(x = GDP, y = HCI, shape = Country), size = 2.5)+
  geom_text(data = paises_especiais_simbolo, aes(x = GDP, y = HCI, label = Country), size = 2.5, nudge_x = 0.01, nudge_y = 0.01) +
  scale_shape_manual(values = c(18, 17, 16, 15))+
  labs(x = "GDP per capita (log scale)", y = "Human Capital Index", title = "Human Capital Index vs GDP in Europe and Americas" )
