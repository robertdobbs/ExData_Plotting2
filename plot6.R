library(plyr)
library(reshape2)
library(ggplot2)

nei <- readRDS("summarySCC_PM25.rds")
nei.la.baltimore <- subset(nei, fips == "24510" | fips == "06037")
nei.la.baltimore.motor <- subset(nei.la.baltimore, type == "ON-ROAD")

pivot <- dcast(nei.la.baltimore.motor, year ~ fips, sum, value.var = "Emissions")
pivot <- rename(pivot, c("24510" = "Baltimore City", "06037" = "Los Angeles County"))
unpivot <- melt(pivot, id = "year", value.name = "Emissions")
unpivot <- rename(unpivot, c("variable" = "Location"))

png(filename = "plot6.png")
ggplot	(
		unpivot, 
		aes(year, Emissions, fill = Location)
		) + 
		ggtitle('Total Emissions of Motor Vehicle By Location') +
		ylab(expression(PM[2.5] ~ Emissions ~ (tons))) + 
		xlab('Year') +				
		geom_bar(stat = "identity", position = "dodge") 
dev.off()



