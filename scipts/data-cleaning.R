# This file contains data cleaning and preprocessing for the American National
# Election Studies (ANES) time series cumulative data file
# The codebook can be found at the following link:
# https://electionstudies.org/wp-content/uploads/2021/11/anes_timeseries_cdf_codebook_var_20211118.pdf

# Load in libraries ----
library(tidyverse)

# Read in data ----
unzip("data/anes_timeseries.zip", exdir="data/")
df <- read.csv("data/anes_timeseries_cdf_csv_20211118.csv")

# Subset & clean data ----

# Filter for years 2012-2020
df_subset <- df %>%
  filter(VCF0004 %in% c(2012, 2016, 2020))

# Remove unnecessary variables
df_subset <- df_subset[, -c(1,3:33,35,36,38,39,41:43,45,49,50,51,53:59,60:63,65,
                            66,68:79,80:90,92,93,97:118,121,126:129,132:136,138,
                            139,142:144,148,149,151:154,157:160,162:211,213:232,
                            234:253,255:274,276:310,315:334,337:339,341:360,
                            362:381,383:402,404)] #404:
df_clean <- df_subset

# Clean column values
# DESCRIPTIVE OF RESPONDENT
df_clean$VCF0101 <- ifelse(df_subset$VCF0101==0, 
                           NA, 
                           df_subset$VCF0101)
df_clean$VCF0104 <- ifelse(df_subset$VCF0104==0,
                           NA,
                           df_subset$VCF0104)
df_clean$VCF0106 <- ifelse(df_subset$VCF0106==0|df_subset$VCF0106==9, 
                           NA, 
                           df_subset$VCF0106)
df_clean$VCF0110 <- ifelse(df_subset$VCF0110==0,
                           NA,
                           df_subset$VCF0110)
df_clean$VCF0113 <- ifelse(df_subset$VCF0113==2,
                           0,
                           df_subset$VCF0113)
df_clean$VCF0114 <- ifelse(df_subset$VCF0114==0,
                           NA,
                           df_subset$VCF0114)
df_clean$VCF0118 <- ifelse(df_subset$VCF0118==9,
                           NA,
                           df_subset$VCF0118)
df_clean$VCF0127 <- ifelse(df_subset$VCF0127==0,
                           NA,
                           df_subset$VCF0127)
df_clean$VCF0127 <- ifelse(df_clean$VCF0127==2,
                           0,
                           df_clean$VCF0127)
df_clean$VCF0128 <- ifelse(df_subset$VCF0128==0,
                           NA,
                           df_subset$VCF0128)
df_clean$VCF0143 <- ifelse(df_subset$VCF0143==8|df_subset$VCF0143==9,
                           NA,
                           df_subset$VCF0143)
df_clean$VCF0146 <- ifelse(df_subset$VCF0146==8|df_subset$VCF0146==9,
                           NA,
                           df_subset$VCF0146)
df_clean$VCF0147 <- ifelse(df_subset$VCF0147 %in% c(2,3,4,5,7),
                           0,
                           df_subset$VCF0147)
df_clean$VCF0147 <- ifelse(df_clean$VCF0147==8|df_clean$VCF0147==9,
                           NA,
                           df_clean$VCF0147)
df_clean$VCF0148 <- ifelse(df_subset$VCF0148==9,
                           NA,
                           df_subset$VCF0148)
# THERMOMETER FOR GROUPS
df_clean$VCF0206 <- ifelse(df_subset$VCF0206==98|df_subset$VCF0206==99,
                           NA,
                           df_subset$VCF0206)
df_clean$VCF0207 <- ifelse(df_subset$VCF0207==98|df_subset$VCF0207==99,
                           NA,
                           df_subset$VCF0207)
df_clean$VCF0209 <- ifelse(df_subset$VCF0209==98|df_subset$VCF0209==99,
                           NA,
                           df_subset$VCF0209)
df_clean$VCF0210 <- ifelse(df_subset$VCF0210==98|df_subset$VCF0210==99,
                           NA,
                           df_subset$VCF0210)
df_clean$VCF0211 <- ifelse(df_subset$VCF0211==98|df_subset$VCF0211==99,
                           NA,
                           df_subset$VCF0211)
df_clean$VCF0212 <- ifelse(df_subset$VCF0212==98|df_subset$VCF0212==99,
                           NA,
                           df_subset$VCF0212)
df_clean$VCF0217 <- ifelse(df_subset$VCF0217==98|df_subset$VCF0217==99,
                           NA,
                           df_subset$VCF0217)
df_clean$VCF0218 <- ifelse(df_subset$VCF0218==98|df_subset$VCF0218==99,
                           NA,
                           df_subset$VCF0218)
df_clean$VCF0224 <- ifelse(df_subset$VCF0224==98|df_subset$VCF0224==99,
                           NA,
                           df_subset$VCF0224)
df_clean$VCF0227 <- ifelse(df_subset$VCF0227==98|df_subset$VCF0227==99,
                           NA,
                           df_subset$VCF0227)
df_clean$VCF0228 <- ifelse(df_subset$VCF0228==98|df_subset$VCF0228==99,
                           NA,
                           df_subset$VCF0228)
df_clean$VCF0232 <- ifelse(df_subset$VCF0232==98|df_subset$VCF0232==99,
                           NA,
                           df_subset$VCF0232)
df_clean$VCF0233 <- ifelse(df_subset$VCF0233==98|df_subset$VCF0233==99,
                           NA,
                           df_subset$VCF0233)
df_clean$VCF0234 <- ifelse(df_subset$VCF0234==98|df_subset$VCF0234==99,
                           NA,
                           df_subset$VCF0234)
df_clean$VCF0253 <- ifelse(df_subset$VCF0253==98|df_subset$VCF0253==99,
                           NA,
                           df_subset$VCF0253)
# 
df_clean$VCF0303 <- ifelse(df_subset$VCF0303==0,
                           NA,
                           df_subset$VCF0303)
df_clean$VCF0305 <- ifelse(df_subset$VCF0305==0,
                           NA,
                           df_subset$VCF0305)
df_clean$VCF0310 <- ifelse(df_subset$VCF0310==0|df_subset$VCF0310==9,
                           NA,
                           df_subset$VCF0310)
df_clean$VCF0374 <- ifelse(df_subset$VCF0374==8|df_subset$VCF0374==9,
                           NA,
                           df_subset$VCF0374)
df_clean$VCF0374 <- ifelse(df_clean$VCF0374==5,
                           0,
                           df_clean$VCF0374)
df_clean$VCF0380 <- ifelse(df_subset$VCF0380==8|df_subset$VCF0380==9,
                           NA,
                           df_subset$VCF0380)
df_clean$VCF0380 <- ifelse(df_clean$VCF0380==5,
                           0,
                           df_clean$VCF0380)
df_clean$VCF0386 <- ifelse(df_subset$VCF0386==8|df_subset$VCF0386==9,
                           NA,
                           df_subset$VCF0386)
df_clean$VCF0386 <- ifelse(df_clean$VCF0386==5,
                           0,
                           df_clean$VCF0386)
df_clean$VCF0392 <- ifelse(df_subset$VCF0392==8|df_subset$VCF0392==9,
                           NA,
                           df_subset$VCF0392)
df_clean$VCF0392 <- ifelse(df_clean$VCF0392==5,
                           0,
                           df_clean$VCF0392)
# THERMOMETER FOR POLITICAL FIGURES
df_clean$VCF0424 <- ifelse(df_subset$VCF0424==98|df_subset$VCF0424==99,
                           NA,
                           df_subset$VCF0424)
df_clean$VCF0425 <- ifelse(df_subset$VCF0425==98|df_subset$VCF0425==99,
                           NA,
                           df_subset$VCF0425)
df_clean$VCF0426 <- ifelse(df_subset$VCF0426==98|df_subset$VCF0426==99,
                           NA,
                           df_subset$VCF0426)
df_clean$VCF0427 <- ifelse(df_subset$VCF0427==98|df_subset$VCF0427==99,
                           NA,
                           df_subset$VCF0427)
# APPROVAL OF PRESIDENT AND STRENGTH OF APPROVAL
df_clean$VCF0450 <- ifelse(df_subset$VCF0450==0|df_subset$VCF0450==8,
                           NA,
                           df_subset$VCF0450)
df_clean$VCF0451 <- ifelse(df_subset$VCF0451==0|df_subset$VCF0451==8,
                           NA,
                           df_subset$VCF0451)
# LIKES/DISLIKES ANYTHING ABOUT D/R PRESIDENTIAL CANDIDATE
df_clean$VCF0475 <- ifelse(df_subset$VCF0475==8|df_subset$VCF0475==9,
                           NA,
                           df_subset$VCF0475)
df_clean$VCF0475 <- ifelse(df_clean$VCF0475==5,
                           0,
                           df_clean$VCF0475)
df_clean$VCF0481 <- ifelse(df_subset$VCF0481==8|df_subset$VCF0481==9,
                           NA,
                           df_subset$VCF0481)
df_clean$VCF0481 <- ifelse(df_clean$VCF0481==5,
                           0,
                           df_clean$VCF0481)
df_clean$VCF0487 <- ifelse(df_subset$VCF0487==8|df_subset$VCF0487==9,
                           NA,
                           df_subset$VCF0487)
df_clean$VCF0487 <- ifelse(df_clean$VCF0487==5,
                           0,
                           df_clean$VCF0487)
df_clean$VCF0493 <- ifelse(df_subset$VCF0493==8|df_subset$VCF0493==9,
                           NA,
                           df_subset$VCF0493)
df_clean$VCF0493 <- ifelse(df_clean$VCF0493==5,
                           0,
                           df_clean$VCF0493)
# OPINIONS ON MAJOR PARTIES


# Rename columns


# Save as RDS ----

saveRDS(df_clean, file="data/anes_clean")