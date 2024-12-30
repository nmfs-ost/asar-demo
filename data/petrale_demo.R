################################################################################
# ASAR DEMO
################################################################################

# Application of ASAR to a recently published stock assessment report
# petrale sole (U.S. West Coast)
install.packages('remotes')
install.packages('tinytex')
library(tinytex)

remotes::install_github("nmfs-ost/asar@dev-1.0") # automated stock assessment reporting
remotes::install_github("nmfs-ost/satf") # stock assessment tables and figures

# Load here to form relative paths for files
library(here)

# Optional: convert output first
# asar::convert_output(
#   output_file = file.path(getwd(), "data", "Report.sso"),
#   model = "ss3",
#   file_save = TRUE,
#   savedir = file.path(getwd(), "data"),
#   save_name = "Petrale_sole_std_res"
# )

# Optional: create all figures and tables before creating template
#           *must run convert_output first
# satf::exp_all_figs_tables(
#   output,
#   ref_line = "msy",
#   ref_line_sb = "msy"
# )

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
  # convert_output = TRUE, # comment out this line when output is already converted to standard framework
  # resdir = here::here("data"), # comment out this line when output is already converted to standard framework
  # model_results = "Report.sso", # comment out this line when output is already converted to standard framework
  # model = "SS3", # comment out this line when output is already converted to standard framework
  resdir = file.path(getwd(), "report"), # comment out this line when there is no standard output
  model_results = "Petrale_sole_std_res_2023.csv", # comment out this line when there is no standard output
  rda_dir = here::here('report'),
  ref_line = "msy",
  ref_line_sb = "msy"
)

#### Debugging ####

# Uncomment to read in output from converted in create_template and execute fxns below
# output <- utils::read.csv(here::here("report","Petrale_sole_std_res_2023.csv"))

# See set up of standard output file
# View(output)

# Uncomment if rdas were not created from create_template
# satf::exp_all_figs_tables(
#   output,
#   ref_line = "msy",
#   ref_line_sb = "msy"
# )

# Uncomment if biomass plot was not created
# satf::plot_biomass(
#   output,
#   ref_line = "msy", # change reference to fit data
#   make_rda = TRUE
# )

# Uncomment if spawning biomass plot was not created
# satf::plot_spawning_biomass(
#   output,
#   ref_line = "msy", # change reference to fit data
#   make_rda = TRUE
# )

# Uncomment if spawn recruitment plot was not created
# satf::plot_spawn_recruitment(
#   output,
#   end_year = 2022,
#   make_rda = TRUE
# )

