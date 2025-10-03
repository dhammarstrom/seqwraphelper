# seqwraphelper

`seqwraphelper` contains (a) functions that makes it easier to showcase
[`seqwrap`](https://github.com/dhammarstrom/seqwrap). Using the function
`geo_get()` we can download open datasets from the [Gene expression
omnibus](https://www.ncbi.nlm.nih.gov/geo/). The function download,
cleans and adds annotations to NCBI-generated gene count data. Two data
frames are returned, one with meta-data and one with count data.

``` r
# install seqwraphelper from github
remotes::install_github("dhammarstrom/seqwraphelper")
```

The only dataset included in the main function is Shetty et al. (2024).
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
    Found 1 file(s)
    GSE232408_series_matrix.txt.gz
    Using locally cached version: ./data-raw/GSE232408_series_matrix.txt.gz

The downloaded data sets are now available as two data frames.

``` r
head(dat$countdata[,c(1, 2, 3)])
```

           geneid GSM7330880 GSM7330882
    1     DDX11L1        188        182
    2      WASH7P       1685       2042
    3   MIR6859-1         79         32
    4 MIR1302-2HG          1          0
    5   MIR1302-2          4          0
    6     FAM138A          2          0

``` r
head(dat$metadata)
```

        participant period time                 tissue gender       dose age
    1  Participant3      1    3 peripheral whole blood   Male    Placebo  21
    2  Participant8      1    3 peripheral whole blood   Male   HighDose  39
    3 Participant17      1    3 peripheral whole blood Female    Placebo  26
    4  Participant1      3    0 peripheral whole blood   Male MediumDose  21
    5  Participant1      3    3 peripheral whole blood   Male MediumDose  21
    6  Participant2      2    0 peripheral whole blood   Male   HighDose  27
      study_site seq_sample_id
    1          1    GSM7330880
    2          1    GSM7330881
    3          1    GSM7330882
    4          1    GSM7330883
    5          1    GSM7330884
    6          1    GSM7330885

## References

Shetty AC, Sivinski J, Cornell J, McCracken C et al. Peripheral blood
transcriptomic profiling of molecular mechanisms commonly regulated by
binge drinking and placebo effects. *Sci Rep* 2024 May 10;14(1):10733.
PMID: 38730024
