% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assertions.R
\name{testDiscrete}
\alias{testDiscrete}
\alias{checkDiscrete}
\alias{assertDiscrete}
\title{assert/check/test/Discrete}
\usage{
testDiscrete(object, errormsg = paste(object$short_name, "is not discrete"))

checkDiscrete(object, errormsg = paste(object$short_name, "is not discrete"))

assertDiscrete(object, errormsg = paste(object$short_name, "is not discrete"))
}
\arguments{
\item{object}{Distribution}

\item{errormsg}{custom error message to return if assert/check fails}
}
\value{
If check passes then \code{assert} returns invisibly and \code{test}/\code{check}
return \code{TRUE}. If check fails, \code{assert} stops code with error, \code{check} returns
an error message as string, \code{test} returns \code{FALSE}.
}
\description{
Validation checks to test if Distribution is discrete.
}
\examples{
testDiscrete(Binomial$new()) # FALSE
}
