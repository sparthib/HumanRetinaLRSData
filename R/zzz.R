# Global variable to store ret_files
ret_files <- NULL

.onLoad <- function(libname, pkgname) {
  # Load osfr
  requireNamespace("osfr", quietly = TRUE)
  
  # Set up OSF connection
  proj_url <- "https://osf.io/z2yvs/"
  ret_project <- osfr::osf_retrieve_node(proj_url)
  ret_files <<- osfr::osf_ls_files(ret_project, "HumanRetinaLRSData")
}

#' Load object from OSF
#' @param osf_file_name Name of the file on OSF
#' @return The R object stored in the RDS file
#' @keywords internal
load_object <- function(osf_file_name) {
  # Check if ret_files is initialized
  if (is.null(ret_files)) {
    stop("OSF connection not initialized. Please reload the package.")
  }
  
  # Check if file exists
  if (!osf_file_name %in% ret_files$name) {
    stop("File '", osf_file_name, "' not found in OSF repository.")
  }
  
  tmp <- osfr::osf_download(ret_files[ret_files$name == osf_file_name, ],
                            path = tempdir(),
                            conflicts = "overwrite")$local_path
  obj <- readRDS(tmp)
  unlink(tmp)
  obj
}