
library(ggplot2)
library(dplyr)
library(tidyr)
library(lubridate)


df <- read.csv("C:/Users/RAC_P/OneDrive/Documents/UMICH/CSC-302/Final/Datasets/Rise_of_Auto_Pricing_Inventory_Production_FRED.csv")


df$Date <- mdy(df$Date)

df_filtered_2023 <- df %>% filter(Date <= as.Date("2023-12-01"))

print(range(df_filtered_2023$Date)) #assisted with A.I.


ggplot(df, aes(x = Date)) +
  geom_line(aes(y = Consumer_Price_Index, color = "Consumer Price Index"), size = 1.5) +
  geom_line(aes(y = Auto_Production, color = "Auto Production"), size = 1.0) +
  geom_line(aes(y = Auto_Inventory, color = "Auto Inventory"), size = 1.0) +
  labs(title = "Rise of Vehicle Pricing Relative to Auto Production and Inventory",
       x = "Date",
       y = "Index Value") +
  scale_color_manual(name = "Legend",
                     values = c("Consumer Price Index" = "#8fe388",
                                "Auto Production" = "#0072B2",
                                "Auto Inventory" = "#fe8d6d")) +
  scale_x_date(name = "Date",
               limits = c(min(df$Date), as.Date("2023-06-01"))) +
  theme(legend.title.align = 0.5,
        legend.position = c(.15, .9),
        legend.just = c(0,1),
        plot.margin = margin(14, 7, 3, 1.5),
        plot.title = element_text(color = "darkred", size = 13.5, face = "bold"),
        axis.title.x = element_text(color = "darkred", size = 11, face = "bold"),
        axis.title.y = element_text(color = "darkred", size = 11, face = "bold"))  

                    

               