#' Download format gene expression data from Gene Expression Omnibus
#'
#' Currently, a data sets from Shetty et al. and Pillon et al. are made
#' available for the user
#' after downloading from the Gene Expression Omnibus. The dataset can be used
#' for replicating analyses in the Vignette and upcoming paper.
#'
#' @param dir Directory for downloading temporary files. Defaults to "data-raw"
#' @param gse GSE accession number
#' @references Pillon NJ, Smith JAB, Alm PS, Chibalin AV et al.
#' Distinctive exercise-induced inflammatory response and exerkine
#'  induction in skeletal muscle of people with type 2 diabetes.
#' \emph{Sci Adv} 2022 Sep 9;8(36):eabo3192. PMID: 36070371
#' @importFrom utils download.file read.delim2 read.table
#' @importFrom dplyr select mutate inner_join starts_with
#' @importFrom tidyr separate
#' @importFrom rlang .data
#' @export
geo_data <- function(dir = "./data-raw", gse = c("GSE202295")){
      if (!dir.exists(dir)) dir.create(dir)
      if (!(gse %in% c("GSE202295"))) stop("No other data sets have been added")

      if (gse == "GSE202295") {
            # Use system.file() to get the correct path to package data files
            count_file <- system.file("extdata", "GSE202295_raw_counts_GRCh38.p13_NCBI.tsv",
                                      package = "seqwraphelper")
            annotation_file <- system.file("extdata", "Human.GRCh38.p13.annot.tsv",
                                           package = "seqwraphelper")

            # Check if files exist
            if (count_file == "" || annotation_file == "") {
                  stop("Data files not found in package. Please check file names and package installation.")
            }

            dat <- read.table(count_file, header = TRUE)
            annotation <- read.delim2(annotation_file, header = TRUE)

            # Compile count data
            GSE202295_countdata <- dat |>
                  dplyr::inner_join(dplyr::select(annotation,
                                                  GeneID,
                                                  Symbol)) |>
                  dplyr::select(geneid = Symbol,
                                tidyselect::starts_with("GSM"))

            # Use system.file() for the series matrix file as well
            series_matrix_file <- system.file("extdata", "GSE202295_series_matrix.txt",
                                              package = "seqwraphelper")

            if (series_matrix_file == "") {
                  stop("Series matrix file not found in package.")
            }

            # Download and compile meta data
            gse <- GEOquery::getGEO(filename = series_matrix_file)

            ## Manually constructing a meta data table
            meta_data <- data.frame(seq_sample_id = gse$geo_accession,
                                    group_id_time = gse$`title`) |>
                  tidyr::separate(group_id_time, into = c("group", "id", "time")) |>
                  dplyr::mutate(time = factor(time, levels = c("basal", "post", "rec")))

            out <- list(metadata = meta_data,
                        countdata = GSE202295_countdata)
      }

      return(out)
}
