% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/figure.R
\name{figure}
\alias{figure}
\title{Create a new figure}
\usage{
figure(data, plot, theme = NULL, aspect_ratio = 1, ...)
}
\arguments{
\item{data}{a function that takes no arguments and returns the data that will
be plotted (either a dataframe or a list of named dataframes).}

\item{plot}{a function that takes the data to plot as its first argument, and
graphical parameters as subsequent arguments, and returns either a ggplot
object or a grob.}

\item{...}{other metadata, for example \code{title}, \code{subtitle}, etc.}
}
\description{
A figure is a reuseable, parameterisable, retargetable chunk of analysis and
graphical output.
}
\details{
Usually \code{figure} is called within a function, where content parameters
can be specified to change what is shown in the figure (see Examples).

Purely graphical parameters should be restricted to the plot function.

In general most data transformations should occur in \code{data}, however,
transformations that are purely for presentation purposes (e.g. reordering
a factor) may occur in \code{plot}. Use your judgment - the output of
\code{data} may be made available to readers/viewers as the "Download the
data for this figure", so it should be obvious how to get from that to the
chart.
}
\examples{
library(ggplot2)
library(dplyr)

# Minimal example
f <- figure(
  data = function() { mtcars },
  plot = function(df) { ggplot(df, aes(cyl, mpg)) + geom_point() }
)
f

# More typical example, enclosed in function with parameter, and metadata
fig_cars <- function(auto_manual = c(0, 1)) {
  figure(
    data = function() { mtcars \%>\% filter(am \%in\% auto_manual) },
    plot = function(df) { ggplot(df, aes(cyl, mpg)) + geom_point() },
    title = "Cars with more cylinders are less fuel efficient",
    subtitle = "Miles per gallon vs engine cylinders",
    source = "Henderson and Velleman (1981)"
  )
}
fig_cars()
fig_cars(auto_manual = 0)

}
