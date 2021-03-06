% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/madFilter.R
\name{madFilter}
\alias{madFilter}
\title{Median absolute deviation-based automatic filters for flowCore objects}
\usage{
madFilter(flowObj, gateVar = 1, nMads = 2, filterName = "default",
  nGates = 1, madSide = "both", adjust = 2,
  nonMadFilter = "deflection", returnSepFilter = FALSE)
}
\arguments{
\item{flowObj}{The fcs object to be filtered. Both flowFrames and flowSets
are accepted.}

\item{gateVar}{The variable that should be used to set the gate. Can either
be an integer or a string.}

\item{nMads}{The number of median absolute deviations that should be
included. These are calculated separately from each half of the peak, so
if applied on both sides, there can still be an assymetry present.}

\item{filterName}{The common name to the filter(s) created by the function.
Default is the name of the gate variable.}

\item{nGates}{The number of gates that should be produced}

\item{madSide}{Which side of the peak(s) should the MAD filter be applied to?
"low", "high", "both" and "none" supported.}

\item{adjust}{The value deciding the accuracy of the density calculation. The
higher the value, the lower the sensitivity for small aberrations in the
density.}

\item{nonMadFilter}{What filter should be applied on the possible non-mad
side? The three alternatives are:
\describe{
   \item{"deflection"}{Here, the gate is extended to the deflection point
   marking the start of the next peak.} "none" and "default".
   \item{"none"}{Here, all events are included}
}
It is worth noting that madSide overrides this argument.}

\item{returnSepFilter}{Should the gate be returned as a separate object?
Currently, this defaults to FALSE.}
}
\value{
flowObject of the same class as flowObj with the gates added as
boolean variables to the exprs portions of the flowFrames.
}
\description{
This function is meant to create conservative, MAD-based filters for n-peaked
cytometry variables.
}
