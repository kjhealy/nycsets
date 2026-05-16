# Geolocated film-permit parking stretches

Spatial companion to
[nyc_film_permit_parking_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_parking_df.md)
containing LION street segments matched to each parsed parking-held
stretch. One row per `(event_id, segment_seq, segment_id)` triple; a
single parsed stretch spanning multiple blocks produces several rows.
EPSG:2263, NAD83 / New York Long Island (ftUS).

## Usage

``` r
nyc_film_permit_parking_sf
```

## Format

### `nyc_film_permit_parking_sf`

A simple feature collection with 97,182 rows and 10 columns:

- event_id:

  Integer. Permit identifier. Joins to
  [nyc_film_permits_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permits_df.md)`$event_id`.

- segment_seq:

  Integer. Ordinal position of the parsed stretch within the permit's
  `parking_held` string. Joins to
  [nyc_film_permit_parking_df](https://kjhealy.github.io/nycsets/reference/nyc_film_permit_parking_df.md)
  on `(event_id, segment_seq)`.

- main_street:

  Character. The street whose parking is held, as it appeared in the
  source text.

- segment_id:

  Character. LION seven-digit segment identifier.

- physical_id:

  Integer. LION physical-segment ID. Multiple LION rows can share the
  same `physical_id`; group by this column to recover one row per block
  face.

- lion_street:

  Character. The canonical LION street name for the matched segment.

- l_boro, r_boro:

  Integer. LION borough code on the left / right side of the segment:
  `1` Manhattan, `2` Bronx, `3` Brooklyn, `4` Queens, `5` Staten Island.

- l_zip, r_zip:

  Character. ZIP code on the left / right side.

- SHAPE:

  Linestring / multilinestring geometry in EPSG:2263.

## Source

<https://data.cityofnewyork.us/City-Government/Film-Permits/tg4x-b46p>
and NYC Department of City Planning LION
<https://www.nyc.gov/site/planning/data-maps/open-data.page>.

## Details

Geometry is taken directly from
[nyclion::nyc_lion_sf](https://kjhealy.github.io/nyclion/reference/nyc_lion_sf.html).
Matching uses a street-name normalizer (ordinal-word expansion,
abbreviation expansion, compass-letter expansion) plus the LION
alt-names table, then shortest-path search through a per-(main-street,
borough) subgraph of LION segments. About 87% of parsed parking-held
stretches resolve to at least one LION segment.

LION subdivides each block-face into one or more sub-segments at minor
nodes (driveways, internal breakpoints). To recover one row per block
face, group or dissolve by `physical_id`.

## Author

Kieran Healy
