################################################################################
# ASAR DEMO
################################################################################

# Application of ASAR to a recently published stock assessment report
# petrale sole (U.S. West Coast)

# Package dependencies for downloading
install.packages('remotes')
install.packages('tinytex')
install.packages('here')
library(tinytex)

# Install package(s)
remotes::install_github("nmfs-ost/asar") # automated stock assessment reporting
remotes::install_github("nmfs-ost/satf") # stock assessment tables and figures

# Load here to form relative paths for files
library(here)

# Optional: convert output first
petrale_output <- asar::convert_output(
  output_file = file.path(getwd(), "data", "Report.sso"),
  model = "ss3"
)

# Save output in order to use and load it into quarto
save(petrale_output, file = here::here("data", "petrale_output.rda"))

# Optional: create all figures and tables before creating template
#           *must run convert_output first
# satf::exp_all_figs_tables(
#   output,
#   ref_line = "msy",
#   ref_line_sb = "msy",
#   indices_unit = ""
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
  author = c("Ian G. Taylor"="NWFSC", "Vladlena Gertseva"="NWFSC", "Nick Tolimieri"="NWFSC"),
  include_affiliation = TRUE,
  simple_affiliation = FALSE,
  param_names = c("nf","sf"),
  param_values = c("North fleet", "South fleet"),
  model_results = petrale_output # comment out this line when there is no standard output
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

