# seqwraphelper


`seqwraphelper` contains a function that makes it easier to showcase
[`seqwrap`](https://github.com/trainome/seqwrap). Using the function
`geo_get()` we can download an open data set from the [Gene expression
omnibus](https://www.ncbi.nlm.nih.gov/geo/). The function download,
cleans and adds annotations to NCBI-generated gene count data. Two data
frames are returned, one with metadata and one with count data.

``` r
# install seqwraphelper from github
remotes::install_github("dhammarstrom/seqwraphelper")
```

The only dataset included in the main function is Pillon et al. (2022).
To download the files:

``` r
# Load package
library(seqwraphelper)

# Use geo_data to donload data from NCBI/GEO
dat <- geo_data()
```

    Joining with `by = join_by(GeneID)`
    Setting options('download.file.method.GEOquery'='auto')
    Setting options('GEOquery.inmemory.gpl'=FALSE)

    Warning: Expected 3 pieces. Additional pieces discarded in 111 rows [1, 2, 3, 4, 5, 6,
    7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...].

The downloaded data sets are now available as two data frames.

``` r
head(dat$countdata[,c(1, 2, 3)])
```

           geneid GSM6107906 GSM6107907
    1     DDX11L1          2          2
    2      WASH7P         22         37
    3   MIR6859-1          1          1
    4 MIR1302-2HG          0          1
    5   MIR1302-2          0          0
    6     FAM138A          0          0

``` r
head(dat$metadata)
```

      seq_sample_id group  id  time
    1    GSM6107906   T2D 001 basal
    2    GSM6107907   T2D 001  post
    3    GSM6107908   T2D 001   rec
    4    GSM6107909   NGT 003 basal
    5    GSM6107910   NGT 003  post
    6    GSM6107911   NGT 003   rec

## References

Pillon NJ, Smith JAB, Alm PS, Chibalin AV et al. Distinctive
exercise-induced inflammatory response and exerkine induction in
skeletal muscle of people with type 2 diabetes. *Sci Adv* 2022 Sep
9;8(36):eabo3192. PMID: 36070371
