% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/strpop.R
\name{strpop}
\alias{strpop}
\title{Pop a string off of a string, for (e.g.) grabbing source barcodes from GEO.
unlike Perl or C versions, this function does not modify x behind the scenes}
\usage{
strpop(x, y = " ", z = NULL)
}
\arguments{
\item{x}{a string}

\item{y}{a split character (default is " ")}

\item{z}{which element(s) to retrieve (default is the last one)}
}
\value{
the element(s) produced by splitting basename(x) on y
}
\description{
Pop a string off of a string, for (e.g.) grabbing source barcodes from GEO.
unlike Perl or C versions, this function does not modify x behind the scenes
}
