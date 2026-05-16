# Film permits to parsed parking-held street stretches (long)

Long-format companion table parsing the free-text `parking_held` column
of
[nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)
into one row per `"MAIN STREET between FROM-STREET and TO-STREET"`
stretch.

## Usage

``` r
nyc_film_permit_parking_df
```

## Format

### `nyc_film_permit_parking_df`

A tibble with 58,172 rows and 6 columns:

- event_id:

  Integer. Permit identifier. Joins to
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$event_id`.

- segment_seq:

  Integer. Ordinal position of the stretch within the original
  comma-separated `parking_held` string for this permit. Together with
  `event_id`, uniquely identifies each parsed stretch.

- main_street:

  Character. The street whose parking is held.

- from_street:

  Character. Cross street naming one end of the stretch.

- to_street:

  Character. Cross street naming the other end of the stretch.

- matched:

  Logical. `TRUE` when geometry was successfully resolved against LION;
  see
  [nyc_film_permit_parking_sf](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_parking_sf.md).

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>

## Details

Approximately 87% of parsed stretches successfully geolocate to one or
more LION street segments. The unmatched 13% are mostly typos, renamed
streets not in the alt-name table, multi-direction data-entry oddities
such as "EAST AND WEST 44 STREET", and highway service-road / direction
codes such as "CLEARVIEW EXPRESSWAY SR SB".

Many parsed stretches span more than one block (e.g., "AMSTERDAM AVENUE
between WEST 62 STREET and WEST 65 STREET"). Geolocation is performed by
shortest path along a per-(main-street, borough) subgraph of LION, so
one parsed stretch can produce multiple rows in the companion sf object.

## Author

Kieran Healy
