% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/run_simple.R
\name{run_simple}
\alias{run_simple}
\title{Simplest code to run a simulation loop}
\usage{
run_simple(step_function, initial.pop, end.time, ...)
}
\arguments{
\item{step_function}{Function to run a timestep (\code{step_function()})
which returns a list containing elements \code{updated.pop} with the
updated population and \code{end.experiment} which is TRUE if the
experiment has ended (FALSE if not)}

\item{initial.pop}{Initial population data frame with columns corresponding
to function requirements}

\item{end.time}{End time of simulation}

\item{...}{(optionally) any other arguments for \code{step_function()},
e.g. parameters or timestep}
}
\value{
Data frame containing population history of simulation over time
}
\description{
A generic function to run a simulation loop for a fixed period of time.
}
\examples{

growth <- function(latest.df, growth.rate) {
current.count <- latest.df$count
growth.num <- current.count * growth.rate
next.count <- current.count + growth.num
next.time <- latest.df$time + 1
new.df <- data.frame(time=next.time, count=next.count)
finished <- next.count == 0
list(updated.pop=new.df, end.experiment=finished)
}
df <- data.frame(time=0, count=1)
results <- run_simple(growth, df, 100, growth.rate=0.1)
plot_populations(results)

}
