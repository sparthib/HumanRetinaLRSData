# HumanRetinaLRSData

Human long-read sequencing data of retinal organoids, 2D retinal ganglion cell cultures, and flow-through from EP1 and H9 cell lines.

## Overview

This data package accompanies the study available [here](https://github.com/sparthib/retina_lrs). Our research explores:

-   **Gene and isoform diversity** across developmental time points of Retinal Organoid (RO) differentiation
-   **Gene and isoform expression** in Retinal Ganglion Cells (RGCs) compared to other cell types (flow-through)
-   **Haplotype-resolved gene expression** differences between RO stages, RGCs, and flow-through samples

## Installation

``` r
# Install from Bioconductor (if applicable)
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("HumanRetinaLRSData")
```

## Usage

### Retinal Organoid Data

Access gene-level and isoform-level data across RO developmental stages:

``` r
library(HumanRetinaLRSData)

# Gene-level expression data
ro_genes <- ROGeneLevelData()

# Isoform-level expression data
ro_isoforms <- ROIsoformLevelData()
```

### RGC and Flow-Through Data

Access gene-level and isoform-level data for RGCs and flow-through samples:

``` r
# Gene-level expression data
ftrgc_genes <- FTRGCGeneLevelData()

# Isoform-level expression data
ftrgc_isoforms <- FTRGCIsoformLevelData()
```

### Allele-Specific Expression Data

Access haplotype-resolved gene counts:

``` r
# Haplotype-resolved gene counts matrix
ase_counts <- ASEGeneCounts()
```

## Data Description

All data are provided as `SummarizedExperiment` objects (except ASE data, which is a counts matrix), making them compatible with standard Bioconductor workflows for analysis and visualization.

## Citation

If you use this data package, please cite our associated study:

Keuthan CJ, Parthiban S, Chang Y-Y, Shan X, Chang X, Yan E, Cavalier S, Timp W, Hicks SC, Zack DJ (2025). Dynamic changes in mRNA isoform usage during human retinal development. *bioRxiv*. doi: [10.1101/2025.11.26.689062](https://doi.org/10.1101/2025.11.26.689062)

## Contact

For questions or issues, please open an issue on the [GitHub repository](https://github.com/sparthib/retina_lrs).
