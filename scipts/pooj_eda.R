# Load in libraries ----
library(tidyverse)
install.packages('ggpairs')
library(ggpairs)

# Read in data ----
unzip("data/anes_timeseries.zip", exdir="data/")
df_unclean <- read.csv("data/anes_timeseries_cdf_csv_20211118.csv")

# Subset & clean data ----

# Filter for years 2012-2020
df_subset <- df_unclean %>%
  filter(VCF0004 %in% c(2012, 2016, 2020))

# Remove unnecessary variables
df_subset <- df_subset[, -c(1,3:33,35,36,38,39,41:43,45,49,50,51,53:59,60:63,65,
                            66,68:79,80:90,92,93,97:118,121,126:129,132:136,138,
                            139,142:144,148,149,151:154,157:160,162:211,213:232,
                            234:253,255:274,276:310,315:334,337:339,341:360,
                            362:381,383:402,404)] #404:

# response var
hist(sqrt(as.numeric(df_subset$VCF0101)), 
     main="Histogram of sqrt of Respondent Age",
     xlab = "sqrt(Respondent Age)", ylab="Frequency")

# see some relations 
ggpairs(df_subset[,c("VCF0104",
                      "VCF0106", 
                      "VCF0110", 
                      "VCF0450", 
                      "VCF0232", 
                      "VCF0253")])

# summaries 
summary(as.factor(df_subset$VCF0104))

# univariate 
counts <- table(df_subset$VCF0114, df_subset$VCF0303)
barplot(counts, main="Respondent Family Income and Party",
        xlab="Respondent Family Income", ylab="Frequency", 
        col=c("darkblue","blue", "green", "yellow", "orange", "red"),
        legend.text = TRUE,
        args.legend = list(x = "topleft"))

plot(y=as.numeric(df_subset$VCF0310), 
     x=sqrt(as.numeric(df_subset$VCF0101)), 
     xlab="sqrt(Respondent Age)", 
     ylab="Feelings towards Group:Queer")

counts3 <- table(df_subset$VCF0232, df_subset$VCF0310)
barplot(counts3)

boxplot(sqrt(df_subset$VCF0101)~df_subset$VCF0310, main="Respondent Age by Interest in Election",
        xlab="Interest in Election", ylab="sqrt(Respondent Age")
barplot(counts)
# multivar relations
length(df_subset$VCF9048)
length(df_subset$VCF0101)
plot(x=as.numeric(df_subset$VCF0110), 
     y=sqrt(as.numeric(df_subset$VCF0101)), 
     xlab="education", ylab="sqrt(Respondent Age)")

head(df_subset, 10)
     