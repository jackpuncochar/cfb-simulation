### Get College Football play by play data ###

library(dplyr)

Sys.setenv(CFBD_API_KEY = "UzM6FgnZFhKhxgn/5sJ/CpIHQgFlzAep1RBrAYAw1xbeKh+QDPyp0fvniG/MrwNr")

# Load play-by-play data since 2018 from cfbfastR package
tictoc::tic()
cfb_pbp <- data.frame()
seasons <- 2018:cfbfastR::most_recent_cfb_season()
progressr::with_progress({
  future::plan("multisession")
  cfb_pbp <- cfbfastR::load_cfb_pbp(seasons)
})
tictoc::toc()

glimpse(cfb_pbp[1:40])

# write 2018-2022 to .csv
write.csv(cfb_pbp, "C:\\Users\\punco\\OneDrive\\Desktop\\Fantasy Football\\CFB\\pbpdata2018_2023.csv", row.names = TRUE)

# Get Player usage data from cfbfastR
cfb_player_usage <- data.frame()
try(cfbfastR::cfbd_player_usage(
  year = 2023,
  #team = NULL,
  #conference = NULL,
  #position = NULL,
  athlete_id = NULL,
  excl_garbage_time = TRUE
))
progressr::with_progress({
  future::plan("multisession")
  cfb_player_usage <- cfbfastR::cfbd_player_usage(year=2023, excl_garbage_time = TRUE)
})

cfb_player_usage = cfb_player_usage %>% dplyr::filter(position %in% c("WR", "QB", "RB", "TE"))
View(cfb_player_usage)
write.csv(cfb_player_usage, "C:\\Users\\punco\\OneDrive\\Desktop\\Fantasy Football\\CFB\\cfb_player_usage.csv", row.names = TRUE)
