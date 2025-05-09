library(ggplot2)
theme_set(theme_light())
suicides <- read.csv("C:/Users/dinis/OneDrive/Desktop/Projeto_R_PE/master.csv")
suicides <- suicides[suicides$year=="2002" & suicides$age=="55-74 years",]
ggplot(suicides, aes(x = sex, y = suicides.100k.pop, fill = sex)) +
  geom_boxplot() +
  labs(title = "Number of Suicides per 100k Population in 2002 (Age: 55-74 years)",
       x = "Sex",
       y = "Suicides per 100k Population",
       fill = "Sex")




