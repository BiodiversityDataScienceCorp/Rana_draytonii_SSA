#Querying, cleaning, and mapping gbif data

#spocc: interface to SPecies OCCurrence data sources

#Install packages and load libraries:
install.packages("spocc")
install.packages("tidyverse") #includes ggplot
library(spocc)
library(tidyverse)


# We can directly query occurrence data in R with the "occ" function, which is part of the spocc package.
# Take a look at the documentation here:
# https://www.rdocumentation.org/packages/spocc/versions/0.1.0/topics/occ

# gbifopts: run occ_options('gbif') in console to see possibilities()

myQuery<-occ(query="Rana draytonii", from="gbif", limit=4000)

# Drill down to get the data using "$", and show from Env window
rana <- myQuery$gbif$data$Rana_draytonii


### Let's initially plot the data on a map.
wrld<-ggplot2::map_data("world")

ggplot()+
  geom_polygon(data=wrld, mapping=aes(x=long, y=lat, group=group), fill="grey75", colour="grey60")+
  geom_point(data=rana, mapping=aes(x=longitude, y=latitude), show.legend=FALSE)+
  labs(title="Species occurrences of R. draytonii", x="longitude", y="latitude")


# Clean the data
### remove outliers (outside of normal sp range), remove duplicates, deal with NA values

cleanRana <- rana %>% 
  filter(longitude < 0) %>% 
  filter(latitude != "NA", longitude != "NA") %>% 
  mutate(location = paste(latitude, longitude, dateIdentified, sep = "/")) %>%
  distinct(location, .keep_all = TRUE) %>% 
  filter(occurrenceStatus == "PRESENT")


# get a subset of the data (just lat, long, and date)
cleanRana <- cleanRana %>% 
  select(longitude, latitude, eventDate)

# write to csv in data folder 
write.csv(cleanRana, "data/cleanrana.csv.csv")
