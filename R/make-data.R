#' Gene-level counts for retinal organoid (RO) samples
#'
#' @return A SummarizedExperiment object
#' @import SummarizedExperiment
#' @export
#' @examples
#' ro_data <- ROGeneLevelData()
#' ro_data
ROGeneLevelData <- function() {
  load_object("ROGeneLevelData.rds")
}

#' Isoform-level counts for retinal organoid (RO) samples
#'
#' @return A SummarizedExperiment object
#' @export
#' @examples
#' ro_iso_data <- ROIsoformLevelData()
#' ro_iso_data
ROIsoformLevelData <- function() {
  load_object("ROIsoformLevelData.rds")
}

#' Gene-level counts for flow through (FT) and retinal ganglion cell (RGC) samples
#'
#' @return A SummarizedExperiment object
#' @export
#' @examples
#' ftrgc_data <- FTRGCGeneLevelData()
#' ftrgc_data
FTRGCGeneLevelData <- function() {
  load_object("FTRGCGeneLevelData.rds")
}

#' Isoform-level counts for flow through (FT) and retinal ganglion cell (RGC) samples
#'
#' @return A SummarizedExperiment object
#' @export
#' @examples
#' ftrgc_iso_data <- FTRGCIsoformLevelData()
#' ftrgc_iso_data
FTRGCIsoformLevelData <- function() {
  load_object("FTRGCIsoformLevelData.rds")

}

#' Allele-specific expression (ASE) gene counts
#'
#' @return A numeric matrix
#' @export
#' @examples
#' ase_counts <- ASEGeneCounts()
#' head(ase_counts)
ASEGeneCounts <- function() {
  load_object("ase_gene_counts.RDS")
}
