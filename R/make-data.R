#' Gene-level counts for retinal organoid (RO) samples
#'
#' @return A SummarizedExperiment object
#' @import SummarizedExperiment
#' @export
ROGeneLevelData <- function() {
  load_object("ROGeneLevelData.rds")
}

#' Isoform-level counts for retinal organoid (RO) samples
#'
#' @return A SummarizedExperiment object
#' @export
ROIsoformLevelData <- function() {
  load_object("ROIsoformLevelData.rds")
}

#' Gene-level counts for flow through (FT) and retinal ganglion cell (RGC) samples
#'
#' @return A SummarizedExperiment object
#' @export
FTRGCGeneLevelData <- function() {
  load_object("FTRGCGeneLevelData.rds")
}

#' Isoform-level counts for flow through (FT) and retinal ganglion cell (RGC) samples
#'
#' @return A SummarizedExperiment object
#' @export
FTRGCIsoformLevelData <- function() {
  load_object("FTRGCIsoformLevelData.rds")
  
}

#' Allele-specific expression (ASE) gene counts
#'
#' @return A numeric matrix
#' @export
ASEGeneCounts <- function() {
  load_object("ase_gene_counts.RDS")
}
