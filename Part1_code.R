#MMA marketing project

#######################
#installation
#######################

#Installing tidyverse
library(tidyverse)
#install ggplot
library(ggplot2)

#Installing dataset
MMA<- read.csv('C:\\Users\\nimas\\Programming excercise\\MMA_marketing_data_sample.csv')

#Viewing dataset
MMA

######################
#Summary stastics
######################

#head/tail
head(MMA)
tail(MMA)

#summary
summary(MMA)

#missing data check
sum(is.na(MMA))

#######################
#Data visualisation:
#######################

##Bank client information

#Histogram: Age distrubtion
ggplot(data.frame(MMA),aes(x=age)) +
  (geom_histogram(stat="Count", fill= "blue", bins=30))+
  labs(title = "Age Distribution", 
       y = "Count",
       x = "Age")

#Histogram :Job
ggplot(data.frame(MMA),aes(y=job)) +
  (geom_histogram(stat="Count", fill= "blue", bins=30))+
  labs(title = "Job Distribution", 
       x = "Count",
       y = "Jobs")

#Histogram: Marital
ggplot(data.frame(MMA), aes(x=marital))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Marital Distribution",
        y= "Count",
        x= "Marital")

#Histogram: Education
ggplot(data.frame(MMA), aes(y=k))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Education Distribution",
       x= "Count",
       y= "Education")

#Histogram: Default

ggplot(data.frame(MMA), aes(x=default))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Credit default Distribution",
       y= "Count",
       x= "Credit is in default")

#Histogram: Housing 

ggplot(data.frame(MMA), aes(x=housing))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Housing loan Distribution",
       y= "Count",
       x= "Housing loan")

#Histogram: Loan

ggplot(data.frame(MMA), aes(x=loan))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Personal loan Distribution",
       y= "Count",
       x= "Personal loan")

##Marketing Campaign information

#Histogram: Contact

ggplot(data.frame(MMA), aes(x=contact))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Contact communication type",
       y= "Count",
       x= "Contact")

#Histogram: Month
ggplot(data.frame(MMA), aes(y=month))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Last contact month of year",
       x= "Count",
       y= "Month")

#Histogram: day of week
ggplot(data.frame(MMA), aes(x=day_of_week))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Last contact day of the week",
       y= "Count",
       x= "Day of week")

#Histogram: Campaign
ggplot(data.frame(MMA), aes(x=campaign))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Number of contacts performed during 
  this campaign and for this client",
       y= "Count",
       x= "Campaign")

#Scatterplot: pdays since 

#Replace all the 999 values (not previously contacted) with NA
MMA2<-replace(MMA, MMA==999, NA)

view(MMA2)

#Scatterplot: pdays
ggplot(data.frame(MMA2), aes(x=pdays))+
  (geom_point(stat="Count",  size=1))+
  labs(title= "Days passed from last client contact, 
           previous campaign",
       y= "Count",
       x= "Days passed")
       

#Histogram: Previous
ggplot(data.frame(MMA), aes(x=previous))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Number of contacts performed before
       this campaign and for this client ",
       y= "Count",
       x= "Previous")

#Histogram:poutcome
ggplot(data.frame(MMA), aes(x=poutcome))+
  (geom_histogram(stat="Count", fill="blue", bins=30))+
  labs(title= "Outcome of previous marketing campaign",
       y= "Count",
       x= "Outcome")

#Scatterplot: emp.var.rate
ggplot(data.frame(MMA), aes(x=emp.var.rate))+
  (geom_point(stat="Count", size=1))+
  labs(title= "Employment variation rate (Quarterly)",
       y= "Count",
       x= "Rate")

#Scatterplot:cons.price.idx
ggplot(data.frame(MMA), aes(x=cons.price.idx))+
  (geom_point(stat="Count", size=1))+
  labs(title= "Consumer price index, monthly indicator",
       y= "Count",
       x= "Price index")

#Scatterplot:cons.conf.idx
ggplot(data.frame(MMA), aes(x=cons.conf.idx))+
  (geom_point(stat="Count", size=1))+
  labs(title= "Consumer confidence index, monthly indictor",
       y= "Count",
       x= "Confidence index")

#Scatterplot: euribor3m
ggplot(data.frame(MMA), aes(x=euribor3m))+
  (geom_point(stat="Count", size=0.7))+
  labs(title= "Euribor 3-month rate, daily indicator",
       y= "Count",
       x= "Rate (%)")

#Scatterplot: nr.employed
ggplot(data.frame(MMA), aes(x=nr.employed))+
  (geom_point(stat="Count", size=0.7))+
  labs(title= "Number of employees, quartely indicator",
       y= "Count",
       x= "Number of employees ")

#Changing name of variable y to outcome

MMA<- MMA %>%
  rename(outcome = y)
MMA$outcome

#Histogram: outcome

ggplot(data.frame(MMA), aes(x = outcome))+
  (geom_histogram(stat="count", fill="blue" ))+
  labs(title= "Outcome, yes/no",
       y= "Count",
       x= "Outcome")
  

######################################################
#Correlations
######################################################

#Return all the NAs to  999 values 

MMA_1<-read.csv('C:\\Users\\nimas\\Programming excercise\\MMA_marketing_data_sample.csv')
view(MMA_1)


#Assessing correlation between consumer price and confidence index

ggplot(data.frame(MMA_1), aes(x=cons.conf.idx, y=cons.price.idx))+
  (geom_point(size=0.7))+
  labs(title= " Consumer confidence and price index",
       y="Confidence",
       x= "Price")

cor(MMA$cons.conf.idx, MMA$cons.price.idx)


#Correlation: Campaign vs duration

ggplot(data.frame(MMA_1), aes(x=campaign, y=duration))+
  (geom_point(size=0.7))+
  labs(title= " Campaign vs duration",
       x="Campaign",
       y= "Duration")
cor(MMA$campaign, MMA$duration)

#Correlation: Duration vs previous

ggplot(data.frame(MMA_1), aes(x=previous, y=duration))+
  (geom_point(size=0.7))+
  labs(title= " Previous vs Duration",
       x="Previous",
       y= "Duration")
cor(MMA$previous, MMA$duration)

#Correlation: Previous vs campaign
ggplot(data.frame(MMA_1), aes(y=campaign, x=previous))+
  (geom_point(size=0.7))+
  labs(title= " Campaign vs Previous",
       y="Campaign",
       x= "Previous")
cor(MMA$previous, MMA$campaign)


#Attempting correlation matrix ( This proved to be difficult hence, 
#it was performed using Python instead)


install.packages("knitr")
library(knitr)
install.packages("tinytex")
tinytex::install_tinytex()


