#' create a new R project
#'
#' @param path A path. If it does not exist, it is
#'   created, provided that the parent path exists.
#'
#' @return path to the new package, invisibly
#' @export
create_project <- function(path) {

  usethis::create_package(path, open = FALSE)

  withr::with_dir(
    path,
    {
      write_targets_script()
      write_r_profile()

      # set up renv
      renv::init()

      # gitignore
      cat("*.Rproj", file = '.gitignore', append = TRUE)
    }
  )

}


#' initializes targets and creates minimal _targets.R template
#'
#' @return NULL
#' @export
write_targets_script <- function() {
  #set up targets first
  targets::use_targets(overwrite = TRUE, open = FALSE)
  text <-
    '
library(targets)
library(tarchetypes)

tar_option_set(
  packages = packages,
  format = "rds"
)

tar_source()
list(
)
'
writeLines(text = text, con = here::here('_targets.R'))
}

#' writes r profile templates to current directory
#'
#' @return invisibly returns path to rprofile
#' @export
write_r_profile <- function() {
  file <- '.Rprofile'
  text <-
    '
source("renv/activate.R")
packages <- c(
  "tibble", "readr", "dplyr", "tidyr", "glue", "stringr", "purrr",
  "ggplot2", "magrittr", "ggh4x", "here", "readxl",
  "forcats", "gt", "ggpmisc", "scales", "patchwork"
)
library(ggplot2)
theme_set(
  theme_bw(base_size = 12) +
    theme(panel.background = element_blank(),
          panel.spacing = unit(0,"lines"),
          strip.text.y.right = element_text(angle = 0, vjust = 0.5),
          strip.background = element_blank(),
          axis.ticks = element_blank())
)
if (interactive()) {

  invisible(lapply(packages, require, character.only = TRUE))
  library(devtools)
  library(usethis)
  library(targets)
  library(tarchetypes)
  devtools::load_all()
}
'

writeLines(text = text, con = file)

invisible(file)
}
