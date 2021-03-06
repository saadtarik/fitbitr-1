% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/parse_functions.R
\name{get_activity}
\alias{get_activity}
\title{Get Fitbit activity data in a tidy format.}
\usage{
get_activity(from_date, to_date = from_date, features = activity_features(),
  detail_level = "1min", token)
}
\arguments{
\item{from_date}{From which date to query the data.
Character scalar in the format "YYYY-MM-DD".}

\item{to_date}{Up to which date to query the data. Data for that day are included in the return value. Character scalar in the format "YYYY-MM-DD".}

\item{features}{A character vector listing which features should be queried
and included in the final data.table. Use \code{\link{activity_features}} to see all the available features.}

\item{detail_level}{A character scalar specifying how frequently should the returned data be sampled.
Possible options are: '15min', '1min' and '1sec'.
Use \code{\link{activity_features_info}} to get minimal sampling time for each feature.}

\item{token}{Fitbit API token generated with \code{\link{get_fitbit_token}}.}
}
\value{
\code{data.table} with columns corresponding to different features as described in \url{https://dev.fitbit.com/docs/activity/} and \url{https://dev.fitbit.com/docs/heart-rate/}. Each feature also contains the daily summary denoted with a \code{daily_} prefix.
}
\description{
This function queries the Fitbit API and
returns the activity data for different features in a tidy format.
}
\details{
This is the main function of the fitbitr package. I queries the Fitbit API multiple times
using the \code{fitbit_GET} function. It then parses the API outputs and combines them
into a single data.table.
}
\section{Feature description}{

\describe{
  \item{\code{calories_level}}{Level field that reflects calculated activity level for that time period ( 0 - sedentary; 1 - lightly active; 2 - fairly active; 3 - very active.)}
  \item{\code{calories_mets}}{Probably the MET score \url{https://help.fitbit.com/articles/en_US/Help_article/What-are-very-active-minutes}.}
  \item{\code{calories}}{Calories burned in this time interval.}
  \item{\code{daily_calories}}{Total amount of calories burned at that day.}
  \item{\code{steps}}{Number of steps in this time interval.}
  \item{\code{daily_steps}}{Total number of steps at that day.}
  \item{\code{distance}}{Distance made in this time interval.}
  \item{\code{daily_distance}}{Total distance made at that day.}
  \item{\code{floors}}{Number of floors made in this time interval.}
  \item{\code{daily_floors}}{Number of floors made in this time interval.}
  \item{\code{elevation}}{Elevation units made in this time interval.}
  \item{\code{daily_elevation}}{Total number of elevation units made at that day.}
  \item{\code{heart}}{Mean heart rate in this time interval [beats per second].}
  \item{\code{daily_elevation}}{Daily mean heart rate [beats per second].}
}
Currently used units are 'Metric' (described in \url{https://dev.fitbit.com/docs/basics/#unit-systems}).

Time and date are stored as character vectors.
}
\examples{
\dontrun{
fitbit_token <- get_fitbit_token()
dt <- get_activity(from_date = "2015-12-15", to_date = "2015-12-18", token = fitbit_token)

## Heart rate at 1 second precision for the day 2015-12-15
dt <- get_activity(from_date = "2015-12-15", features = "heart",
                   detail_level = "1sec",
                   token = fitbit_token)
}
}

