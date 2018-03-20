#Visualisation exercies 3: Peters Mutton
#21 March 2018


#Fatty acids including MOA, EOA and MNA accumulate in lamb meat and can make meat
#from older animals taste unpleasant. Another fatty acid, C17:0, also accumlates 
#with age although is not responsible for the unpleasant 'mutton flavour'. 
#C17 is easier to measure than MOA, EOA or MNA; this study investigates whether 
#C17 could be a useful 'proxy' for indicating how 'muttony' meat is likely to taste. 

library(tidyverse)

#1. Upload data and view
df<-read_csv("~/Peters.Mutton/data/raw.data/bcfa_C17_fa.csv")
df

#2. Make the data tidy by placing measurements of fatty acid into one column
df2<- df %>%
  gather(key = fatty.acid, value = measurement, -Year)
df2

#3. Preliminary data exploration
#a. density plot of the data
#Plotting the data without year specified makes C17 have a bimodal distribution
#add a facet wrap by year, and the bimodal distribtuion comes out in the year
#not much variation between the years in the other fatty acids
ggplot(data = df2, aes(x = measurement, fill = fatty.acid)) +  
  geom_density(alpha=0.2) +
  scale_x_log10() +
  facet_wrap(~Year)



ggplot(data = df2, aes(y = measurement, fill = fatty.acid)) +  
  geom_point(alpha=0.2)