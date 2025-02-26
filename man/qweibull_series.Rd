% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/weibull_series_system.R
\name{qweibull_series}
\alias{qweibull_series}
\title{Quantile function (inverse of the cdf).
By definition, the quantile p * 100\% for a strictly monotonically increasing
cdf F is the value t that satisfies \code{F(t) - p = 0}.
We solve for t using newton's method.}
\usage{
qweibull_series(p, scales, shapes, eps = 0.001, t0 = 1)
}
\arguments{
\item{p}{vector of probabilities.}

\item{scales}{vector of weibull scale parameters for weibull lifetime
components}

\item{shapes}{vector of weibull shape parameters for weibull lifetime
components}

\item{eps}{stopping condition, default is 1e-3}

\item{t0}{initial guess, default is 1}
}
\description{
Quantile function (inverse of the cdf).
By definition, the quantile p * 100\% for a strictly monotonically increasing
cdf F is the value t that satisfies \code{F(t) - p = 0}.
We solve for t using newton's method.
}
