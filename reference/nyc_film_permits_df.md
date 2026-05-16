# NYC film permits

Permits issued by the New York City Mayor's Office of Media and
Entertainment (MOME) for film, television, and other productions
asserting exclusive use of city property (streets, sidewalks, parks,
DCAS facilities). One row per permit (event).

## Usage

``` r
nyc_film_permits_df
```

## Format

### `nyc_film_permits_df`

A tibble with 17,177 rows and 13 columns:

- event_id:

  Integer. Auto-generated unique permit identifier.

- event_type:

  Character. Type of activity covered by the permit:
  `"Shooting Permit"`, `"Rigging Permit"`,
  `"Theater Load in and Load Outs"`, `"DCAS Prep/Shoot/Wrap Permit"`.

- start_date_time:

  POSIXct (America/New_York). Scheduled start of the permitted activity.
  May be `NA` when the source row omits a start time.

- end_date_time:

  POSIXct (America/New_York). Scheduled completion of the permitted
  activity. May be `NA`.

- entered_on:

  POSIXct (America/New_York). Time the permit request was submitted to
  MOME.

- parking_held:

  Character. Free-text description of the cross streets and
  intersections where parking is held in advance for filming. Multiple
  segments are separated by commas. The degree of street impact may be
  one truck length, two truck lengths, quarter block, half block, or
  full block.

- borough:

  Character. First borough of activity for the day: `"Manhattan"`,
  `"Brooklyn"`, `"Queens"`, `"Bronx"`, `"Staten Island"`. `NA` when no
  borough applies (e.g., aerial activity).

- community_boards:

  Character. Comma-separated list of community boards affected by the
  permit. See
  [nyc_film_permit_boards_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_boards_df.md)
  for a long-format companion with one row per (`event_id`, board).

- police_precincts:

  Character. Comma-separated list of NYPD precincts affected. See
  [nyc_film_permit_precincts_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_precincts_df.md)
  for the long companion.

- category:

  Character. Production category as selected by the applicant:
  `"Commercial"`, `"Documentary"`, `"Film"`, `"Music Video"`,
  `"Still Photography"`, `"Student"`, `"Television"`, `"Theater"`,
  `"WEB"`.

- sub_category_name:

  Character. More specific production description (e.g.,
  `"Episodic series"`, `"Feature"`, `"News"`, `"PSA"`).

- country:

  Character. Project origin country.

- zip_codes:

  Character. Comma-separated list of ZIP codes of production activity.
  See
  [nyc_film_permit_zips_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_zips_df.md)
  for the long companion.

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>

## Details

Source data is the "Film Permits" dataset published on NYC OpenData by
the Mayor's Office of Media and Entertainment. All permits in the table
are approved permits; status is therefore not retained as a column.

Date fields are parsed from the source `MM/DD/YYYY HH:MM:SS AM/PM`
format to `POSIXct` in the `America/New_York` time zone. The constant
`EventAgency` column (always MOME) is dropped.

## Author

Kieran Healy
