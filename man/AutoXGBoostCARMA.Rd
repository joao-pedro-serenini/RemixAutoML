% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AutoXGBoostCARMA.R
\name{AutoXGBoostCARMA}
\alias{AutoXGBoostCARMA}
\title{AutoXGBoostCARMA Automated XGBoost Calendar, Holiday, ARMA, and Trend Variables Forecasting}
\usage{
AutoXGBoostCARMA(
  data,
  NonNegativePred = FALSE,
  TrainOnFull = FALSE,
  TargetColumnName = NULL,
  DateColumnName = NULL,
  HierarchGroups = NULL,
  GroupVariables = NULL,
  FC_Periods = 5,
  TimeUnit = "week",
  TimeGroups = c("weeks", "months"),
  TargetTransformation = FALSE,
  Methods = c("BoxCox", "Asinh", "Asin", "Log", "LogPlus1", "Logit", "YeoJohnson"),
  AnomalyDetection = NULL,
  XREGS = NULL,
  Lags = c(1:5),
  MA_Periods = c(1:5),
  SD_Periods = NULL,
  Skew_Periods = NULL,
  Kurt_Periods = NULL,
  Quantile_Periods = NULL,
  Quantiles_Selected = NULL,
  Difference = TRUE,
  FourierTerms = 6,
  CalendarVariables = c("second", "minute", "hour", "wday", "mday", "yday", "week",
    "isoweek", "month", "quarter", "year"),
  HolidayVariable = c("USPublicHolidays", "EasterGroup", "ChristmasGroup",
    "OtherEcclesticalFeasts"),
  HolidayLags = 1L,
  HolidayMovingAverages = 3L,
  TimeTrendVariable = FALSE,
  DataTruncate = FALSE,
  ZeroPadSeries = NULL,
  SplitRatios = c(1 - 10/100, 10/100),
  TreeMethod = "hist",
  NThreads = max(1, parallel::detectCores() - 2L),
  EvalMetric = "MAE",
  GridTune = FALSE,
  GridEvalMetric = "mae",
  ModelCount = 1L,
  NTrees = 1000L,
  PartitionType = "timeseries",
  Timer = TRUE,
  DebugMode = FALSE
)
}
\arguments{
\item{data}{Supply your full series data set here}

\item{NonNegativePred}{TRUE or FALSE}

\item{TrainOnFull}{Set to TRUE to train on full data}

\item{TargetColumnName}{List the column name of your target variables column. E.g. "Target"}

\item{DateColumnName}{List the column name of your date column. E.g. "DateTime"}

\item{HierarchGroups}{= NULL Character vector or NULL with names of the columns that form the interaction hierarchy}

\item{GroupVariables}{Defaults to NULL. Use NULL when you have a single series. Add in GroupVariables when you have a series for every level of a group or multiple groups.}

\item{FC_Periods}{Set the number of periods you want to have forecasts for. E.g. 52 for weekly data to forecast a year ahead}

\item{TimeUnit}{List the time unit your data is aggregated by. E.g. "1min", "5min", "10min", "15min", "30min", "hour", "day", "week", "month", "quarter", "year"}

\item{TimeGroups}{Select time aggregations for adding various time aggregated GDL features.}

\item{TargetTransformation}{Run AutoTransformationCreate() to find best transformation for the target variable. Tests YeoJohnson, BoxCox, and Asigh (also Asin and Logit for proportion target variables).}

\item{Methods}{Transformation options to test which include "BoxCox", "Asinh", "Asin", "Log", "LogPlus1", "Logit", "YeoJohnson"}

\item{AnomalyDetection}{NULL for not using the service. Other, provide a list, e.g. AnomalyDetection = list("tstat_high" = 4, tstat_low = -4)}

\item{XREGS}{Additional data to use for model development and forecasting. Data needs to be a complete series which means both the historical and forward looking values over the specified forecast window needs to be supplied.}

\item{Lags}{Select the periods for all lag variables you want to create. E.g. c(1:5,52)}

\item{MA_Periods}{Select the periods for all moving average variables you want to create. E.g. c(1:5,52)}

\item{SD_Periods}{Select the periods for all moving standard deviation variables you want to create. E.g. c(1:5,52)}

\item{Skew_Periods}{Select the periods for all moving skewness variables you want to create. E.g. c(1:5,52)}

\item{Kurt_Periods}{Select the periods for all moving kurtosis variables you want to create. E.g. c(1:5,52)}

\item{Quantile_Periods}{Select the periods for all moving quantiles variables you want to create. E.g. c(1:5,52)}

\item{Quantiles_Selected}{Select from the following c("q5","q10","q15","q20","q25","q30","q35","q40","q45","q50","q55","q60","q65","q70","q75","q80","q85","q90","q95")}

\item{Difference}{Set to TRUE to put the I in ARIMA}

\item{FourierTerms}{Set to the max number of pairs}

\item{CalendarVariables}{NULL, or select from "second", "minute", "hour", "wday", "mday", "yday", "week", "isoweek", "month", "quarter", "year"}

\item{HolidayVariable}{NULL, or select from "USPublicHolidays", "EasterGroup", "ChristmasGroup", "OtherEcclesticalFeasts"}

\item{HolidayLags}{Number of lags for the holiday counts}

\item{HolidayMovingAverages}{Number of moving averages for holiday counts}

\item{TimeTrendVariable}{Set to TRUE to have a time trend variable added to the model. Time trend is numeric variable indicating the numeric value of each record in the time series (by group). Time trend starts at 1 for the earliest point in time and increments by one for each success time point.}

\item{DataTruncate}{Set to TRUE to remove records with missing values from the lags and moving average features created}

\item{ZeroPadSeries}{Set to "all", "inner", or NULL. See TimeSeriesFill for explanation}

\item{SplitRatios}{E.g c(0.7,0.2,0.1) for train, validation, and test sets}

\item{TreeMethod}{Choose from "hist", "gpu_hist"}

\item{NThreads}{Set the maximum number of threads you'd like to dedicate to the model run. E.g. 8}

\item{EvalMetric}{Select from "r2", "RMSE", "MSE", "MAE"}

\item{GridTune}{Set to TRUE to run a grid tune}

\item{GridEvalMetric}{This is the metric used to find the threshold 'poisson', 'mae', 'mape', 'mse', 'msle', 'kl', 'cs', 'r2'}

\item{ModelCount}{Set the number of models to try in the grid tune}

\item{NTrees}{Select the number of trees you want to have built to train the model}

\item{PartitionType}{Select "random" for random data partitioning "time" for partitioning by time frames}

\item{Timer}{Setting to TRUE prints out the forecast number while it is building}

\item{DebugMode}{Setting to TRUE generates printout of all header code comments during run time of function}
}
\value{
Returns a data.table of original series and forecasts, the catboost model objects (everything returned from AutoCatBoostRegression()), a time series forecast plot, and transformation info if you set TargetTransformation to TRUE. The time series forecast plot will plot your single series or aggregate your data to a single series and create a plot from that.
}
\description{
AutoXGBoostCARMA Automated XGBoost Calendar, Holiday, ARMA, and Trend Variables Forecasting. Create hundreds of thousands of time series forecasts using this function.
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
data <- data[Store \%in\% c(1,2)]

xregs <- data.table::copy(data)
xregs[, GroupVar := do.call(paste, c(.SD, sep = " ")), .SDcols = c("Store","Dept")]
xregs[, c("Store","Dept") := NULL]
data.table::setnames(xregs, "Weekly_Sales", "Other")
xregs[, Other := jitter(Other, factor = 25)]
data <- data[as.Date(Date) < as.Date('2012-09-28')]

 # Build forecast
XGBoostResults <- AutoXGBoostCARMA(

  # Data Artifacts
  data = data,
  NonNegativePred = FALSE,
  TargetColumnName = "Weekly_Sales",
  DateColumnName = "Date",
  HierarchGroups = NULL,
  GroupVariables = c("Store","Dept"),
  TimeUnit = "weeks",
  TimeGroups = c("weeks","months"),

  # Data Wrangling Features
  ZeroPadSeries = NULL,
  DataTruncate = FALSE,
  SplitRatios = c(1 - 10 / 138, 10 / 138),
  PartitionType = "timeseries",
  AnomalyDetection = NULL,

  # Productionize
  FC_Periods = 4,
  TrainOnFull = FALSE,
  TreeMethod = "hist",
  EvalMetric = "RMSE",
  GridTune = FALSE,
  ModelCount = 5,
  NThreads = 8,
  Timer = TRUE,
  DebugMode = FALSE,

  # Target Transformations
  TargetTransformation = TRUE,
  Methods = c("BoxCox", "Asinh", "Asin", "Log",
              "LogPlus1","Logit","YeoJohnson"),
  Difference = FALSE,

  # Features
  Lags = list("weeks" = seq(1L, 10L, 1L),
              "months" = seq(1L, 5L, 1L)),
  MA_Periods = list("weeks" = seq(5L, 20L, 5L),
                    "months" = seq(2L, 10L, 2L)),
  SD_Periods = NULL,
  Skew_Periods = NULL,
  Kurt_Periods = NULL,
  Quantile_Periods = NULL,
  HolidayLags = 1,
  HolidayMovingAverages = 1:2,
  Quantiles_Selected = c("q5","q95"),
  XREGS = xregs,
  FourierTerms = 4,
  CalendarVariables = c("week", "month", "quarter"),
  HolidayVariable = c("USPublicHolidays","EasterGroup",
    "ChristmasGroup","OtherEcclesticalFeasts"),
  TimeTrendVariable = TRUE,
  NTrees = 300)

UpdateMetrics <- print(
  XGBoostResults$ModelInformation$EvaluationMetrics[
    Metric == "MSE", MetricValue := sqrt(MetricValue)])
print(UpdateMetrics)
XGBoostResults$ModelInformation$EvaluationMetricsByGroup[order(-R2_Metric)]
XGBoostResults$ModelInformation$EvaluationMetricsByGroup[order(MAE_Metric)]
XGBoostResults$ModelInformation$EvaluationMetricsByGroup[order(MSE_Metric)]
XGBoostResults$ModelInformation$EvaluationMetricsByGroup[order(MAPE_Metric)]
}
}
\seealso{
Other Automated Panel Data Forecasting: 
\code{\link{AutoCatBoostCARMA}()},
\code{\link{AutoH2OCARMA}()},
\code{\link{AutoHurdleCARMA}()}
}
\author{
Adrian Antico
}
\concept{Automated Panel Data Forecasting}
