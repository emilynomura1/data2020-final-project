# Load in libraries ----
library(tidyverse)
library(GGally)

# Read in data ----
df <- readRDS("data/anes_final.rds")

# response var ----
hist(as.numeric(df$age), 
     main="Histogram of Respondent Age", col="lightblue",
     xlab = "Respondent Age", ylab="Frequency")

# transform response to categorical 
df <- df %>% mutate(age_groups = cut(age, breaks = c(17,25,45,65,100)))
df$age_groups <- as.ordered(df$age_groups)
df <- df[!df$age < 18,]
counts_age_groups <- table(df$age_groups)
barplot(counts_age_groups, main="Respondent Age Groups", col="lightblue",
        xlab = "Age Group", ylab = "Freqeuncy")


# Univariate ----
# therm_black
summary(df$therm_black)
counts_therm_black <- table(df$therm_black)
barplot(counts_therm_black, main="Feelings towards Group: Blacks",
        names.arg=c("Missing", "Negative", "Positive"))

# therm_unions 
summary(df$therm_unions)
counts_therm_unions <- table(df$therm_unions)
barplot(counts_therm_unions, main="Feelings towards Group: Unions",
        names.arg=c("Missing", "Negative", "Positive"))

# interest_in_elec 
summary(df$interest_in_elec)
counts_interest_in_elec <- table(df$interest_in_elec)
barplot(counts_interest_in_elec, main="Interest in the Elections",
        names.arg=c("Not Much", "Somewhat", "Very Much"))

# partisan
summary(df$partisan)
counts_partisan <- table(df$partisan)
barplot(counts_partisan, main="Strength of Partisanship",
        names.arg=c("Independent", "Leaning Independent", "Weak Partisan", "Strong Partisan"))

# approve_pres 
summary(df$approve_pres)
table(df$approve_pres)

# aid_blacks
summary(df$aid_blacks)
counts_aid_blacks <- table(df$aid_blacks)
barplot(counts_aid_blacks, 
        main="Aid to Black Sales (1: Government should help minority groups, 7:Minority groups should help themselves")

# trad_values
summary(df$trad_values)
counts_trad_values <- table(df$trad_values)
barplot(counts_trad_values, 
        main="Emphasise Traditional Values", 
        names.arg=c("Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree", "Missing"))

# publicsch_spending
summary(df$publicsch_spending)

# when_abortions
summary(df$when_abortion)
counts_when_abortion <- table(df$when_abortion)
barplot(counts_when_abortion, 
        main="When Should Abortion Be Allowed", 
        names.arg=c("Never","Woman in Danger","Woman has Personal Reasons", "Always"))


# Multivariate ---- 

# therm_queer vs. interest_in_elec
counts3 <- table(df$therm_queer, df$interest_in_elec)
barplot(counts3)

# interest_in_elec vs. age
boxplot(sqrt(df$age)~df$interest_in_elec, main="Respondent Age by Interest in Election",
        xlab="Interest in Election", ylab="sqrt(Respondent Age", 
        names=c("Not Much","Somewhat","Very Much"), col="lightblue")

# try things with trad_values, partisan, aid_blacks, trad_values, pubsch_spending

summary(df$trad_values)
counts <- table(df$trad_values, df$age_groups)
barplot(counts)

barplot(counts, main="Should There Be More Emphasis on Traditional Values",
        xlab="Age Groups", col=c("grey","darkgreen","green","lightgreen", "lightblue", "darkblue"), beside=TRUE)
legend("topleft",
       legend = c("Missing", "Strongly Agree", "Agree", "Neutral", "Disagree", "Strongly Disagree"),
       pch = 15,
       col = c("grey","darkgreen","green","lightgreen", "lightblue", "darkblue"))






     