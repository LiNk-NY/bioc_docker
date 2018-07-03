# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

library(BiocInstaller) # shouldn't be necessary

pkgs <- c(
    "airway",
    "ALL",
    "AnnotationHub",
    "apeglm",
    "beachmat",
    "Biobase",
    "BiocParallel",
    "BiocStyle",
    "biomaRt",
    "Biostrings",
    "rstudio/bookdown",
    "jmacdon/Bioc2018Anno",
    "BSgenome",
    "BSgenome.Hsapiens.UCSC.hg19.masked",
    "clusterExperiment",
    "curatedTCGAData",
    "DESeq2",
    "DelayedArray",
    "DelayedMatrixStats",
    "EnrichmentBrowser",
    "ExperimentHub",
    "drisso/fletcher2017data",
    "gam",
    "Glimma",
    "GSEABase",
    "GenomicRanges",
    "GenomicAlignments",
    "GenomicFeatures",
    "graph",
    "Gviz",
    "HDF5Array",
    "hgu95av2.db",
    "httr",
    "IRanges",
    "knitr",
    "magrittr",
    "memuse",
    "MultiAssayExperiment",
    "OrganismDbi",
    "plyranges",
    "RaggedExperiment",
    "RColorBrewer",
    "regioneR",
    "ReportingTools",
    "Rtsne",
    "scone",
    "ShortRead",
    "SingleCellExperiment",
    "slingshot",
    "SummarizedExperiment",
    "tximport",
    "tximportData",
    "RBGL",
    "Rgraphviz",
    "rmarkdown",
    "VariantAnnotation",
    "zinbwave"
    )


ap.db <- available.packages(contrib.url(biocinstallRepos()))
ap <- rownames(ap.db)

pkgs_to_install <- pkgs[pkgs %in% ap]

biocLite(pkgs_to_install)

# just in case there were warnings, we want to see them
# without having to scroll up:
warnings()

if (!is.null(warnings()))
{
    w <- capture.output(warnings())
    if (length(grep("is not available|had non-zero exit status", w)))
        quit("no", 1L)
}

suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))
