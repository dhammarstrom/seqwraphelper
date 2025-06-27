# seqwraphelper


Downloading data

``` r
library(seqwraphelper)

## R code example

dat <- geo_data()
```

    Joining with `by = join_by(GeneID)`
    Setting options('download.file.method.GEOquery'='auto')
    Setting options('GEOquery.inmemory.gpl'=FALSE)
    Found 1 file(s)
    GSE232408_series_matrix.txt.gz
    Using locally cached version: ./data-raw/GSE232408_series_matrix.txt.gz

``` r
nrow(dat$countdata)
```

    [1] 39376
