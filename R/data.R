#' UFO sightings in each U.S. state.
#'
#' A data set containing the date and state of UFO sightings since 1970.
#'
#' @format A data frame with 63496 rows and 2 columns.
#'
#' \describe{
#'   \item{date}{date of sighting}
#'   \item{state}{state where sighting occured}
#' }
#'
#' @source \url{https://www.kaggle.com/NUFORC/ufo-sightings}
"sightings"



#' UFO sighting counts by U.S. state
#'
#' A data set containing UFO sighting counts for each state. Also contains
#'  simple features needed for plotting.
#'
#' @format A simple features data frame with 51 rows and 3 columns.
#'
#' \describe{
#'   \item{state}{state where sighting occured}
#'   \item{sightings}{number of sightings in that state}
#'   \item{geometry}{simple features list-column containing state boundaries}
#'   }
"total_sightings_by_state"

#' UFO sighting counts by U.S. state
#'
#' A Dorling cartogram containing UFO sighting counts for each state.
#'
#' @format A simple features data frame with 51 rows and 3 columns.
#'
#' \describe{
#'   \item{state}{state where sighting occured}
#'   \item{sightings}{number of sightings in that state}
#'   \item{geometry}{simple features list-column containing Dorling cartogram}
#'   }
"total_sightings_by_state_dor"

#' Monthly number of UFO sightings for the U.S.
#'
#' A data set containing number of monthly UFO sightings for the U.S. since
#'  1970.
#'
#' @format A data frame with 520 rows and 4 columns.
#'
#' \describe{
#'   \item{date}{date of sighting, rounded down to first day of the month}
#'   \item{sightings}{number of sightings in that month}
#'   \item{year}{year of the sighting}
#'   \item{month}{month of the sighting}
#' }
#'
#'
"monthly_sightings"

#' Monthly number of UFO sightings for each state in the U.S.
#'
#' A data set containing number of monthly UFO sightings for each state in
#'  the U.S. since 1970.
#'
#' @format A data frame with 26571 rows and 5 columns.
#'
#' \describe{
#'   \item{date}{date of sighting, rounded down to first day of the month}
#'   \item{sightings}{number of sightings in that month}
#'   \item{year}{year of the sighting}
#'   \item{month}{month of the sighting}
#'   \item{state}{state where the sighting occured}
#' }
#'
#'
"monthly_sightings_by_state"

#' Number of sightings for each UFO shape.
#'
#' A data set containing the number of sightings for each UFO shape.
#'
#' @format A data frame with 28 rows and 2 columns.
#'
#' \describe{
#'   \item{shape}{the shape of the sighting}
#'   \item{sightings}{number of sightings for that shape}
#' }
#'
#'
"shape_counts"

#' Monthly number of UFO sightings for each shape.
#'
#' A data set containing number of monthly UFO sightings for each shape.
#'
#' @format A data frame with 14588 rows and 5 columns.
#'
#' \describe{
#'   \item{date}{date of sighting, rounded down to first day of the month}
#'   \item{shape}{the shape of the UFO}
#'   \item{sightings}{number of sightings for that shape and month}
#'   \item{year}{year of the sighting}
#'   \item{month}{month of the sighting}
#' }
#'
#'
"monthly_sightings_by_state"
