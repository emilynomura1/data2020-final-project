# Load in libraries -----
library(tidyverse)

# Read in data -----
unzip("data/anes_timeseries.zip", exdir="data/")
df <- read.csv("data/anes_timeseries_cdf_csv_20211118.csv")

# Clean & subset data ----


# Save as RDS ----
saveRDS(df_clean, file="data/anes_clean")