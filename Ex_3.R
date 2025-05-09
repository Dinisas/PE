library(readxl)
library(ggplot2)

countries <- c("Italy", "Latvia", "IEA Total")

electricity_data <- read_xlsx("C:/Users/dinis/OneDrive/Desktop/Projeto_R_PE/electricity.xlsx")
selected_data <- subset(electricity_data, PRODUCT == "Renewables" & YEAR >= 2015 & COUNTRY %in% countries)
selected_data$share_percentage <- as.numeric(selected_data$share) * 100
selected_data$DATE <- as.Date(paste(selected_data$YEAR, selected_data$MONTH, "01", sep = "-"))

ggplot(data=selected_data, aes(x=DATE, y= share_percentage, color=COUNTRY)) +
  geom_point()+
  labs(x = "Date", y = "Renewables (%)", title = "Monthly Evolution of Renewable Energy Proportion") +
  geom_line() +
  ylim(0, 100)
