## potential icesTAF functions


setLibPath <- function() {
  # ensure library dir exists
  mkdir("bootstrap/library")

  # form library path for current analysis
  taf_lib <- file.path(getwd(), "bootstrap/library")
  libs <- .libPaths()

  # set lib paths
  .libPaths(c(taf_lib, libs[libs != taf_lib]))
}


# relies heavily on unexported functions from devtools!
install_github_taf <- function(path) {

  # parse the path and create api address
  remote <- devtools:::github_remote(path)
  src <- paste0(remote$host, "/repos/",
                remote$username, "/",
                remote$repo, "/zipball/",
                remote$ref)

  # download and process
  mkdir("bootstrap/packages")
  bundle <- devtools:::download_github("bootstrap/packages/icesSAG.zip", src)
  source <- devtools:::source_pkg(bundle, subdir = remote$subdir)
  metadata <- devtools:::remote_metadata(remote, bundle)

  # install package into local library
  setLibPath()
  devtools::install(source, metadata = metadata)
}

install_local_taf <- function(repo) {

  bundle <- devtools:::download_github(paste0("bootstrap/packages/", repo, ".zip"), src)
  source <- devtools:::source_pkg(bundle, subdir = remote$subdir)
  metadata <- devtools:::remote_metadata(remote, bundle)

  # install package into local library
  setLibPath()
  install(source, metadata = metadata)
}
