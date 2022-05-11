
library(lmtest)
library(InformationValue)
library(nnet)
library(MASS)
library(pROC)
library(glmnet)

# Read in data ----
df <- readRDS("data/anes_final.rds")

# Transform response to categorical 
df <- df %>% mutate(age_groups = cut(age, breaks = c(17,25,45,65,100)))
df$age_groups <- as.ordered(df$age_groups)
df %>% group_by(age_groups) %>% count()

# remove observation with age < 18
df <- df[!df$age < 18,]

# Remove demographic vars 
remove <- c("gender","age","race","education","census_reg",
            "pol_south","fam_income","work_status",
            "union_mem","religion","native_born_parents",
            "fam_own_home","marital_status")
df <- df[ , !(names(df) %in% remove)]

# Train-Test split ----
split1<- sample(c(rep(0, 0.8 * nrow(df)), rep(1, 0.2 * nrow(df))))
train <- df[split1 == 0, ]       
test <- df[split1== 1, ]  

######  GLMNET MODELS  ######

x_train <- model.matrix( ~ .-1, train[,names(test) != "age_groups"])
lm1 = cv.glmnet(x=x_train, y = as.factor(train$age_groups),family = "multinomial", type.multinomial="grouped")
plot(lm1)
optim_lambda <- cvfit$lambda.1se
coef(lm1, s="lambda.1se")

# test model
x_test <- model.matrix( ~ .-1, test[,names(test) != "age_groups"])
pred_y <- predict(lm1, newx = x_test, s = "lambda.1se", type = "class")

# Accuracy = 0.4651
true_y <- test$age_groups
table(pred_y, true_y)

# AUROC = 0.6899
roc.multi4 <- multiclass.roc(true_y, as.ordered(pred_y))
auc(roc.multi4) 

# significant coefs - year, therm_white, therm_big_busn, therm_queer, therm_ill_aliens, 
# therm_feminist, interest_in_elec*, like_rep, therm_dem_vpres, therm_rep_vpres, 
# fedgov_waste_taxmoney, voted_in_national_elections, register_turnout, willpres_elec_beclose, 
# infl_others_vote, attend_poltc_mtgs*, display_sticker, donate_campaign*, quiz_house_majority, 
# betteroff_US_unconcerned_world, trad_values*, publicsch_spending, approveof_congress, party_control

# fit smaller model 
keep <- c("year", "therm_white", "therm_big_busn", "therm_queer", "therm_ill_aliens", 
          "therm_feminist", "partisan", "interest_in_elec", "like_rep", "therm_dem_vpres", "therm_rep_vpres", 
          "fedgov_waste_taxmoney", "voted_in_national_elections", "presvoteparty_intent4", "register_turnout", 
          "willpres_elec_beclose", "infl_others_vote", "attend_poltc_mtgs", "display_sticker", 
          "donate_campaign", "quiz_house_majority", "betteroff_US_unconcerned_world", "aid_blacks", "trad_values", 
          "publicsch_spending", "welfare_spending", "approveof_congress", "party_control", "age_groups")

df_small <- df[ , (names(df) %in% keep)]

# Train-Test split ----
split<- sample(c(rep(0, 0.8 * nrow(df_small)), rep(1, 0.2 * nrow(df_small))))
train_small <- df_small[split == 0, ]       
test_small <- df_small[split== 1, ] 

# fit smaller model with cv 
x_train_small <- model.matrix( ~ .-1, train_small[,names(test_small) != "age_groups"])
cvfit_small = cv.glmnet(x=x_train_small, y = as.factor(train_small$age_groups),family = "multinomial", type.multinomial="grouped")
plot(cvfit_small)
optim_lambda <- cvfit_small$lambda.1se
coef(cvfit_small, s = "lambda.1se")

# test model
x_test_small <- model.matrix( ~ .-1, test_small[,names(test_small) != "age_groups"])
pred_y2 <- predict(cvfit_small, newx = x_test_small, s = "lambda.1se", type = "class")

summary(pred_y2)

# Accuracy 
true_y2 <- test_small$age_groups
table(pred_y2, true_y2)

# AUROC = 0.6864
roc.multi2 <- multiclass.roc(true_y2, as.ordered(pred_y2))
auc(roc.multi2) 

rs <- roc.multi2[['rocs']]
plot.roc(rs[[1]], print.auc=TRUE, print.auc.x=0.4, print.auc.y=0.1)
plot.roc(rs[[2]], print.auc=TRUE, add=TRUE, col=2, print.auc.x=0.4, print.auc.y=0.2)
plot.roc(rs[[3]], print.auc=TRUE, add=TRUE, col=3, print.auc.x=0.4, print.auc.y=0.3)
plot.roc(rs[[4]], print.auc=TRUE, add=TRUE, col=4, print.auc.x=0.4, print.auc.y=0.4)
plot.roc(rs[[5]], print.auc=TRUE, add=TRUE, col=5, print.auc.x=0.4, print.auc.y=0.5)
plot.roc(rs[[6]], print.auc=TRUE, add=TRUE, col=6, print.auc.x=0.4, print.auc.y=0.6)

#sapply(2:length(rs),function(i) lines.roc(rs[[i]],col=i))

# Diagnostics
residuals <- as.numeric(true_y2) - pred_y2

resid(cvfit_small, s="lambda.1se")



