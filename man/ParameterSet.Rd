% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ParameterSet.R
\name{ParameterSet}
\alias{ParameterSet}
\title{Parameter Sets for Distributions}
\description{
ParameterSets are passed to the \link{Distribution} constructor when
creating a custom probability distribution that takes parameters.
}
\examples{

## ------------------------------------------------
## Method `ParameterSet$new`
## ------------------------------------------------

id <- list("prob", "size")
value <- list(0.2, 5)
support <- list(set6::Interval$new(0, 1), set6::PosNaturals$new())
description <- list("Probability of success", NULL)
ParameterSet$new(id = id,
                 value = value,
                 support = support,
                 description = description
 )

ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 description = "Probability of success"
 )

## ------------------------------------------------
## Method `ParameterSet$getParameterSupport`
## ------------------------------------------------

ps <- ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 settable = TRUE,
                 description = "Probability of success"
 )
ps$getParameterSupport("prob")

## ------------------------------------------------
## Method `ParameterSet$getParameterValue`
## ------------------------------------------------

ps <- ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 settable = TRUE,
                 description = "Probability of success"
 )
ps$getParameterValue("prob")

## ------------------------------------------------
## Method `ParameterSet$setParameterValue`
## ------------------------------------------------

id <- list("rate")
value <- list(1)
support <- list(set6::PosReals$new())
ps <- ParameterSet$new(
  id, value, support
)
ps$setParameterValue(rate = 2)
ps$getParameterValue("rate")

## ------------------------------------------------
## Method `ParameterSet$merge`
## ------------------------------------------------

\dontrun{
ps1 <- ParameterSet$new(id = c("prob", "qprob"),
                 value = c(0.2, 0.8),
                 support = list(set6::Interval$new(0, 1), set6::Interval$new(0, 1))
 )
 ps1$addChecks(function(self) self$getParameterValue("x") > 0)
 ps1$addDeps("prob", "qprob", function(self)
     list(qprob = 1 - self$getParameterValue("prob")))
 ps2 <- ParameterSet$new(id = "size",
                 value = 10,
                 support = set6::Interval$new(0, 10, class = "integer"),
 )
 ps2$addTrafos("size", function(x, self) x + 1)
 ps1$merge(ps2)
 ps1$print()
 }

## ------------------------------------------------
## Method `ParameterSet$addDeps`
## ------------------------------------------------

\dontrun{
ps <- ParameterSet$new(
  id = list("a", "b", "c"),
  value = list(2, 3, 1/2),
  support = list(set6::Reals$new(), set6::Reals$new(), set6::Reals$new())
)
ps$addDeps("a", c("b", "c"),
   function(self) {
       list(b = self$getParameterValue("a") + 1,
            c = 1/self$getParameterValue("a"))
 })
}

## ------------------------------------------------
## Method `ParameterSet$addChecks`
## ------------------------------------------------

\dontrun{
id <- list("lower", "upper")
value <- list(1, 3)
support <- list(set6::PosReals$new(), set6::PosReals$new())
ps <- ParameterSet$new(
  id, value, support
)
ps$addChecks(function(self)
  self$getParameterValue("lower") < self$getParameterValue("upper"))
}

## ------------------------------------------------
## Method `ParameterSet$addTrafos`
## ------------------------------------------------

\dontrun{
ps <- ParameterSet$new(
  "probs", list(c(1, 1)), set6::Interval$new(0,1)^2
)
ps$addTrafos("probs", function(x, self) return(x / sum(x)))
ps$trafos
ps$setParameterValue(probs = c(1, 2))
ps$getParameterValue("probs")

# Alternate method (better with more parameters)
ps <- ParameterSet$new(
  "probs", list(c(1, 1)), set6::Interval$new(0,1)^2
)
ps$addTrafos(dt = data.table::data.table(
                          x = "probs",
                          fun = function(x, self) return(x / sum(x))
           ))
}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{deps}}{Returns ParameterSet dependencies table.}

\item{\code{checks}}{Returns ParameterSet assertions table.}

\item{\code{trafos}}{Returns ParameterSet transformations table.}

\item{\code{length}}{Number of parameters in ParameterSet.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{ParameterSet$new()}}
\item \href{#method-print}{\code{ParameterSet$print()}}
\item \href{#method-parameters}{\code{ParameterSet$parameters()}}
\item \href{#method-getParameterSupport}{\code{ParameterSet$getParameterSupport()}}
\item \href{#method-getParameterValue}{\code{ParameterSet$getParameterValue()}}
\item \href{#method-setParameterValue}{\code{ParameterSet$setParameterValue()}}
\item \href{#method-merge}{\code{ParameterSet$merge()}}
\item \href{#method-addDeps}{\code{ParameterSet$addDeps()}}
\item \href{#method-addChecks}{\code{ParameterSet$addChecks()}}
\item \href{#method-addTrafos}{\code{ParameterSet$addTrafos()}}
\item \href{#method-values}{\code{ParameterSet$values()}}
\item \href{#method-clone}{\code{ParameterSet$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
Creates a new instance of this \link[R6:R6Class]{R6} class.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$new(
  id,
  value,
  support,
  settable = TRUE,
  updateFunc = NULL,
  description = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{\code{(character(1)|list())}\cr
id of the parameter(s) to construct, should be unique.}

\item{\code{value}}{\code{(ANY|list())}\cr
Value of parameter(s) to set.}

\item{\code{support}}{\verb{([set6::Set]|list())}\cr
Support of parameter(s) to set}

\item{\code{settable}}{\code{(character(1)|list())}\cr
Logical flag indicating if the parameter(s) can be updated after construction.}

\item{\code{updateFunc}}{\code{(list())} \cr
Deprecated, please use \verb{$addDeps} instead.}

\item{\code{description}}{\code{(character(1)|list())}\cr
Optional description for the parameter(s).}
}
\if{html}{\out{</div>}}
}
\subsection{Details}{
Every argument can either be given as the type listed or as a list of that type.
If arguments are provided as a list, then each argument must be of the same length,
with values as NULL where appropriate. See examples for more.
}

\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{id <- list("prob", "size")
value <- list(0.2, 5)
support <- list(set6::Interval$new(0, 1), set6::PosNaturals$new())
description <- list("Probability of success", NULL)
ParameterSet$new(id = id,
                 value = value,
                 support = support,
                 description = description
 )

ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 description = "Probability of success"
 )
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-print"></a>}}
\if{latex}{\out{\hypertarget{method-print}{}}}
\subsection{Method \code{print()}}{
Prints the \link{ParameterSet}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$print(hide_cols = c("settable"), ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{hide_cols}}{\code{(character())}\cr
Names of columns in the \link{ParameterSet} to hide whilst printing.}

\item{\code{...}}{\code{ANY} \cr
Additional arguments, currently unused.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-parameters"></a>}}
\if{latex}{\out{\hypertarget{method-parameters}{}}}
\subsection{Method \code{parameters()}}{
Returns the full parameter details for the supplied parameter, or returns \code{self}
if \code{id} is \code{NULL}.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$parameters(id = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{\code{character()} \cr
id of parameter to return.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-getParameterSupport"></a>}}
\if{latex}{\out{\hypertarget{method-getParameterSupport}{}}}
\subsection{Method \code{getParameterSupport()}}{
Returns the support of the supplied parameter.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$getParameterSupport(id, error = "warn")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{\code{character()} \cr
id of parameter support to return.}

\item{\code{error}}{\code{(character(1))} \cr
If \code{"warn"} then returns a warning on error, otherwise breaks if \code{"stop"}.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
A \link[set6:Set]{set6::Set} object.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ps <- ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 settable = TRUE,
                 description = "Probability of success"
 )
ps$getParameterSupport("prob")
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-getParameterValue"></a>}}
\if{latex}{\out{\hypertarget{method-getParameterValue}{}}}
\subsection{Method \code{getParameterValue()}}{
Returns the value of the supplied parameter.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$getParameterValue(id, error = "warn")}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{id}}{\code{character()} \cr
id of parameter value to return.}

\item{\code{error}}{\code{(character(1))} \cr
If \code{"warn"} then returns a warning on error, otherwise breaks if \code{"stop"}.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{ps <- ParameterSet$new(id = "prob",
                 value = 0.2,
                 support = set6::Interval$new(0, 1),
                 settable = TRUE,
                 description = "Probability of success"
 )
ps$getParameterValue("prob")
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-setParameterValue"></a>}}
\if{latex}{\out{\hypertarget{method-setParameterValue}{}}}
\subsection{Method \code{setParameterValue()}}{
Sets the value(s) of the given parameter(s).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$setParameterValue(
  ...,
  lst = NULL,
  error = "warn",
  .suppressCheck = FALSE
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{\code{ANY} \cr
Named arguments of parameters to set values for. See examples.}

\item{\code{lst}}{\code{(list(1))} \cr
Alternative argument for passing parameters. List names should be parameter names and list values
are the new values to set.}

\item{\code{error}}{\code{(character(1))} \cr
If \code{"warn"} then returns a warning on error, otherwise breaks if \code{"stop"}.}

\item{\code{.suppressCheck}}{\code{(logical(1))}\cr
Should be set internally only.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{id <- list("rate")
value <- list(1)
support <- list(set6::PosReals$new())
ps <- ParameterSet$new(
  id, value, support
)
ps$setParameterValue(rate = 2)
ps$getParameterValue("rate")
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-merge"></a>}}
\if{latex}{\out{\hypertarget{method-merge}{}}}
\subsection{Method \code{merge()}}{
Merges multiple parameter sets.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$merge(y, ...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{y}}{\verb{([ParameterSet])}}

\item{\code{...}}{\verb{([ParameterSet]s)}}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
ps1 <- ParameterSet$new(id = c("prob", "qprob"),
                 value = c(0.2, 0.8),
                 support = list(set6::Interval$new(0, 1), set6::Interval$new(0, 1))
 )
 ps1$addChecks(function(self) self$getParameterValue("x") > 0)
 ps1$addDeps("prob", "qprob", function(self)
     list(qprob = 1 - self$getParameterValue("prob")))
 ps2 <- ParameterSet$new(id = "size",
                 value = 10,
                 support = set6::Interval$new(0, 10, class = "integer"),
 )
 ps2$addTrafos("size", function(x, self) x + 1)
 ps1$merge(ps2)
 ps1$print()
 }
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-addDeps"></a>}}
\if{latex}{\out{\hypertarget{method-addDeps}{}}}
\subsection{Method \code{addDeps()}}{
Add parameter dependencies for automatic updating.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$addDeps(x, y, fun)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{\code{(character(1))}\cr
id of parameter that updates \code{y}.}

\item{\code{y}}{\code{(character())}\cr
id of parameter(s) that is/are updated by \code{x}.}

\item{\code{fun}}{\verb{(function(1))}\cr
Function used to update \code{y}, must include \code{self} in formal arguments and should return a
named list with names identical to, and in the same order, as \code{y}.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
ps <- ParameterSet$new(
  id = list("a", "b", "c"),
  value = list(2, 3, 1/2),
  support = list(set6::Reals$new(), set6::Reals$new(), set6::Reals$new())
)
ps$addDeps("a", c("b", "c"),
   function(self) {
       list(b = self$getParameterValue("a") + 1,
            c = 1/self$getParameterValue("a"))
 })
}
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-addChecks"></a>}}
\if{latex}{\out{\hypertarget{method-addChecks}{}}}
\subsection{Method \code{addChecks()}}{
Add parameter checks for automatic assertions. Note checks are made after
any transformations.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$addChecks(fun)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{fun}}{\verb{(function(1))}\cr
Function used to check \code{ParameterSet}, must include \code{self} in formal arguments and
result in a logical.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
id <- list("lower", "upper")
value <- list(1, 3)
support <- list(set6::PosReals$new(), set6::PosReals$new())
ps <- ParameterSet$new(
  id, value, support
)
ps$addChecks(function(self)
  self$getParameterValue("lower") < self$getParameterValue("upper"))
}
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-addTrafos"></a>}}
\if{latex}{\out{\hypertarget{method-addTrafos}{}}}
\subsection{Method \code{addTrafos()}}{
Transformations to apply to parameter before setting. Note transformations are made before
checks.
NOTE: If a transformation for a parameter already exists then this will be overwritten.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$addTrafos(x, fun, dt = NULL)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{x}}{\code{(character(1))}\cr
id of parameter to be transformed. Only one trafo function per parameter allowed - though
multiple transformations can be encoded within this.}

\item{\code{fun}}{\verb{(function(1))}\cr
Function used to transform \code{x}, must include \verb{x, self} in formal arguments and
\code{x} in body where \code{x} is the value of the parameter to check.  See first example.}

\item{\code{dt}}{\verb{([data.table::data.table])}\cr
Alternate method to directly construct \code{data.table} of transformations to add.
See second example.}
}
\if{html}{\out{</div>}}
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{\dontrun{
ps <- ParameterSet$new(
  "probs", list(c(1, 1)), set6::Interval$new(0,1)^2
)
ps$addTrafos("probs", function(x, self) return(x / sum(x)))
ps$trafos
ps$setParameterValue(probs = c(1, 2))
ps$getParameterValue("probs")

# Alternate method (better with more parameters)
ps <- ParameterSet$new(
  "probs", list(c(1, 1)), set6::Interval$new(0,1)^2
)
ps$addTrafos(dt = data.table::data.table(
                          x = "probs",
                          fun = function(x, self) return(x / sum(x))
           ))
}
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-values"></a>}}
\if{latex}{\out{\hypertarget{method-values}{}}}
\subsection{Method \code{values()}}{
Returns parameter set values as a named list.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$values(settable = TRUE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{settable}}{\code{(logical(1))}\cr
If \code{TRUE} (default) only returns values of settable parameters, otherwise returns all.}
}
\if{html}{\out{</div>}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ParameterSet$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
