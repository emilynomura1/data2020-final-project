# Load in libraries -----
library(tidyverse)
library(FactoMineR)
library(factoextra)
library(corrplot)

# Read in cleaned data -----
df <- readRDS("data/anes_final.rds")

# PCA/FAMD -----
# We run a factor analysis for mixed data since our data frame contains a
# great deal of categorical variables.
#https://www.rdocumentation.org/packages/FactoMineR/versions/2.4/topics/FAMD
famd_df <- df
row.names(famd_df) = make.names(row.names(famd_df), unique=TRUE)
famd <- FAMD(famd_df, ncp=7, graph=TRUE)
fviz_famd_var(famd, "quali.var", col.var = "contrib", 
              gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),
              repel = TRUE)
fviz_screeplot(famd)

# FACTOR ANALYSIS ---- 
# Covariance matrix ----
df[] <- lapply(df, function(x) as.numeric(as.character(x)))
df_cov <- cov(df)

# Correlation matrix ----
#cor_mat <- cor(df)
#cor_mat <- round(cor_mat, 2)
#corrplot(cor_mat, type = "upper", tl.srt = 45)

# Factor analysis with 5 factors ----
fa5 <- factanal(covmat= df_cov, factors=5, rotation="varimax")
fa5
fa5$loadings
# heatmap 
fact_df5 <- as.data.frame(fa5$loadings[, 1:5])
fact_df5$var <- rownames(fact_df5)
fact_df5 <- fact_df5 %>% gather("factor","loading",c(Factor1, Factor2, Factor3, Factor4, Factor5))
ggplot(fact_df5)+geom_tile(aes(x=factor, y=var, fill=loading))

# Factor analysis with 10 factors ----
fa10 <- factanal(covmat= df_cov, factors=10, rotation="varimax")
fa10 
fa10$loadings 
fa10$uniquenesses 
apply(fa10$loadings^2,1,sum) 
# heatmap 
fact_df5 <- as.data.frame(fa5$loadings[, 1:5])
fact_df5$var <- rownames(fact_df5)
fact_df5 <- fact_df5 %>% gather("factor","loading",c(Factor1, Factor2, Factor3, Factor4, Factor5))

# Factor analysis with 15 factors 
fa15 <- factanal(covmat= df_cov, factors=15, rotation="varimax")
fa15
fa15$loadings
