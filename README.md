
# setup_rprojects

<!-- badges: start -->
<!-- badges: end -->

The goal of setup_rprojects is to quickly set up my r projects

## Installation

You can install the development version of setup_rprojects like so:

``` r
remotes::install_github('wvictor14/setup_rprojects')
```

## Example

`create_project()` is a wrapper:

1. calls `usethis::create_package` 
2. `targets::use_targets` + minimal targets template
3. `write_r_profile` loads common packages and sets up ggplot2 theme
4. calls `renv::init()`
5. adds few things to `.gitignore`

``` r
library(setup_rprojects)
## basic example code
create_project('NEW_PROJECT')

## start targets project with minimal _targets script 
write_targets_script()

## default rprofile
write_r_profile()
```

