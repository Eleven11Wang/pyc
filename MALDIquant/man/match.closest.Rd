% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/match.closest-functions.R
\name{match.closest}
\alias{match.closest}
\title{Relaxed Value Matching}
\usage{
match.closest(x, table, tolerance = Inf, nomatch = NA_integer_)
}
\arguments{
\item{x}{\code{numeric}, the values to be matched.}

\item{table}{\code{numeric}, the values to be matched against. In contrast to
\code{\link{match}} \code{table} has to be sorted in increasing order.}

\item{tolerance}{\code{numeric}, accepted tolerance. Use \code{Inf} to match without
restrictions. Could be of length one or the same length as \code{table}.}

\item{nomatch}{\code{numeric}, if the difference
between the value in \code{x} and \code{table} is larger than
\code{tolerance} \code{nomatch} is returned. Has to be of length one.}
}
\value{
An \code{integer} vector of the same length as \code{x} giving the
closest position in \code{table} of the first match or \code{nomatch} if
there is no match.
}
\description{
\code{match.closest} returns a vector of the positions of (first) matches
its first arguments in its second. In contrast to the similar
\code{\link{match}} it just accept \code{numeric} arguments but
has an additional \code{tolerance} argument that allows relaxed
matching.
}
\examples{
library("MALDIquant")
match.closest(c(1.1, 1.4, 9.8), 1:10)
# [1]  1  1 10
match.closest(c(1.1, 1.4, 9.8), 1:10, tolerance=0.25)
# [1]  1 NA 10
match.closest(c(1.1, 1.4, 9.8), 1:10, tolerance=0.25, nomatch=0)
# [1]  1  0 10

## this function is most useful if you want to subset an intensityMatrix
## by a few (reference) peaks

## create an example intensityMatrix
im <- matrix(1:10, nrow=2, dimnames=list(NULL, 1:5))
attr(im, "mass") <- 1:5
im
#      1 2 3 4  5
# [1,] 1 3 5 7  9
# [2,] 2 4 6 8 10
# attr(,"mass")
# [1] 1 2 3 4 5

## reference peaks
ref <- c(2.2, 4.8)

im[, match.closest(ref, attr(im, "mass"), tolerance=0.25, nomatch=0)]
#      2  5
# [1,] 3  9
# [2,] 4 10

}
\seealso{
\code{\link{match}}
}

