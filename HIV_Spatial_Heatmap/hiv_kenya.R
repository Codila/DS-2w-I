require("rgdal") # requires sp, will use proj.4 if installed
require("maptools")
require("ggplot2")
require("plyr") 
# reading in the shape file
kenya = readOGR(dsn="C:/Users/Varun-PC/Desktop/HIV_Hack/Kenya/ShapeFile/kenyan-counties",layer = "County")
kenya@data$id = rownames(kenya@data)
kenya.points = fortify(kenya, region="id")
kenya.df = join(kenya.points, kenya@data, by="id")

ggplot(kenya.df) +
	aes(long,lat,group=group,fill="kenya$data$id") +
	geom_polygon() +
	geom_path(color="white") +
	coord_equal() +
	scale_fill_brewer("id")
# use library leadlet to buld your kenya dataframe
library(leaflet)
l <- leaflet(kenya) %>% addTiles()

pal <- colorNumeric(palette = "Yellow", domain = kenya$COUNTY3_ID)
str(pal)
l %>% addPolygons(color = "gray", weight = 1, fillColor = ~pal(COUNTY3_ID), fillOpacity =0) %>%
	addLegend(pal = pal, values = ~COUNTY3_ID,opacity = 0,  title = "SMR", position = "bottomright")

str(kenya.df$COUNTY3_ID)
View(kenya@data)
str(kenya)
 
