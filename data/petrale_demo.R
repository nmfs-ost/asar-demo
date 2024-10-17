################################################################################
# ASAR DEMO
################################################################################

# Application of ASAR to a recently published stock assessment report
# petrale sole (U.S. West Coast)
install.packages('remotes')
install.packages('tinytex')
library(tinytex)

remotes::install_github("nmfs-ost/asar") # automated stock assessment reporting
remotes::install_github("nmfs-ost/satf") # stock assessment tables and figures

# Load here to form relative paths for files
library(here)

# Template
asar::create_template(
  format = "pdf",
  office = "NWFSC",
  region = "U.S. West Coast",
  species = "Petrale sole",
  year = 2023,
  spp_latin = "Eopsetta jordani",
  file_dir = here::here(),
  author = c("Ian G. Taylor", "Vladlena Gertseva", "Nick Tolimieri"),
  include_affiliation = TRUE,
  simple_affiliation = FALSE,
  param_names = c("nf","sf"),
  param_values = c("North fleet", "South fleet"),
  convert_output = TRUE,
  resdir = here::here(),
  model_results = "Report.sso",
  model = "SS3"
)

# Read in output file
  # output <- read.csv(
  #   here::here("stock_assessment_reports",
  #              "NWFSC",
  #              "Petrale sole",
  #              "U.S. West Coast",
  #              "2023",
  #              "Petrale_sole_std_res_2023.csv")
  #   )

# See set up of standard output file
  # View(output)

# Read in and view SS3 Report.sso file
  # get_ncol <- function(file, skip = 0) {
  #   nummax <- max(utils::count.fields(file,
  #                                     skip = skip, quote = "",
  #                                     comment.char = ""
  #   )) + 1
  #   return(nummax)
  # }
  # SS3_output <- read.table(
  #   file = here::here("Report.sso"),
  #   col.names = 1:get_ncol(here::here("Report.sso")), fill = TRUE, quote = "",
  #   colClasses = "character", nrows = -1, comment.char = "",
  #   blank.lines.skip = FALSE
  # )
  # View(SS3_output)
