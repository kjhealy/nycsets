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

#' Film permits to parsed parking-held street stretches (long)
#'
#' Long-format companion table parsing the free-text `parking_held` column
#' of [nyc_film_permits_df] into one row per
#' `"MAIN STREET between FROM-STREET and TO-STREET"` stretch.
#'
#' @format ## `nyc_film_permit_parking_df`
#' A tibble with 58,172 rows and 6 columns:
#' \describe{
#'   \item{event_id}{Integer. Permit identifier. Joins to
#'     [nyc_film_permits_df]`$event_id`.}
#'   \item{segment_seq}{Integer. Ordinal position of the stretch within the
#'     original comma-separated `parking_held` string for this permit.
#'     Together with `event_id`, uniquely identifies each parsed stretch.}
#'   \item{main_street}{Character. The street whose parking is held.}
#'   \item{from_street}{Character. Cross street naming one end of the
#'     stretch.}
#'   \item{to_street}{Character. Cross street naming the other end of the
#'     stretch.}
#'   \item{matched}{Logical. `TRUE` when geometry was successfully
#'     resolved against LION; see [nyc_film_permit_parking_sf].}
#' }
#' @details
#' Approximately 87% of parsed stretches successfully geolocate to one or
#' more LION street segments. The unmatched 13% are mostly typos, renamed
#' streets not in the alt-name table, multi-direction data-entry oddities
#' such as "EAST AND WEST 44 STREET", and highway service-road / direction
#' codes such as "CLEARVIEW EXPRESSWAY SR SB".
#'
#' Many parsed stretches span more than one block (e.g., "AMSTERDAM
#' AVENUE between WEST 62 STREET and WEST 65 STREET"). Geolocation is
#' performed by shortest path along a per-(main-street, borough) subgraph
#' of LION, so one parsed stretch can produce multiple rows in the
#' companion sf object.
#'
#' @author Kieran Healy
#' @source <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
"nyc_film_permit_parking_df"

#' Geolocated film-permit parking stretches
#'
#' Spatial companion to [nyc_film_permit_parking_df] containing LION street
#' segments matched to each parsed parking-held stretch. One row per
#' `(event_id, segment_seq, segment_id)` triple; a single parsed stretch
#' spanning multiple blocks produces several rows.
#' EPSG:2263, NAD83 / New York Long Island (ftUS).
#'
#' @format ## `nyc_film_permit_parking_sf`
#' A simple feature collection with 97,182 rows and 10 columns:
#' \describe{
#'   \item{event_id}{Integer. Permit identifier. Joins to
#'     [nyc_film_permits_df]`$event_id`.}
#'   \item{segment_seq}{Integer. Ordinal position of the parsed stretch
#'     within the permit's `parking_held` string. Joins to
#'     [nyc_film_permit_parking_df] on `(event_id, segment_seq)`.}
#'   \item{main_street}{Character. The street whose parking is held, as
#'     it appeared in the source text.}
#'   \item{segment_id}{Character. LION seven-digit segment identifier.}
#'   \item{physical_id}{Integer. LION physical-segment ID. Multiple
#'     LION rows can share the same `physical_id`; group by this column
#'     to recover one row per block face.}
#'   \item{lion_street}{Character. The canonical LION street name for the
#'     matched segment.}
#'   \item{l_boro, r_boro}{Integer. LION borough code on the left /
#'     right side of the segment: `1` Manhattan, `2` Bronx, `3` Brooklyn,
#'     `4` Queens, `5` Staten Island.}
#'   \item{l_zip, r_zip}{Character. ZIP code on the left / right side.}
#'   \item{SHAPE}{Linestring / multilinestring geometry in EPSG:2263.}
#' }
#' @details
#' Geometry is taken directly from [nyclion::nyc_lion_sf]. Matching uses a
#' street-name normalizer (ordinal-word expansion, abbreviation
#' expansion, compass-letter expansion) plus the LION alt-names table,
#' then shortest-path search through a per-(main-street, borough)
#' subgraph of LION segments. About 87% of parsed parking-held stretches
#' resolve to at least one LION segment.
#'
#' LION subdivides each block-face into one or more sub-segments at
#' minor nodes (driveways, internal breakpoints). To recover one row per
#' block face, group or dissolve by `physical_id`.
#'
#' @author Kieran Healy
#' @source
#' <https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
#' and NYC Department of City Planning LION
#' <https://www.nyc.gov/site/planning/data-maps/open-data.page>.
"nyc_film_permit_parking_sf"

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
