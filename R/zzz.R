# Global variable to store ret_files
ret_files <- NULL

.onLoad <- function(libname, pkgname) {
  requireNamespace("osfr", quietly = TRUE)
  requireNamespace("BiocFileCache", quietly = TRUE)

  # Try to initialize ret_files, but don't fail if OSF is unreachable
  tryCatch({
    proj_url <- "https://osf.io/z2yvs/"
    ret_project <- osfr::osf_retrieve_node(proj_url)
    ret_files <<- osfr::osf_ls_files(ret_project, "HumanRetinaLRSData")
  }, error = function(e) {
    # Set ret_files to NULL; will be initialized on first use
    ret_files <<- NULL
  })
}

#' List available files on OSF
#' @return Character vector of file names
#' @export
list_osf_files <- function() {
  if (is.null(ret_files)) {
    proj_url <- "https://osf.io/z2yvs/"
    ret_project <- osfr::osf_retrieve_node(proj_url)
    ret_files <<- osfr::osf_ls_files(ret_project, "HumanRetinaLRSData")
  }
  sort(ret_files$name)
}

#' Load object from OSF with BiocFileCache
#' 
#' @param osf_file_name Name of the file on OSF
#' @param bfc BiocFileCache object. Default creates one in package cache directory.
#' @return The R object stored in the RDS file
#' @importFrom BiocFileCache BiocFileCache bfcquery bfcadd
#' @importFrom osfr osf_retrieve_node osf_ls_files osf_download
#' @export
load_object <- function(osf_file_name, 
                        bfc = BiocFileCache::BiocFileCache(
                          tools::R_user_dir( "HumanRetinaLRSData", which = "cache"),
                          ask = FALSE
                        )) {
  
  stopifnot(is.character(osf_file_name), length(osf_file_name) == 1)
  
  # Initialize ret_files if needed
  if (is.null(ret_files)) {
    proj_url <- "https://osf.io/z2yvs/"
    ret_project <- osfr::osf_retrieve_node(proj_url)
    ret_files <<- osfr::osf_ls_files(ret_project, "HumanRetinaLRSData")
  }
  
  # Verify file exists with informative error
  osf_file_name <- match.arg(osf_file_name, ret_files$name)
  
  # Check if already cached
  q <- BiocFileCache::bfcquery(bfc, osf_file_name)
  n <- nrow(q)
  
  if (n > 1) {
    message("Multiple cache hits; using last")
    return(readRDS(q$rpath[n]))
  } else if (n > 0) {
    message("Loading from cache: ", osf_file_name)
    return(readRDS(q$rpath[1]))
  }
  
  # Not cached - download and cache
  message("Downloading from OSF: ", osf_file_name)
  
  # Download to temp directory
  dir.create(td <- tempfile())
  osfr::osf_download(
    ret_files[ret_files$name == osf_file_name, ],
    path = td,
    conflicts = "overwrite"
  )
  
  # Add to cache
  fpath <- file.path(td, osf_file_name)
  cached_path <- BiocFileCache::bfcadd(bfc, osf_file_name, fpath = fpath)
  
  # Clean up temp directory
  unlink(td, recursive = TRUE)
  
  # Load and return
  readRDS(cached_path)
}

#' Clear OSF cache
#' @param bfc BiocFileCache object
#' @export
clear_osf_cache <- function(bfc = BiocFileCache::BiocFileCache(
  tools::R_user_dir( "HumanRetinaLRSData", which = "cache"),
  ask = FALSE
)) {
  BiocFileCache::removebfc(bfc, ask = FALSE)
  message("Cache cleared")
}
