% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/model_parameters.gam.R
\name{model_parameters.gam}
\alias{model_parameters.gam}
\alias{model_parameters.rqss}
\alias{model_parameters.cgam}
\title{Parameters from Generalized Additive (Mixed) Models}
\usage{
\method{model_parameters}{gam}(
  model,
  ci = 0.95,
  bootstrap = FALSE,
  iterations = 1000,
  standardize = NULL,
  exponentiate = FALSE,
  robust = FALSE,
  p_adjust = NULL,
  ...
)

\method{model_parameters}{rqss}(
  model,
  ci = 0.95,
  bootstrap = FALSE,
  iterations = 1000,
  component = c("conditional", "smooth_terms", "all"),
  standardize = NULL,
  exponentiate = FALSE,
  ...
)

\method{model_parameters}{cgam}(
  model,
  ci = 0.95,
  bootstrap = FALSE,
  iterations = 1000,
  component = c("conditional", "smooth_terms", "all"),
  standardize = NULL,
  exponentiate = FALSE,
  ...
)
}
\arguments{
\item{model}{A gam/gamm model.}

\item{ci}{Confidence Interval (CI) level. Default to 0.95 (95\%).}

\item{bootstrap}{Should estimates be based on bootstrapped model? If \code{TRUE}, then arguments of \link[=model_parameters.stanreg]{Bayesian regressions} apply (see also \code{\link[=bootstrap_parameters]{bootstrap_parameters()}}).}

\item{iterations}{The number of bootstrap replicates. This only apply in the case of bootstrapped frequentist models.}

\item{standardize}{The method used for standardizing the parameters. Can be \code{"refit"}, \code{"posthoc"}, \code{"smart"}, \code{"basic"} or \code{NULL} (default) for no standardization. See 'Details' in \code{\link[effectsize]{standardize_parameters}}. Note that robust estimation (i.e. \code{robust=TRUE}) of standardized parameters only works when \code{standardize="refit"}.}

\item{exponentiate}{Logical, indicating whether or not to exponentiate the the coefficients (and related confidence intervals). This is typical for, say, logistic regressions, or more generally speaking: for models with log or logit link. \strong{Note:} standard errors are also transformed (by multiplying the standard errors with the exponentiated coefficients), to mimic behaviour of other software packages, such as Stata.}

\item{robust}{Logical, if \code{TRUE}, robust standard errors are calculated (if possible), and confidence intervals and p-values are based on these robust standard errors. Additional arguments like \code{vcov_estimation} or \code{vcov_type} are passed down to other methods, see \code{\link[=standard_error_robust]{standard_error_robust()}} for details.}

\item{p_adjust}{Character vector, if not \code{NULL}, indicates the method to adjust p-values. See \code{\link[stats]{p.adjust}} for details.}

\item{...}{Arguments passed to or from other methods. For instance, when \code{bootstrap = TRUE}, arguments like \code{ci_method} are passed down to \code{\link[bayestestR]{describe_posterior}}.}

\item{component}{Model component for which parameters should be shown. May be one of \code{"conditional"}, \code{"precision"} (\pkg{betareg}), \code{"scale"} (\pkg{ordinal}), \code{"extra"} (\pkg{glmx}), \code{"marginal"} (\pkg{mfx}), \code{"conditional"} or \code{"full"} (for \code{MuMIn::model.avg()}) or \code{"all"}.}
}
\value{
A data frame of indices related to the model's parameters.
}
\description{
Extract and compute indices and measures to describe parameters of generalized additive models (GAM(M)s).
}
\examples{
library(parameters)
if (require("mgcv")) {
  dat <- gamSim(1, n = 400, dist = "normal", scale = 2)
  model <- gam(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
  model_parameters(model)
}
}
\seealso{
\code{\link[insight:standardize_names]{standardize_names()}} to rename
  columns into a consistent, standardized naming scheme.
}
