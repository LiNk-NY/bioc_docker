# DO NOT EDIT 'install.R'; instead, edit 'install.R.in' and
# use 'rake' to generate 'install.R'.

if ("BiocManager" %in% rownames(installed.packages()))
	remove.packages("BiocManager")

if (TRUE)
    devtools::install_github("Bioconductor/BiocManager")
else
    install.packages("BiocManager", repos="https://cran.rstudio.com")

library(BiocManager)

if(BiocManager::version() != "3.7"){
    BiocManager::install(version="3.7",
                         update=TRUE, ask=FALSE)
}

builtins <- c("Matrix", "KernSmooth", "mgcv")

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        suppressWarnings(
            BiocManager::install(builtin, version="3.7",
            update=TRUE, ask=FALSE)
        )


if (FALSE) {
# save BiocInstaller for final run of release 3.7
url <- "http://bioconductor.org/packages/3.7/bioc"

if ("BiocInstaller" %in% rownames(installed.packages()))
	remove.packages("BiocInstaller")

install.packages("BiocInstaller", repos=url)

builtins <- c("Matrix", "KernSmooth", "mgcv")

for (builtin in builtins)
    if (!suppressWarnings(require(builtin, character.only=TRUE)))
        BiocInstaller::biocLite(builtin)

suppressWarnings(BiocInstaller::biocValid(fix=TRUE, ask=FALSE))

}
