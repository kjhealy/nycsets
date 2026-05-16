#' Film permits to community boards (long)
#'
#' Long-format companion table linking each film permit to the community
#' boards it affects. One row per (`event_id`, `community_board`) pair.
#'
#' @format ## `nyc_film_permit_boards_df`
#' A tibble with 21,432 rows and 2 columns:
#' \describe{
#'   \item{event_id}{Integer. Permit identifier. Joins to
#'     [nyc_film_permits_df]`$event_id`.}
#'   \item{community_board}{Integer. Community board number affected by the
#'     permit. Community board numbers are unique only within a borough; use
#'     [nyc_film_permits_df]`$borough` to disambiguate.}
#' }
#' @details
#' Derived from the comma-separated `community_boards` column of
#' [nyc_film_permits_df]. Source rows whose community board list was empty
#' or `"N/A"` are excluded.
#'
#' @author Kieran Healy
#' @source <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
"nyc_film_permit_boards_df"

#' Film permits to police precincts (long)
#'
#' Long-format companion table linking each film permit to the NYPD
#' precincts it affects. One row per (`event_id`, `police_precinct`) pair.
#'
#' @format ## `nyc_film_permit_precincts_df`
#' A tibble with 22,030 rows and 2 columns:
#' \describe{
#'   \item{event_id}{Integer. Permit identifier. Joins to
#'     [nyc_film_permits_df]`$event_id`.}
#'   \item{police_precinct}{Integer. NYPD precinct number affected by the
#'     permit.}
#' }
#' @details
#' Derived from the comma-separated `police_precincts` column of
#' [nyc_film_permits_df]. Source rows whose precinct list was empty or
#' `"N/A"` are excluded.
#'
#' @author Kieran Healy
#' @source <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
"nyc_film_permit_precincts_df"

#' Film permits to ZIP codes (long)
#'
#' Long-format companion table linking each film permit to the ZIP codes of
#' production activity. One row per (`event_id`, `zip_code`) pair.
#'
#' @format ## `nyc_film_permit_zips_df`
#' A tibble with 26,067 rows and 2 columns:
#' \describe{
#'   \item{event_id}{Integer. Permit identifier. Joins to
#'     [nyc_film_permits_df]`$event_id`.}
#'   \item{zip_code}{Character. Five-digit ZIP code of production activity.}
#' }
#' @details
#' Derived from the comma-separated `zip_codes` column of
#' [nyc_film_permits_df]. Source rows whose ZIP list was empty or `"N/A"`
#' are excluded.
#'
#' @author Kieran Healy
#' @source <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
"nyc_film_permit_zips_df"

#' NYC film permits
#'
#' Permits issued by the New York City Mayor's Office of Media and
#' Entertainment (MOME) for film, television, and other productions asserting
#' exclusive use of city property (streets, sidewalks, parks, DCAS facilities).
#' One row per permit (event).
#'
#' @format ## `nyc_film_permits_df`
#' A tibble with 17,177 rows and 13 columns:
#' \describe{
#'   \item{event_id}{Integer. Auto-generated unique permit identifier.}
#'   \item{event_type}{Character. Type of activity covered by the permit:
#'     `"Shooting Permit"`, `"Rigging Permit"`,
#'     `"Theater Load in and Load Outs"`, `"DCAS Prep/Shoot/Wrap Permit"`.}
#'   \item{start_date_time}{POSIXct (America/New_York). Scheduled start of
#'     the permitted activity. May be `NA` when the source row omits a start
#'     time.}
#'   \item{end_date_time}{POSIXct (America/New_York). Scheduled completion of
#'     the permitted activity. May be `NA`.}
#'   \item{entered_on}{POSIXct (America/New_York). Time the permit request
#'     was submitted to MOME.}
#'   \item{parking_held}{Character. Free-text description of the cross
#'     streets and intersections where parking is held in advance for
#'     filming. Multiple segments are separated by commas. The degree of
#'     street impact may be one truck length, two truck lengths, quarter
#'     block, half block, or full block.}
#'   \item{borough}{Character. First borough of activity for the day:
#'     `"Manhattan"`, `"Brooklyn"`, `"Queens"`, `"Bronx"`, `"Staten Island"`.
#'     `NA` when no borough applies (e.g., aerial activity).}
#'   \item{community_boards}{Character. Comma-separated list of community
#'     boards affected by the permit. See [nyc_film_permit_boards_df] for a
#'     long-format companion with one row per (`event_id`, board).}
#'   \item{police_precincts}{Character. Comma-separated list of NYPD
#'     precincts affected. See [nyc_film_permit_precincts_df] for the long
#'     companion.}
#'   \item{category}{Character. Production category as selected by the
#'     applicant: `"Commercial"`, `"Documentary"`, `"Film"`, `"Music Video"`,
#'     `"Still Photography"`, `"Student"`, `"Television"`, `"Theater"`,
#'     `"WEB"`.}
#'   \item{sub_category_name}{Character. More specific production
#'     description (e.g., `"Episodic series"`, `"Feature"`, `"News"`,
#'     `"PSA"`).}
#'   \item{country}{Character. Project origin country.}
#'   \item{zip_codes}{Character. Comma-separated list of ZIP codes of
#'     production activity. See [nyc_film_permit_zips_df] for the long
#'     companion.}
#' }
#' @details
#' Source data is the "Film Permits" dataset published on NYC OpenData by the
#' Mayor's Office of Media and Entertainment. All permits in the table are
#' approved permits; status is therefore not retained as a column.
#'
#' Date fields are parsed from the source `MM/DD/YYYY HH:MM:SS AM/PM` format
#' to `POSIXct` in the `America/New_York` time zone. The constant
#' `EventAgency` column (always MOME) is dropped.
#'
#' @author Kieran Healy
#' @source <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
"nyc_film_permits_df"
