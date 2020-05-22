library(readr)
library(dplyr)
library(ggplot2)
library(ggmap)
library(lubridate)
library(maps)

# 4) Data Importing in R
col_names <- c("serial_num", 
               "season", 
               "num", 
               "basin", 
               "sub_basin", 
               "name", 
               "iso_time", 
               "nature", 
               "latitude", 
               "longitude", 
               "wind", 
               "press")
col_types <- cols(col_character(), 
                  col_integer(), 
                  col_character(), 
                  col_factor(), 
                  col_character(), 
                  col_character(), 
                  col_character(), 
                  col_character(), 
                  col_double(), 
                  col_double(), 
                  col_double(), 
                  col_double())

dat <- read_csv("desktop/workout1/data/ibtracs-2010-2015.csv", 
         col_names = col_names, 
         col_types = col_types,
         na = c("-999.", "-1.0", "0.0"))

dat <- dat%>%mutate(season_fact = factor(season))
dat <- dat%>%mutate(date_time = ymd_hms(iso_time))
dat <- dat%>%mutate(month_num = month(date_time))
dat <- dat%>%mutate(month_str = month(date_time, label = TRUE))

sink(file = 'desktop/workout1/output/data-summary.txt')
summary(dat)
sink()

# 5) Data Visulation
aspect_ratio <- 2.5
world <- map_data("world")
map-all-storms <- ggplot() + 
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=dat, aes(x=longitude, y=latitude, color=wind, shape=season_fact), alpha = 0.9) + 
  coord_fixed(1.3) +
  geom_hline(yintercept = 0) +
  ggtitle("Trajectory of storms (2010-2015)")
ggsave("images/map-all-storms.pdf", height = 10, width = 10 * aspect_ratio)
ggsave("images/map-all-storms.png", height = 10, width = 10 * aspect_ratio)

map-ep-na-storms-by-year <- ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=dat%>%filter((basin == "EP") | (basin == "NA")), aes(x=longitude, y=latitude, color=wind)) + 
  coord_fixed(1.3) +
  facet_grid(season~.) + 
  ggtitle("Storms in the basins EP and NA facetted by year")
ggsave("images/map-ep-na-storms-by-year.pdf", height = 10, width = 3 * aspect_ratio)
ggsave("images/map-ep-na-storms-by-year.png", height = 10, width = 3 * aspect_ratio)

map-ep-na-storms-by-month <- ggplot() +
  geom_polygon(data=world, aes(x=long, y=lat, group=group)) +
  geom_point(data=dat%>%filter((basin == "EP") | (basin == "NA")), aes(x=longitude, y=latitude, color=wind)) + 
  coord_fixed(1.3) +
  facet_grid(month_str~.) +
  ggtitle("Storms in the basins EP and NA facetted by month")
ggsave("images/map-ep-na-storms-by-month.pdf", height = 10, width = 3 * aspect_ratio)
ggsave("images/map-ep-na-storms-by-month.png", height = 10, width = 3 * aspect_ratio)




