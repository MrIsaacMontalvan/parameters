#' Model Parameters
#'
#' Compute and extract model parameters. See the documentation for your object's class:
#' \itemize{
#'  \item{\link[=model_parameters.htest]{Correlations and t-tests}}
#'  \item{\link[=model_parameters.aov]{ANOVAs}}
#'  \item{\link[=model_parameters.default]{Regression models} (\code{lm}, \code{glm}, \pkg{survey}, ...)}
#'  \item{\link[=model_parameters.gam]{Additive models} (\code{gam}, \code{gamm}, ...)}
#'  \item{\link[=model_parameters.zeroinfl]{Zero-inflated models} (\code{hurdle}, \code{zeroinfl}, \code{zerocount})}
#'  \item{\link[=model_parameters.mlm]{Multinomial, ordinal and cumulative link models} (\code{bracl}, \code{multinom}, \code{mlm}, ...)}
#'  \item{\link[=model_parameters.averaging]{Other special models} (\code{model.avg}, \code{betareg}, \code{glmx}, ...)}
#'  \item{\link[=model_parameters.merMod]{Mixed models} (\pkg{lme4}, \pkg{nlme}, \pkg{glmmTMB}, ...)}
#'  \item{\link[=model_parameters.BFBayesFactor]{Bayesian tests} (\pkg{BayesFactor})}
#'  \item{\link[=model_parameters.stanreg]{Bayesian models} (\pkg{rstanarm}, \pkg{brms}, \pkg{MCMCglmm}, ...)}
#'  \item{\link[=model_parameters.principal]{PCA and FA} (\pkg{psych})}
#'  \item{\link[=model_parameters.lavaan]{CFA and SEM} (\pkg{lavaan}, \pkg{blavaan})}
#'  \item{\link[=model_parameters.kmeans]{Cluster models} (k-means, ...)}
#'  \item{\link[=model_parameters.rma]{Meta-Analysis via linear (mixed) models} (\code{rma})}
#'  \item{\link[=model_parameters.glht]{Hypothesis Testing} (\code{glht})}
#'  \item{\link[=model_parameters.mira]{Multiply imputed repeated analyses} (\code{mira})}
#'  }
#'
#' @param model Statistical Model.
#' @param ... Arguments passed to or from other methods. Non-documented arguments are \code{digits}, \code{p_digits} and \code{ci_digits} to set the number of digits for the output. See 'Examples' in \code{\link{model_parameters.default}}.
#'
#' @seealso \code{\link[insight:standardize_names]{standardize_names()}} to rename
#'   columns into a consistent, standardized naming scheme.
#'
#' @note The \code{\link[=print.parameters_model]{print()}} method has several arguments to tweak the output. There is also a \href{https://easystats.github.io/see/articles/parameters.html}{\code{plot()}-method} implemented in the \href{https://easystats.github.io/see/}{\pkg{see}-package}.
#'
#' @details Standardization is based on \code{\link[effectsize:standardize_parameters]{standardize_parameters()}}.
#'   In case of \code{standardize = "refit"}, the data used to fit the model
#'   will be standardized and the model is completely refitted. In such cases,
#'   standard errors and confidence intervals refer to the standardized coefficient.
#'
#' @return A data frame of indices related to the model's parameters.
#' @export
model_parameters <- function(model, ...) {
  UseMethod("model_parameters")
}


#' @rdname model_parameters
#' @export
parameters <- model_parameters
