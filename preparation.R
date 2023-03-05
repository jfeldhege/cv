

# Install packages --------------------------------------------------------

#devtools::install_github("mitchelloharawild/icons")
#devtools::install_local("datadrivencv.zip")

library(datadrivencv)


# renv  -------------------------------------------------------------------

renv::snapshot()


# Use CSVs ----------------------------------------------------------------

usethis::use_git_ignore("/data/")
usethis::use_git_ignore("datadrivencv.zip")

use_csv_data_storage(folder_name = "data", create_output_dir = FALSE)


# Convert from xlsx to csv ------------------------------------------------

csv_files <- list.files("data", pattern = "csv")

purrr::walk(csv_files, function(x) {
  y <- read.csv(glue::glue("./data/{x}"))
  
  z <- stringr::str_replace(x, ".csv$", ".xlsx")
  
  openxlsx::write.xlsx(y, file = glue::glue("./data/{z}"))
})



xlsx_files <- list.files("data", pattern = "xlsx")

purrr::walk(xlsx_files, function(x) {
  y <- openxlsx::read.xlsx(glue::glue("./data/{x}"))
  
  z <- stringr::str_replace(x, ".xlsx$", ".csv")
  
  write.csv(y, file = glue::glue("./data/{z}"))
})


# Create CV ---------------------------------------------------------------

use_datadriven_cv(
  full_name = "Johannes Markus Feldhege",
  data_location = "./data/",
  pdf_location = "https://www.johannesfeldhege.de/assets/Johannes_Lebenslauf.pdf",
  html_location = "https://www.johannesfeldhege.de/cv/",
  source_location = "https://github.com/jfeldhege/cv/",
  which_files = "all",
  output_dir = getwd(),
  create_output_dir = FALSE,
  use_network_logo = TRUE,
  open_files = TRUE
)
