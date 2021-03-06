% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Wrapper_MixtureDistribution.R
\name{as.MixtureDistribution}
\alias{as.MixtureDistribution}
\title{Coercion to Mixture Distribution}
\usage{
as.MixtureDistribution(object, weights = "uniform")
}
\arguments{
\item{object}{\link{ProductDistribution} or \link{VectorDistribution}}

\item{weights}{\code{(character(1)|numeric())}\cr
Weights to use in the resulting mixture. If all distributions are weighted equally then
\code{"uniform"} provides a much faster implementation, otherwise a vector of length equal
to the number of wrapped distributions, this is automatically scaled internally.}
}
\description{
Helper functions to quickly convert compatible objects to
a \link{MixtureDistribution}.
}
