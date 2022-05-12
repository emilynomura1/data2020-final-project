library(tidyverse)
library(caret)
library(glmnet)
library(MASS)
library(InformationValue)
library(Metrics)

df <- readRDS('data/anes_final.rds')
df$year <- as.factor(as.numeric(df$year))
sapply(df, class)
colnames(df)
mod <- lm(age~., data = df)
summary(mod)
#plot(mod)

df <- subset(df, select = -c(gender,race,education,census_reg,pol_south,fam_income,  work_status,union_mem,religion,native_born_parents ,fam_own_home,marital_status   ))
##Lasso Regression
smp_size <- floor(0.8 * nrow(df))

## set the seed to make your partition reproducible
set.seed(123)
train_ind <- sample(seq_len(nrow(df)), size = smp_size)

train <- df[train_ind, ]
test <- df[-train_ind, ]

# Create folds for k-fold CV
folds <- createFolds(train$age, k=10)

lambda_seq <- exp(seq(-7,0,0.1))

# Lasso using cross-validation through the caret package
# glmnet - alpha=1 for lasso, alpha=0 for ridge
trainCtrl <- trainControl(method = "cv", index = folds)
lasso_mod_cv <- train(age~.,  # can add interactions/transformations in formula
                      data = train,
                      #preProc = c("scale"), # scale data
                      method = 'glmnet', 
                      trControl = trainCtrl,
                      tuneGrid = expand.grid(alpha = 1, lambda = lambda_seq),
                      # tuning parameters for CV
                      metric =  "RMSE" # can change to RMSE for regression
)
ggplot(lasso_mod_cv)



# Fit the best ridge with lambda on whole data

lasso_mod_best <- lasso_mod_cv$finalModel$lambdaOpt
coes <- as.data.frame(as.matrix(coef(lasso_mod_cv$finalModel, lasso_mod_cv$finalModel$lambdaOpt)))
coes$names <- rownames(coes)
c2 <-coes[coes$s1 != 0,]
c2
coes
unique(substr(c2$names,1,nchar(c2$names)-1))
train_probs <- predict(lasso_mod_cv, train)

train_score <- rmse(train$age, train_probs)
train_score

test_probs <- predict(lasso_mod_cv, test)
test_score <- rmse(test$age, test_probs)
test_score


qqnorm(resid(lasso_mod_cv))
plot(predict(lasso_mod_cv, train),resid(lasso_mod_cv),main = 'Predicted vs. Residuals',xlab="Predicted Values", ylab="Residuals") 
abline(lm(resid(lasso_mod_cv)~predict(lasso_mod_cv, train)))
#cooks.distance(lasso_mod_cv)
rsq <- function (x, y) cor(x, y) ^ 2
rsq(train$age,train_probs)
rsq(test$age,test_probs)

lasso_mod_cv$results
lasso_mod_best
unique(df$partisan)
