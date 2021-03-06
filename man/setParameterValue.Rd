% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParameterSet.R
\name{setParameterValue}
\alias{setParameterValue}
\title{Parameter Value Setter}
\usage{
setParameterValue(object, ..., lst = NULL, error = "warn")
}
\arguments{
\item{object}{Distribution or ParameterSet.}

\item{...}{named parameters and values to update, see details.}

\item{lst}{optional list, see details.}

\item{error}{character, value to pass to \code{stopwarn}.}
}
\value{
An R6 object of class ParameterSet.
}
\description{
Sets the value of the given parameter.
}
