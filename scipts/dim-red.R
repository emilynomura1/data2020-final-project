# Load in libraries -----
library(tidyverse)
library(FactoMineR)
library(factoextra)

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
