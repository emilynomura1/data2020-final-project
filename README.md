# Predicting Age from Political Views Using the American National Election Studies (ANES) Time Series Cumulative Dataset
Often times, political campaign teams are interested in finding and targeting certain demographics of people who are more likely to engage with the campaign and vote in their favor. Given the increasing separation of views between different generations like Gen Z and Boomers, it may be helpful to examine the relationship between age and political views, if any. Our guiding question for this project is as follows:

Can we predict an individual's age from their political views?

## Data Overview
The ANES time series cumulative dataset contains survey data from 1948-2020 in 4 year presidential cycles. The codebook can be found [here](https://electionstudies.org/wp-content/uploads/2021/11/anes_timeseries_cdf_codebook_var_20211118.pdf). Participants were asked an extensive range of questions. The data contained a great variety of information such as participant demographics, opinions on political figures and parties, "thermometer" feelings towards certain racial, religious, and cultural groups, and more. The participants differed from year to year, so all subjects are assumed to be independent. For certain years, there were only 4000-8000 survey participants, so the survey subset is not representative of the entire U.S. population.

### Exploratory Data Analysis
The distribution of the outcome variable is relatively normal. No transformations were applied to age during modeling.
![Age Histogram](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/age-hist.png?raw=true)
Certain predictors of interests do seem to vary with age. Particularly, participant interest in election and the level of agreement with the survey question "should there be more emphasis on traditional values?"
![Interest in Election Boxplot](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/interest-in-elec.png?raw=true)
![Traditional Values Barplot](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/trad-values.png?raw=true)

## Cleaning and Preprocessing
Some survey questions asked the participant's opinion on current events (e.g. civil rights in the year 1964, COVID-19 in the year 2020, etc.), so the data was filtered to only include the most recent consecutive years: 2012, 2016, and 2020. This minimized the amount of missing data in questions related to current events. 71 out of the total 1029 variables were kept prior to exploratory data analysis. Continuous "thermometer" variables that measured how positively or negatively a participant felt toward a particular group of people were coerced into two categories representing if the participant "liked" or "dislike" the group in question. Some variables contained a great deal of missing data. Therefore, a threshold value of 1000 was set to deal with the missing data. If a variable contained less than 1000 NAs, these observations were entirely omitted from the final subset of data. Alternatively, if a variable contained more than 1000 NAs, a new category was created to account for the large portion of missing data. Before modeling, demographic variables such as race and gender were removed. Finally, all variables except for age were converted to factors. 

### Dimension Reduction
After taking a smaller subset of the ANES time series cumulative dataset, there were still 58 predictors remaining. Thus, a factor analysis of mixed data (FAMD) and a classic factor analysis were run in hopes of reducing the dimensionality of the data. The classic factor analysis with 10 factors achieved a cumulative variance explained of around 45%. However, the factors were not grouped in an interpretable way, so reduced dimensions or factors were not used in the final analysis.
![Scree Plot, FAMD](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/famd.png?raw=true)
![Factor Table](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/10-factors.png?raw=true)

## Modeling and Results
### Lasso
A Lasso linear regression model was built to aid in variable selection. The election year was kept in the model as an ordinal predictor to account for the longitudinal nature of the data. 10-fold cross validation was conducted in order to select the best lambda value. Several interaction terms between party-related variables and opinions on specific issues were added into the model. However, none decreased the root mean squared error (RMSE) significantly.

The optimal lambda value that minimized the RMSE through cross validation was 0.247.
![Lasso CV](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/lasso-cv.png?raw=true)

The Lasso model kept 66 categories from a total of 44 different factor variables, the most interpretable of which are described below:
- Thermometer variables that captured sentiment on certain groups like big businesses, different racial and religious groups, democrats, and conservatives
- Variables related to whether the participant approved of the current U.S. government's actions
- Variables related to personal views on health insurance, public school funding, traditional values, tax money, etc.

The model performance of the Lasso linear regression model was low. The test set RMSE was 14.57 and the R-squared was 0.23. Thus, we chose an alternative approach: multinomial regression.

### Multinomial Regression
Age was coerced into a categorical variable rather than a continuous one. There were a total of four age categories:
- Young adults 17-24
- Adults 25-44
- Middle-aged 45-64
- Senior 65+

The multinomial regression model predicted which class an individual had the highest probability of being a part of. Again, Lasso regression was implemented to aid in variable selection. The optimal lambda value was 0.00529.
![Multinomial Regression CV](https://github.com/emilynomura1/data2020-final-project/blob/main/figures/small-multinom-lambda.png?raw=true)

The performance of the multinomial regression model was better than random choice, but not by much. The area under the ROC curves (AUROC) comparing two classes at a time were all above baseline (i.e. the area under the curve was greater than 0.5 for each pairing). However, the overall accuracy was only 48.2%. The class-wise accuracy is outlined in the following table:
(17,25]  | (25,45] | (45,65] | (65,100]
:---: | :---: | :---: | :---:
0.4%  | 58.7% | 60.7% | 54.3%

The multinomial regression model did a particularly poor job predicting the youngest age group. This could be due to the fact that the age groups were imbalanced. Namely, the youngest age group only contained around 8% of the observations in the dataset, thus explaining the low predictive power of the model for that age group.

## Conclusion
After building and implementing two different models to predict age from political views, it seems like multinomial regression may be a better approach than a simple linear regression. In the future, we would continue exploring multinomial regression and attempt to find solutions to add balance to the age classes. Alternatively, some other machine learning approaches may prove better-suited for this problem such as random forest or support vector machines. Different types of models like a proportional odds cumulative logit model for ordinal data may also prove more useful. Nevertheless, it may also be the case that it is simply not possible to accurately predict age with just political views - there may be too much variation to model age accurately with this type of data.
