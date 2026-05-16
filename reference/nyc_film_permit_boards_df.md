# Film permits to community boards (long)

Long-format companion table linking each film permit to the community
boards it affects. One row per (`event_id`, `community_board`) pair.

## Usage

``` r
nyc_film_permit_boards_df
```

## Format

### `nyc_film_permit_boards_df`

A tibble with 21,432 rows and 2 columns:

- event_id:

  Integer. Permit identifier. Joins to
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$event_id`.

- community_board:

  Integer. Community board number affected by the permit. Community
  board numbers are unique only within a borough; use
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$borough`
  to disambiguate.

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>

## Details

Derived from the comma-separated `community_boards` column of
[nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md).
Source rows whose community board list was empty or `"N/A"` are
excluded.

## Author

Kieran Healy
