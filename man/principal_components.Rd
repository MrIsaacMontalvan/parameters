% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/principal_components.R
\name{principal_components}
\alias{principal_components}
\title{Principal Components Analysis}
\usage{
principal_components(x, rotation = NULL, n_comp = NULL)
}
\arguments{
\item{x}{A data frame or a \code{\link[stats]{prcomp}}-object.}

\item{rotation}{Rotation of the factor loadings. May be one of
\code{"varimax", "quartimax", "promax", "oblimin", "simplimax", "cluster"}
or \code{"none"}. If \code{rotatoin = NULL}, loadings for the principal
components from the unrotated matrix are returned.}

\item{n_comp}{Number of components to extract. If \code{rotation = "varmiax"}
and \code{n_comp = NULL}, number of components is based on the Kaiser-criteria.}
}
\value{
If \code{rotation = NULL}, a data frame with all loadings of principal
  components. Else, a rotated loadings matrix, as data frame. Details on the
  variance components are saved as attributes.
}
\description{
This function performs a principal component analysis and
  returns the loadings (of the unrotated matrix) as data frame, or
  returns a rotated matrix of the loadings (if \code{rotation} is not
  \code{NULL}).
}
\details{
The \code{print()}-method has a \code{cutoff}-argument, which is a
  scalar between 0 and 1, indicating which (absolute) values from the
  \emph{rotated} loadings (i.e. when \code{rotation} is \emph{not} \code{NULL})
  should be blank in the output. By default, all loadings between -.1 and .1
  are not shown.
}
\examples{
data(iris)
principal_components(iris[, 1:4])

data(iris)
principal_components(iris[, 1:4], rotation = "varimax", n_comp = 2)

pr <- principal_components(iris[, 1:4], rotation = "varimax", n_comp = 2)

# show all
print(pr, cutoff = .001)

# show only some
print(pr, cutoff = .5)

}