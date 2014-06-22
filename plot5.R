nei <- readRDS("summarySCC_PM25.rds")
nei.baltimore <- subset(nei, fips == "24510")
nei.baltimore.motor <- subset(nei.baltimore, type == "ON-ROAD")
emi = aggregate(Emissions ~ year, data = nei.baltimore.motor, sum)

png(filename = "plot5.png")
barplot	(
		emi[,2],		
		col = "blue",
		xlab = "Year",
		names = c("1999", "2002", "2005", "2008"),
		ylab = expression(PM[2.5]~Emissions~(tons)), 
		main = "Total Baltimore Motor Vehicle Emissions"
		)
dev.off()