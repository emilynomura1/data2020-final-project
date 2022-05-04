# This file contains data cleaning and preprocessing for the American National
# Election Studies (ANES) time series cumulative data file
# The codebook can be found at the following link:
# https://electionstudies.org/wp-content/uploads/2021/11/anes_timeseries_cdf_codebook_var_20211118.pdf

# Load in libraries ----
library(tidyverse)

# Read in data ----
unzip("data/anes_timeseries.zip", exdir="data/")
df <- read.csv("data/anes_timeseries_cdf_csv_20211118.csv")

# Subset data ----

# Filter for years 2012-2020
df_subset <- df %>%
  filter(VCF0004 %in% c(2012, 2016, 2020))

# Remove unnecessary variables
df_clean <- df_subset[, -c(1,3:33,35,36,38,39,41:43,45,49,50,51,53:59,60:63,65,
                            66,68:79,80:90,92,93,96,97:118,121,126:129,132:136,
                            138,139,142:144,148,149,151:154,157:160,162:211,
                            213:232,234:253,255:274,276:310,315:334,337:339,
                            341:360,362:381,383:402,404:423,425:458,461:477,
                            479:490,491,492:501,504:513,516,517,520,523:530,
                            532:557,559,561:571,573:579,581:585,588:598,600,601,
                            603:634,636:638,640:737,739:816,818:953,955:1029)]

# Clean column values ----
# DESCRIPTIVE OF RESPONDENT
df_clean$VCF0101 <- ifelse(df_clean$VCF0101==0, 
                           NA, 
                           df_clean$VCF0101)
df_clean$VCF0104 <- ifelse(df_clean$VCF0104==0|df_clean$VCF0104==3,
                           NA,
                           df_clean$VCF0104)
df_clean$VCF0106 <- ifelse(df_clean$VCF0106==0|df_clean$VCF0106==9, 
                           NA, 
                           df_clean$VCF0106)
df_clean$VCF0110 <- ifelse(df_clean$VCF0110==0,
                           NA,
                           df_clean$VCF0110)
df_clean$VCF0113 <- ifelse(df_clean$VCF0113==2,
                           0,
                           df_clean$VCF0113)
df_clean$VCF0114 <- ifelse(df_clean$VCF0114==0,
                           NA,
                           df_clean$VCF0114)
df_clean$VCF0118 <- ifelse(df_clean$VCF0118==9,
                           NA,
                           df_clean$VCF0118)
df_clean$VCF0127 <- ifelse(df_clean$VCF0127==0,
                           NA,
                           df_clean$VCF0127)
df_clean$VCF0127 <- ifelse(df_clean$VCF0127==2,
                           0,
                           df_clean$VCF0127)
df_clean$VCF0128 <- ifelse(df_clean$VCF0128==0,
                           NA,
                           df_clean$VCF0128)
df_clean$VCF0143 <- ifelse(df_clean$VCF0143==8|df_clean$VCF0143==9,
                           NA,
                           df_clean$VCF0143)
df_clean$VCF0146 <- ifelse(df_clean$VCF0146==8|df_clean$VCF0146==9,
                           NA,
                           df_clean$VCF0146)
df_clean$VCF0147 <- ifelse(df_clean$VCF0147 %in% c(2,3,4,5,7),
                           0,
                           df_clean$VCF0147)
df_clean$VCF0147 <- ifelse(df_clean$VCF0147==8|df_clean$VCF0147==9,
                           NA,
                           df_clean$VCF0147)
df_clean$VCF0148 <- ifelse(df_clean$VCF0148==9,
                           NA,
                           df_clean$VCF0148)
# THERMOMETER FOR GROUPS
df_clean$VCF0206 <- ifelse(df_clean$VCF0206==98|df_clean$VCF0206==99,
                           NA,
                           df_clean$VCF0206)
df_clean$VCF0207 <- ifelse(df_clean$VCF0207==98|df_clean$VCF0207==99,
                           NA,
                           df_clean$VCF0207)
df_clean$VCF0209 <- ifelse(df_clean$VCF0209==98|df_clean$VCF0209==99,
                           NA,
                           df_clean$VCF0209)
df_clean$VCF0210 <- ifelse(df_clean$VCF0210==98|df_clean$VCF0210==99,
                           NA,
                           df_clean$VCF0210)
df_clean$VCF0211 <- ifelse(df_clean$VCF0211==98|df_clean$VCF0211==99,
                           NA,
                           df_clean$VCF0211)
df_clean$VCF0212 <- ifelse(df_clean$VCF0212==98|df_clean$VCF0212==99,
                           NA,
                           df_clean$VCF0212)
df_clean$VCF0217 <- ifelse(df_clean$VCF0217==98|df_clean$VCF0217==99,
                           NA,
                           df_clean$VCF0217)
df_clean$VCF0218 <- ifelse(df_clean$VCF0218==98|df_clean$VCF0218==99,
                           NA,
                           df_clean$VCF0218)
df_clean$VCF0224 <- ifelse(df_clean$VCF0224==98|df_clean$VCF0224==99,
                           NA,
                           df_clean$VCF0224)
df_clean$VCF0227 <- ifelse(df_clean$VCF0227==98|df_clean$VCF0227==99,
                           NA,
                           df_clean$VCF0227)
df_clean$VCF0228 <- ifelse(df_clean$VCF0228==98|df_clean$VCF0228==99,
                           NA,
                           df_clean$VCF0228)
df_clean$VCF0232 <- ifelse(df_clean$VCF0232==98|df_clean$VCF0232==99,
                           NA,
                           df_clean$VCF0232)
df_clean$VCF0233 <- ifelse(df_clean$VCF0233==98|df_clean$VCF0233==99,
                           NA,
                           df_clean$VCF0233)
df_clean$VCF0234 <- ifelse(df_clean$VCF0234==98|df_clean$VCF0234==99,
                           NA,
                           df_clean$VCF0234)
df_clean$VCF0253 <- ifelse(df_clean$VCF0253==98|df_clean$VCF0253==99,
                           NA,
                           df_clean$VCF0253)
# 
df_clean$VCF0303 <- ifelse(df_clean$VCF0303==0,
                           NA,
                           df_clean$VCF0303)
df_clean$VCF0305 <- ifelse(df_clean$VCF0305==0,
                           NA,
                           df_clean$VCF0305)
df_clean$VCF0310 <- ifelse(df_clean$VCF0310==0|df_clean$VCF0310==9,
                           NA,
                           df_clean$VCF0310)
df_clean$VCF0374 <- ifelse(df_clean$VCF0374==8|df_clean$VCF0374==9,
                           NA,
                           df_clean$VCF0374)
df_clean$VCF0374 <- ifelse(df_clean$VCF0374==5,
                           0,
                           df_clean$VCF0374)
df_clean$VCF0380 <- ifelse(df_clean$VCF0380==8|df_clean$VCF0380==9,
                           NA,
                           df_clean$VCF0380)
df_clean$VCF0380 <- ifelse(df_clean$VCF0380==5,
                           0,
                           df_clean$VCF0380)
df_clean$VCF0386 <- ifelse(df_clean$VCF0386==8|df_clean$VCF0386==9,
                           NA,
                           df_clean$VCF0386)
df_clean$VCF0386 <- ifelse(df_clean$VCF0386==5,
                           0,
                           df_clean$VCF0386)
df_clean$VCF0392 <- ifelse(df_clean$VCF0392==8|df_clean$VCF0392==9,
                           NA,
                           df_clean$VCF0392)
df_clean$VCF0392 <- ifelse(df_clean$VCF0392==5,
                           0,
                           df_clean$VCF0392)
# THERMOMETER FOR POLITICAL FIGURES
df_clean$VCF0424 <- ifelse(df_clean$VCF0424==98|df_clean$VCF0424==99,
                           NA,
                           df_clean$VCF0424)
df_clean$VCF0425 <- ifelse(df_clean$VCF0425==98|df_clean$VCF0425==99,
                           NA,
                           df_clean$VCF0425)
df_clean$VCF0426 <- ifelse(df_clean$VCF0426==98|df_clean$VCF0426==99,
                           NA,
                           df_clean$VCF0426)
df_clean$VCF0427 <- ifelse(df_clean$VCF0427==98|df_clean$VCF0427==99,
                           NA,
                           df_clean$VCF0427)
# APPROVAL OF PRESIDENT AND STRENGTH OF APPROVAL
df_clean$VCF0450 <- ifelse(df_clean$VCF0450==0|df_clean$VCF0450==8,
                           NA,
                           df_clean$VCF0450)
df_clean$VCF0451 <- ifelse(df_clean$VCF0451==0|df_clean$VCF0451==8,
                           NA,
                           df_clean$VCF0451)
# LIKES/DISLIKES ANYTHING ABOUT D/R PRESIDENTIAL CANDIDATE
df_clean$VCF0475 <- ifelse(df_clean$VCF0475==8|df_clean$VCF0475==9,
                           NA,
                           df_clean$VCF0475)
df_clean$VCF0475 <- ifelse(df_clean$VCF0475==5,
                           0,
                           df_clean$VCF0475)
df_clean$VCF0481 <- ifelse(df_clean$VCF0481==8|df_clean$VCF0481==9,
                           NA,
                           df_clean$VCF0481)
df_clean$VCF0481 <- ifelse(df_clean$VCF0481==5,
                           0,
                           df_clean$VCF0481)
df_clean$VCF0487 <- ifelse(df_clean$VCF0487==8|df_clean$VCF0487==9,
                           NA,
                           df_clean$VCF0487)
df_clean$VCF0487 <- ifelse(df_clean$VCF0487==5,
                           0,
                           df_clean$VCF0487)
df_clean$VCF0493 <- ifelse(df_clean$VCF0493==8|df_clean$VCF0493==9,
                           NA,
                           df_clean$VCF0493)
df_clean$VCF0493 <- ifelse(df_clean$VCF0493==5,
                           0,
                           df_clean$VCF0493)
# OPINIONS ON MAJOR PARTIES
df_clean$VCF0501 <- ifelse(df_clean$VCF0501==0|df_clean$VCF0501==9,
                           NA,
                           df_clean$VCF0501)
df_clean$VCF0501 <- ifelse(df_clean$VCF0501==1,
                           0,
                           df_clean$VCF0501)
df_clean$VCF0501 <- ifelse(df_clean$VCF0501==2,
                           1,
                           df_clean$VCF0501)
# OPINION ON FEDERAL GOVERNMENT
df_clean$VCF0605 <- ifelse(df_clean$VCF0605==0,
                           NA,
                           df_clean$VCF0605)
df_clean$VCF0605 <- ifelse(df_clean$VCF0605==9,
                           3,
                           df_clean$VCF0605)
df_clean$VCF0606 <- ifelse(df_clean$VCF0606==0|df_clean$VCF0606==9,
                           NA,
                           df_clean$VCF0606)
#
df_clean$VCF0624 <- ifelse(df_clean$VCF0624==0|df_clean$VCF0624==9,
                           NA,
                           df_clean$VCF0624)
# GOVERNMENT OPINIONS INDEX
df_clean$VCF0656 <- ifelse(df_clean$VCF0656==999,
                           NA,
                           df_clean$VCF0656)
# VOTING HABITS & OPINIONS
df_clean$VCF0702 <- ifelse(df_clean$VCF0702==0,
                           NA,
                           df_clean$VCF0702)
df_clean$VCF0702 <- ifelse(df_clean$VCF0702==1,
                           0,
                           df_clean$VCF0702)
df_clean$VCF0702 <- ifelse(df_clean$VCF0702==2,
                           1,
                           df_clean$VCF0702)
df_clean$VCF0703 <- ifelse(df_clean$VCF0703==0,
                           NA,
                           df_clean$VCF0703)
df_clean$VCF0713 <- ifelse(df_clean$VCF0713==0,
                           NA,
                           df_clean$VCF0713)
df_clean$VCF0713 <- ifelse(df_clean$VCF0713==4|df_clean$VCF0713==9,
                           3,
                           df_clean$VCF0713)
df_clean$VCF0714 <- ifelse(df_clean$VCF0714==0|df_clean$VCF0714==9,
                           NA,
                           df_clean$VCF0714)
df_clean$VCF0714 <- ifelse(df_clean$VCF0714==1,
                           0,
                           df_clean$VCF0714)
df_clean$VCF0714 <- ifelse(df_clean$VCF0714==2,
                           1,
                           df_clean$VCF0714)
df_clean$VCF0717 <- ifelse(df_clean$VCF0717==0,
                           NA,
                           df_clean$VCF0717)
df_clean$VCF0717 <- ifelse(df_clean$VCF0717==1,
                           0,
                           df_clean$VCF0717)
df_clean$VCF0717 <- ifelse(df_clean$VCF0717==2,
                           1,
                           df_clean$VCF0717)
df_clean$VCF0718 <- ifelse(df_clean$VCF0718==0,
                           NA,
                           df_clean$VCF0718)
df_clean$VCF0718 <- ifelse(df_clean$VCF0718==1,
                           0,
                           df_clean$VCF0718)
df_clean$VCF0718 <- ifelse(df_clean$VCF0718==2,
                           1,
                           df_clean$VCF0718)
df_clean$VCF0720 <- ifelse(df_clean$VCF0720==0,
                           NA,
                           df_clean$VCF0720)
df_clean$VCF0720 <- ifelse(df_clean$VCF0720==1,
                           0,
                           df_clean$VCF0720)
df_clean$VCF0720 <- ifelse(df_clean$VCF0720==2,
                           1,
                           df_clean$VCF0720)
df_clean$VCF0721 <- ifelse(df_clean$VCF0721==0,
                           NA,
                           df_clean$VCF0721)
df_clean$VCF0721 <- ifelse(df_clean$VCF0721==1,
                           0,
                           df_clean$VCF0721)
df_clean$VCF0721 <- ifelse(df_clean$VCF0721==2,
                           1,
                           df_clean$VCF0721)
df_clean$VCF0729 <- ifelse(df_clean$VCF0729==0,
                           NA,
                           df_clean$VCF0729)
df_clean$VCF0729 <- ifelse(df_clean$VCF0729==1,
                           0,
                           df_clean$VCF0729)
df_clean$VCF0729 <- ifelse(df_clean$VCF0729==2,
                           1,
                           df_clean$VCF0729)
df_clean$VCF0806 <- ifelse(df_clean$VCF0806==0|df_clean$VCF0806==9,
                           NA,
                           df_clean$VCF0806)
df_clean$VCF0809 <- ifelse(df_clean$VCF0809==0|df_clean$VCF0809==9,
                           NA,
                           df_clean$VCF0809)
df_clean$VCF0823 <- ifelse(df_clean$VCF0823==0|df_clean$VCF0823==9,
                           NA,
                           df_clean$VCF0823)
df_clean$VCF0830 <- ifelse(df_clean$VCF0830==0|df_clean$VCF0830==9,
                           NA,
                           df_clean$VCF0830)
df_clean$VCF0838 <- ifelse(df_clean$VCF0838==0|df_clean$VCF0838==9,
                           NA,
                           df_clean$VCF0838)
df_clean$VCF0839 <- ifelse(df_clean$VCF0839==0|df_clean$VCF0839==9,
                           NA,
                           df_clean$VCF0839)
df_clean$VCF0850 <- ifelse(df_clean$VCF0850==0|df_clean$VCF0850==9,
                           NA,
                           df_clean$VCF0850)
df_clean$VCF0853 <- ifelse(df_clean$VCF0853==9|df_clean$VCF0853==8,
                           NA,
                           df_clean$VCF0853)
df_clean$VCF0890 <- ifelse(df_clean$VCF0890==9|df_clean$VCF0890==8,
                            NA,
                            df_clean$VCF0890)
df_clean$VCF0894 <- ifelse(df_clean$VCF0894==9|df_clean$VCF0894==8,
                           NA,
                           df_clean$VCF0894)
df_clean$VCF0992 <- ifelse(df_clean$VCF0992==9|df_clean$VCF0992==8,
                           NA,
                           df_clean$VCF0992)
df_clean$VCF0992 <- ifelse(df_clean$VCF0992==5,
                           0,
                           df_clean$VCF0992)
df_clean$VCF9009 <- ifelse(df_clean$VCF9009==9|df_clean$VCF9009==8,
                           NA,
                           df_clean$VCF9009)
df_clean$VCF9206 <- ifelse(df_clean$VCF9206==-9|df_clean$VCF9206==-8,
                           NA,
                           df_clean$VCF9206)

# Rename columns ----
colnames = c("year","age","gender","race","education","census_reg","pol_south",
             "fam_income","work_status","union_mem","religion",
             "native_born_parents","fam_own_home","marital_status",
             "therm_black","therm_white","therm_big_busn","therm_unions",
             "therm_liberal","therm_conservative","therm_hisp","therm_dem",
             "therm_rep","therm_aapi","therm_congress","therm_queer",
             "therm_ill_aliens","therm_christian","therm_feminist","party",
             "partisan","interest_in_elec","like_dem","dislike_dem","like_rep",
             "dislike_rep","therm_dem_pres","therm_dem_vpres","therm_rep_pres",
             "therm_rep_vpres","approve_pres","approve_pres_strength",
             "like_dem_pres_cand","dislike_dem_pres_cand","like_rep_pres_cand",
             "dislike_rep_pres_cand","diff_parties",
             "fedgov_fewinterests_or_benefitofall","fedgov_waste_taxmoney",
             "gvt_payattn2_ppl","voted_in_national_elections",
             "register_turnout","presvoteparty_intent","willpres_elec_beclose",
             "infl_others_vote","attend_poltc_mtgs","display_sticker",
             "donate_campaign","quiz_house_majority","health_insurance_scale",
             "jobs_income_scale","betteroff_US_unconcerned_world","aid_blacks",
             "when_abortion","gvmt_spending_scale","bible_authority",
             "trad_values","publicsch_spending","welfare_spending",
             "approveof_congress","approveof_pres_econ","party_control")
names(df_clean) <- colnames

# Final cleaning
# Remove rows w/ NA in outcome
df_final <- subset(df_clean, !is.na(age))

# Remove columns with > 4000 NA
df_final$therm_aapi <- NULL

#print(colSums(is.na(df_final)))

# Omit NAs in columns with < 1000 NAs ----
df_final <- df_final %>% drop_na(gender,race,education,fam_income,
                                    work_status,union_mem,religion,
                                    native_born_parents,marital_status,
                                    therm_dem,therm_rep,party,partisan,
                                    interest_in_elec,like_dem,dislike_dem,
                                    like_rep,dislike_rep,therm_dem_pres,
                                    therm_rep_pres,approve_pres,
                                    approve_pres_strength,like_dem_pres_cand,
                                    dislike_dem_pres_cand,like_rep_pres_cand,
                                    dislike_rep_pres_cand,
                                    fedgov_fewinterests_or_benefitofall,
                                    fedgov_waste_taxmoney,gvt_payattn2_ppl,
                                    willpres_elec_beclose,
                                    betteroff_US_unconcerned_world,
                                    when_abortion,bible_authority,
                                    publicsch_spending,welfare_spending,
                                    approveof_congress,approveof_pres_econ,
                                    party_control)

#print(colSums(is.na(df_final)))

# Create new categories for NAs in certain categorical vars ----
# Then change categorical var to factor
df_final$fam_own_home <- ifelse(is.na(df_final$fam_own_home)==TRUE,
                                3,
                                df_final$fam_own_home)
df_final$fam_own_home <- as.factor(df_final$fam_own_home)
df_final$diff_parties <- ifelse(is.na(df_final$diff_parties)==TRUE,
                                2,
                                df_final$diff_parties)
df_final$diff_parties <- as.factor(df_final$diff_parties)
df_final$voted_in_national_elections <- ifelse(is.na(df_final$voted_in_national_elections)==TRUE,
                                               2,
                                               df_final$voted_in_national_elections)
df_final$voted_in_national_elections <- as.factor(df_final$voted_in_national_elections)
df_final$register_turnout <- ifelse(is.na(df_final$register_turnout)==TRUE,
                                    4,
                                    df_final$register_turnout)
df_final$register_turnout <- as.factor(df_final$register_turnout)
df_final$presvoteparty_intent <- ifelse(is.na(df_final$presvoteparty_intent)==TRUE,
                                        4,
                                        df_final$presvoteparty_intent)
df_final$presvoteparty_intent <- as.factor(df_final$presvoteparty_intent)
df_final$infl_others_vote <- ifelse(is.na(df_final$infl_others_vote)==TRUE,
                                    2,
                                    df_final$infl_others_vote)
df_final$infl_others_vote <- as.factor(df_final$infl_others_vote)
df_final$attend_poltc_mtgs <- ifelse(is.na(df_final$attend_poltc_mtgs)==TRUE,
                                     2,
                                     df_final$attend_poltc_mtgs)
df_final$attend_poltc_mtgs <- as.factor(df_final$attend_poltc_mtgs)
df_final$display_sticker <- ifelse(is.na(df_final$display_sticker)==TRUE,
                                   2,
                                   df_final$display_sticker)
df_final$display_sticker <- as.factor(df_final$display_sticker)
df_final$donate_campaign <- ifelse(is.na(df_final$donate_campaign)==TRUE,
                                   2,
                                   df_final$donate_campaign)
df_final$donate_campaign <- as.factor(df_final$donate_campaign)
df_final$quiz_house_majority <- ifelse(is.na(df_final$quiz_house_majority)==TRUE,
                                   2,
                                   df_final$quiz_house_majority)
df_final$quiz_house_majority <- as.factor(df_final$quiz_house_majority)
df_final$health_insurance_scale <- ifelse(is.na(df_final$health_insurance_scale)==TRUE,
                                       0,
                                       df_final$health_insurance_scale)
df_final$health_insurance_scale <- as.factor(df_final$health_insurance_scale)
df_final$jobs_income_scale <- ifelse(is.na(df_final$jobs_income_scale)==TRUE,
                                          0,
                                          df_final$jobs_income_scale)
df_final$jobs_income_scale <- as.factor(df_final$jobs_income_scale)
df_final$aid_blacks <- ifelse(is.na(df_final$aid_blacks)==TRUE,
                                     0,
                                     df_final$aid_blacks)
df_final$aid_blacks <- as.factor(df_final$aid_blacks)
df_final$gvmt_spending_scale <- ifelse(is.na(df_final$gvmt_spending_scale)==TRUE,
                              0,
                              df_final$gvmt_spending_scale)
df_final$gvmt_spending_scale <- as.factor(df_final$gvmt_spending_scale)
df_final$trad_values <- ifelse(is.na(df_final$trad_values)==TRUE,
                                       0,
                                       df_final$trad_values)
df_final$trad_values <- as.factor(df_final$trad_values)

# Change thermometer vars (continuous) with missing data to categorical ----
# Make NAs another category
# Define function that changes continuous thermometer values to categorical
cont_to_cat <- function(cont_var) {
  cat_var <- ifelse(cont_var > 50, 2, 1)
  cat_var <- ifelse(is.na(cat_var)==TRUE, 0, cat_var)
  return(cat_var)
}

# Define continuous thermometer variables
cont_therm <- c("therm_black","therm_white","therm_big_busn","therm_unions",
                "therm_liberal","therm_conservative","therm_hisp","therm_congress",
                "therm_queer","therm_ill_aliens","therm_christian","therm_feminist",
                "therm_dem_vpres","therm_rep_vpres")

# Apply the function to the continuous thermometer variables
df_final[cont_therm] <- unlist(lapply(df_final[cont_therm], cont_to_cat))

# Change these new categorical variables to factors
df_final[cont_therm] <- lapply(df_final[cont_therm], factor)

# Change all other categorical variables to factors (no missing data)
cat_vars <- names(df_final)
cat_vars <- cat_vars[-c(1,2)]
df_final[cat_vars] <- lapply(df_final[cat_vars], factor)

#print(sapply(df_final, class))

# Save as RDS ----
saveRDS(df_clean, file="data/anes_final.rds")
