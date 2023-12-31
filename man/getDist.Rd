% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{getDist}
\alias{getDist}
\title{Get probability distribution function for each month of the period}
\usage{
getDist(series, mu, sigma, skew, skewy, var)
}
\arguments{
\item{series}{A matrix of monthly or annual data (temperature or precipitation). If the series consider monthly data, it will have 12 rows and each row will represent a month. For annual data the series will have only one row.}

\item{mu}{A column vector of mean values of the series. [12,1] if the series consider monthly data and [1,1] if the series consider annual data.}

\item{sigma}{A column vector of standard deviation of the series. [12,1] if the series consider monthly data and [1,1] if the series consider annual data.}

\item{skew}{A column vector of skewness of the series. [12,1] if the series consider monthly data and [1,1] if the series consider annual data.}

\item{skewy}{A column vector of skewness of the logarithm of the series. [12,1] if the series consider monthly data and [1,1] if the series consider annual data.}

\item{var}{A flag that identifies if data are temperature or precipitation. This flag tells the getDist function if it has to discard distribution functions that allow negative numbers. Temperature:   var = 0; Precipitation: var = 1}
}
\value{
PDF: A column vector with an ID for the resulting distribution from the KS test. [12,1] if the series consider monthly data and [1,1] if the series consider annual data. The ID is related to the numeration of the distribution listed in the description of this function. This ID is used in the getCDF and getCDFinv functions of the climQMBC package.
}
\description{
This function assigns an independent probability distribution function to each row of the input series by comparing the empirical probability distribution function with seven distributions based on the Kolmogorov-Smirnov (KS) test. If the series consider monthly data, it will have 12 rows and each row will represent a month. For annual data the series will have only one row. Only strictly positive distributions are considered for precipitation and strictly positive distributions are discarded if the series has negative values.
}
\details{
The available distributions are: 1) Normal distribution; 2) Log-Normal distribution; 3) Gamma 2 parameters distribution; 4) Gamma 3 parameters distribution (Pearson 3 parameters distribution); 5) Log-Gamma 3 parameters distribution (Log-Pearson 3 parameters distribution); 6) Gumbel distribution; 7) Exponential distribution

For precipitation, only 2), 3) and 5) are considered (1, 4, 6, and 7 are discarded). For series with negative values, only 1), 3), 4), 6), and 7) are considered (2, 3 and 5 are discarded).
}
