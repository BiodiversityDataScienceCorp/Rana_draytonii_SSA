# creating the occurence map of the Rana data

#Install packages and load libraries:
install.packages("spocc")
install.packages("tidyverse") #includes ggplot
library(spocc)
library(tidyverse)

# read the data
ranaData <- read_csv("data/cleansrana.csv")

# set x and y limits
xmax <- max(ranaData$longitude)
xmin <- min(ranaData$longitude)
ymax <- max(ranaData$latitude)
ymin <- min(ranaData$latitude)

# find the date range of the points to add to thetitle
range(na.omit(as.Date(ranaData$dateIdentified)))

# plot

occMap <- ggplot()+
  geom_polygon(data=wrld, mapping=aes(x=long, y=lat, group=group), fill="grey75", colour="grey60")+
  geom_point(data=ranaData, mapping=aes(x=longitude, y=latitude), show.legend=FALSE)+
  labs(title="Species occurrences of R. draytonii from 1938 - 2023", x="longitude", y="latitude") +
  coord_fixed(xlim = c(xmin, xmax), ylim = c(ymin, ymax)) +
  scale_size_area() +
  borders("state")


ggsave("outputs/occurancemap.png", plot = occMap)



