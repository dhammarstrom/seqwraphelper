#' Gene-level data from Shetty et al. 2025
#'
#'
#' @format A data frame with 78932 rows and 71 variables:
#' \describe{
#'   \item{gene_id}{Gene id Ensembl }
#'   \item{seq_sample_id}{Sequencing sample ID, e.g., GSM7330944 corresponding to seq_sample_id in the meta data.}
#'   }
#'
#' @references Shetty AC, Sivinski J, Cornell J, McCracken C et al. Peripheral
#' blood transcriptomic profiling of molecular mechanisms commonly
#' regulated by binge drinking and placebo effects.
#' \emph{Sci Rep} 2024 May 10;14(1):10733. PMID: 38730024
#'
"shetty_gene"


#' Transcript-level data from Shetty et al. 2025
#'
#'
#' @format A data frame with 387944 rows and 71 variables:
#' \describe{
#'   \item{gene_id}{Gene id Ensembl }
#'   \item{seq_sample_id}{Sequencing sample ID, e.g., GSM7330944 corresponding to seq_sample_id in the meta data.}
#'   }
#'
#' @references Shetty AC, Sivinski J, Cornell J, McCracken C et al. Peripheral
#' blood transcriptomic profiling of molecular mechanisms commonly
#' regulated by binge drinking and placebo effects.
#' \emph{Sci Rep} 2024 May 10;14(1):10733. PMID: 38730024
#'
"shetty_transcript"

#' Meta data from Shetty et al. 2025
#'
#'
#' @format A data frame with 387944 rows and 71 variables:
#' \describe{
#'   \item{participant}{Participant id}
#'   \item{period}{Period for data collection, each participant perfomed the exposure in each of three periods.}
#'   \item{time}{Time after exposure (days).}
#'   \item{tissue}{Tissue for RNA-seq analysis.}
#'   \item{sex}{Participant sex, Male or Female.}
#'   \item{dose}{Exposure dose, Placebo, Mediumdose or Highdose.}
#'   \item{age}{Participant age (years).}
#'   \item{study_site}{Study site (1 or 2)}
#'   \item{seq_sample_id}{Sample id, corresponding to column names in shetty_gene and shetty_transcript.}
#'   \item{Run}{Run id, corresponding to the filename and SRR file id.}
#'   }
#'
#' @references Shetty AC, Sivinski J, Cornell J, McCracken C et al. Peripheral
#' blood transcriptomic profiling of molecular mechanisms commonly
#' regulated by binge drinking and placebo effects.
#' \emph{Sci Rep} 2024 May 10;14(1):10733. PMID: 38730024
#'
"shetty_metadata"
