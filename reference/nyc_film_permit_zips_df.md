# Film permits to ZIP codes (long)

Long-format companion table linking each film permit to the ZIP codes of
production activity. One row per (`event_id`, `zip_code`) pair.

## Usage

``` r
nyc_film_permit_zips_df
```

## Format

### `nyc_film_permit_zips_df`

A tibble with 26,067 rows and 2 columns:

- event_id:

  Integer. Permit identifier. Joins to
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$event_id`.

- zip_code:

  Character. Five-digit ZIP code of production activity.

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>

## Details

Derived from the comma-separated `zip_codes` column of
[nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md).
Source rows whose ZIP list was empty or `"N/A"` are excluded.

## Author

Kieran Healy
