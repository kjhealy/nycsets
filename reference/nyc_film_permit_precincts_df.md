# Film permits to police precincts (long)

Long-format companion table linking each film permit to the NYPD
precincts it affects. One row per (`event_id`, `police_precinct`) pair.

## Usage

``` r
nyc_film_permit_precincts_df
```

## Format

### `nyc_film_permit_precincts_df`

A tibble with 22,030 rows and 2 columns:

- event_id:

  Integer. Permit identifier. Joins to
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$event_id`.

- police_precinct:

  Integer. NYPD precinct number affected by the permit.

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>

## Details

Derived from the comma-separated `police_precincts` column of
[nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md).
Source rows whose precinct list was empty or `"N/A"` are excluded.

## Author

Kieran Healy
