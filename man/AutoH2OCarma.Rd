% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AutoH2OCARMA.R
\name{AutoH2OCARMA}
\alias{AutoH2OCARMA}
\title{AutoH2OCARMA}
\usage{
AutoH2OCARMA(
  AlgoType = "drf",
  data,
  NonNegativePred = FALSE,
  TrainOnFull = FALSE,
  TargetColumnName = "Target",
  DateColumnName = "DateTime",
  HierarchGroups = NULL,
  GroupVariables = NULL,
  FC_Periods = 30,
  TimeUnit = "week",
  TimeGroups = c("weeks", "months"),
  TargetTransformation = FALSE,
  Methods = c("BoxCox", "Asinh", "Asin", "Log", "LogPlus1", "Logit", "YeoJohnson"),
  XREGS = NULL,
  Lags = c(1:5),
  MA_Periods = c(1:5),
  SD_Periods = NULL,
  Skew_Periods = NULL,
  Kurt_Periods = NULL,
  Quantile_Periods = NULL,
  Quantiles_Selected = NULL,
  AnomalyDetection = NULL,
  Difference = TRUE,
  FourierTerms = 6,
  CalendarVariables = c("second", "minute", "hour", "wday", "mday", "yday", "week",
    "isoweek", "month", "quarter", "year"),
  HolidayVariable = c("USPublicHolidays", "EasterGroup", "ChristmasGroup",
    "OtherEcclesticalFeasts"),
  HolidayLags = 1,
  HolidayMovingAverages = 1:2,
  TimeTrendVariable = FALSE,
  DataTruncate = FALSE,
  ZeroPadSeries = NULL,
  SplitRatios = c(0.7, 0.2, 0.1),
  EvalMetric = "MAE",
  GridTune = FALSE,
  ModelCount = 1,
  NTrees = 1000,
  PartitionType = "timeseries",
  MaxMem = "32G",
  NThreads = max(1, parallel::detectCores() - 2),
  Timer = TRUE,
  DebugMode = FALSE
)
}
\arguments{
\item{AlgoType}{Select from "dfr" for RandomForecast, "gbm" for gradient boosting, "glm" for generalized linear model, "automl" for H2O's AutoML algo, and "gam" for H2O's Generalized Additive Model.}

\item{data}{Supply your full series data set here}

\item{NonNegativePred}{TRUE or FALSE}

\item{TrainOnFull}{Set to TRUE to train on full data}

\item{TargetColumnName}{List the column name of your target variables column. E.g. "Target"}

\item{DateColumnName}{List the column name of your date column. E.g. "DateTime"}

\item{HierarchGroups}{Vector of hierachy categorical columns.}

\item{GroupVariables}{Defaults to NULL. Use NULL when you have a single series. Add in GroupVariables when you have a series for every level of a group or multiple groups.}

\item{FC_Periods}{Set the number of periods you want to have forecasts for. E.g. 52 for weekly data to forecast a year ahead}

\item{TimeUnit}{List the time unit your data is aggregated by. E.g. "1min", "5min", "10min", "15min", "30min", "hour", "day", "week", "month", "quarter", "year".}

\item{TimeGroups}{Select time aggregations for adding various time aggregated GDL features.}

\item{TargetTransformation}{Run AutoTransformationCreate() to find best transformation for the target variable. Tests YeoJohnson, BoxCox, and Asigh (also Asin and Logit for proportion target variables).}

\item{Methods}{Choose from "BoxCox", "Asinh", "Asin", "Log", "LogPlus1", "Logit", "YeoJohnson". Function will determine if one cannot be used because of the underlying data.}

\item{XREGS}{Additional data to use for model development and forecasting. Data needs to be a complete series which means both the historical and forward looking values over the specified forecast window needs to be supplied.}

\item{Lags}{Select the periods for all lag variables you want to create. E.g. c(1:5,52)}

\item{MA_Periods}{Select the periods for all moving average variables you want to create. E.g. c(1:5,52)}

\item{SD_Periods}{Select the periods for all moving standard deviation variables you want to create. E.g. c(1:5,52)}

\item{Skew_Periods}{Select the periods for all moving skewness variables you want to create. E.g. c(1:5,52)}

\item{Kurt_Periods}{Select the periods for all moving kurtosis variables you want to create. E.g. c(1:5,52)}

\item{Quantile_Periods}{Select the periods for all moving quantiles variables you want to create. E.g. c(1:5,52)}

\item{Quantiles_Selected}{Select from the following c("q5","q10","q15","q20","q25","q30","q35","q40","q45","q50","q55","q60","q65","q70","q75","q80","q85","q90","q95")}

\item{AnomalyDetection}{NULL for not using the service. Other, provide a list, e.g. AnomalyDetection = list("tstat_high" = 4, tstat_low = -4)}

\item{Difference}{Puts the I in ARIMA for single series and grouped series.}

\item{FourierTerms}{Set to the max number of pairs. E.g. 2 means to generate two pairs for by each group level and interations if hierarchy is enabled.}

\item{CalendarVariables}{NULL, or select from "second", "minute", "hour", "wday", "mday", "yday", "week", "isoweek", "month", "quarter", "year"}

\item{HolidayVariable}{NULL, or select from "USPublicHolidays", "EasterGroup", "ChristmasGroup", "OtherEcclesticalFeasts"}

\item{HolidayLags}{Number of lags to build off of the holiday count variable.}

\item{HolidayMovingAverages}{Number of moving averages to build off of the holiday count variable.}

\item{TimeTrendVariable}{Set to TRUE to have a time trend variable added to the model. Time trend is numeric variable indicating the numeric value of each record in the time series (by group). Time trend starts at 1 for the earliest point in time and increments by one for each success time point.}

\item{DataTruncate}{Set to TRUE to remove records with missing values from the lags and moving average features created}

\item{ZeroPadSeries}{Set to "all", "inner", or NULL. See TimeSeriesFill for explanation}

\item{SplitRatios}{E.g c(0.7,0.2,0.1) for train, validation, and test sets}

\item{EvalMetric}{Select from "RMSE", "MAE", "MAPE", "Poisson", "Quantile", "LogLinQuantile", "Lq", "NumErrors", "SMAPE", "R2", "MSLE", "MedianAbsoluteError"}

\item{GridTune}{Set to TRUE to run a grid tune}

\item{ModelCount}{Set the number of models to try in the grid tune}

\item{NTrees}{Select the number of trees you want to have built to train the model}

\item{PartitionType}{Select "random" for random data partitioning "time" for partitioning by time frames}

\item{MaxMem}{Set to the maximum amount of memory you want to allow for running this function. Default is "32G".}

\item{NThreads}{Set to the number of threads you want to dedicate to this function.}

\item{Timer}{Set to FALSE to turn off the updating print statements for progress}

\item{DebugMode}{Defaults to FALSE. Set to TRUE to get a print statement of each high level comment in function}

\item{ExcludeAlgos}{For use when AlgoType = "AutoML". Selections include "DRF","GLM","XGBoost","GBM","DeepLearning" and "Stacke-dEnsemble"}
}
\value{
Returns a data.table of original series and forecasts, the catboost model objects (everything returned from AutoCatBoostRegression()), a time series forecast plot, and transformation info if you set TargetTransformation to TRUE. The time series forecast plot will plot your single series or aggregate your data to a single series and create a plot from that.
}
\description{
AutoH2OCARMA Automated Panel Data and Time Series Forecasting using H2O algorithms, Calendar and Holiday variables, ARIMA features, Fouier variables, time trend, and transformations.
}
\examples{
\dontrun{

# Load Walmart Data from Dropbox----
data <- data.table::fread(
  "https://www.dropbox.com/s/2str3ek4f4cheqi/walmart_train.csv?dl=1")

# Subset for Stores / Departments With Full Series
data <- data[, Counts := .N, by = c("Store","Dept")][Counts == 143][
  , Counts := NULL]

# Subset Columns (remove IsHoliday column)----
keep <- c("Store","Dept","Date","Weekly_Sales")
data <- data[, ..keep]
data <- data[Store == 1][, Store := NULL]
xregs <- data.table::copy(data)
data.table::setnames(xregs, "Dept", "GroupVar")
data.table::setnames(xregs, "Weekly_Sales", "Other")
data <- data[as.Date(Date) < as.Date('2012-09-28')]

# Build forecast
Results <- RemixAutoML::AutoH2OCARMA(

  # Data Artifacts
  AlgoType = "drf",
  ExcludeAlgos = NULL,
  data = data,
  TargetColumnName = "Weekly_Sales",
  DateColumnName = "Date",
  HierarchGroups = NULL,
  GroupVariables = c("Dept"),
  TimeUnit = "week",
  TimeGroups = c("weeks","months"),

  # Data Wrangling Features
  ZeroPadSeries = NULL,
  DataTruncate = FALSE,
  SplitRatios = c(1 - 10 / 138, 10 / 138),
  PartitionType = "random",

  # Productionize
  FC_Periods = 4L,
  TrainOnFull = FALSE,
  EvalMetric = "RMSE",
  GridTune = FALSE,
  ModelCount = 5,
  MaxMem = "28G",
  NThreads = parallel::detectCores(),
  Timer = TRUE,

  # Target Transformations
  TargetTransformation = FALSE,
  Methods = c("BoxCox", "Asinh", "Asin", "Log",
    "LogPlus1", "Logit", "YeoJohnson"),
  Difference = FALSE,
  NonNegativePred = FALSE,

  # Features
  AnomalyDetection = NULL,
  HolidayLags = 1:7,
  HolidayMovingAverages = 2:7,
  Lags = list("weeks" = c(1:4), "months" = c(1:3)),
  MA_Periods = list("weeks" = c(2:8), "months" = c(6:12)),
  SD_Periods = NULL,
  Skew_Periods = NULL,
  Kurt_Periods = NULL,
  Quantile_Periods = NULL,
  Quantiles_Selected = NULL,
  XREGS = NULL,
  FourierTerms = 2L,
  CalendarVariables = c("week", "month", "quarter", "year"),
  HolidayVariable = c("USPublicHolidays","EasterGroup","ChristmasGroup","OtherEcclesticalFeasts"),
  TimeTrendVariable = TRUE,
  NTrees = 1000L,
  DebugMode = TRUE)

UpdateMetrics <-
  Results$ModelInformation$EvaluationMetrics[
    Metric == "MSE", MetricValue := sqrt(MetricValue)]
print(UpdateMetrics)

# Get final number of trees actually used
Results$Model@model$model_summary$number_of_internal_trees

# Inspect performance
Results$ModelInformation$EvaluationMetricsByGroup[order(-R2_Metric)]
Results$ModelInformation$EvaluationMetricsByGroup[order(MAE_Metric)]
Results$ModelInformation$EvaluationMetricsByGroup[order(MSE_Metric)]
Results$ModelInformation$EvaluationMetricsByGroup[order(MAPE_Metric)]
}
}
\seealso{
Other Automated Panel Data Forecasting: 
\code{\link{AutoCatBoostCARMA}()},
\code{\link{AutoHurdleCARMA}()},
\code{\link{AutoXGBoostCARMA}()}
}
\author{
Adrian Antico
}
\concept{Automated Panel Data Forecasting}
