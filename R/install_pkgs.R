

cowgill_install_packages <- function(pkg_type = c("cran", "github")) {
  existing_install_option <- getOption("install.packages.check.source")
  options(install.packages.check.source = "no")
  on.exit(options(install.packages.check.source = existing_install_option))

  results <- logical()

  if ("cran" %in% pkg_type) {
    results["cran"] <- cowgill_install_cran_packages()
  }

  if ("github" %in% pkg_type) {
    results["github"] <- cowgill_install_github_packages()
  }

  if (all(results[pkg_type])) {
    invisible(return(TRUE))
  } else {
    stop("Not all packages could be installed")
  }

}

cowgill_install_cran_packages <- function() {

  packages <- c(
    "devtools",
    "AWR.athena",
    "usethis",
    "purrr",
    "purrrlyr",
    "tidyverse",
    "fs",
    "gganimate",
    "dtplyr",
    "dbplyr",
    "readxl",
    "extrafont",
    "tsibble",
    "fable",
    "feasts",
    "ggtext",
    "showtext",
    "sysfonts",
    "bookdown",
    "rmarkdown",
    "janitor",
    "countrycode",
    "shadowtext",
    "OECD",
    "datapasta",
    "plotly",
    "padr",
    "ggseas",
    "tsbox",
    "here",
    "readsdmx",
    "microbenchmark",
    "bench",
    "corrr",
    "ggrepel",
    "distill",
    "rsconnect",
    "prompt",
    "ggalt",
    "ggforce",
    "gifski",
    "av",
    "ggiraph",
    "shinyjs",
    "shinydashboard",
    "flexdashboard",
    "tidymodels",
    "broom",
    "profvis",
    "styler",
    "qs",
    "RcppRoll",
    "slider",
    "zoo",
    "sf",
    "rio"
  )

  if (interactive()) {
    remotes::install_cran(pkgs = packages,
                          repos = cran_repo(),
                          type = "binary",
                          dependencies = TRUE)
  }

  invisible(return(TRUE))
}

cowgill_install_github_packages <- function() {

  packages <- c(
    "MattCowgill/ggannotate",
    "MattCowgill/readabs",
    "MattCowgill/readrba",
    "MattCowgill/ggrichlegend",
    "MattCowgill/auseconhist",
    "grattan/grattantheme",
    "runapp-aus/strayr",
    "wfmackey/absmapsdata",
    "wfmackey/abscorr",
    "noamross/redoc",
    "gadenbuie/rsthemes"
  )

  out <- remotes::install_github(repo = packages,
         dependencies = TRUE,
         upgrade = "never",
         type = "binary")

  invisible(return(TRUE))
}
