
# Bootstrap.R
#
# Download all data and software required for the analysis

install_github_taf("cran/icesTAF")

library(icesTAF)
#library(devtools)

# source taf utils
source("utilities-taf.R")

# download specific versions of R packages
## packages on CRAN
install_github_taf("cran/icesDatras@1.2-0")

## GitHub packages from a commit
install_github_taf("ices-tools-prod/icesSAG@a80b86583582019746dac8fa6b5f95c39662b776")
