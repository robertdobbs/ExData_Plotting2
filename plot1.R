nei <- readRDS("summarySCC_PM25.rds")
emi = aggregate(Emissions ~ year, data = nei, sum)

png(filename = "plot1.png")
barplot	(
		emi[,2],		
		col = "blue",
		xlab = "Year",
		names = c("1999", "2002", "2005", "2008"),
		ylab = expression(PM[2.5]~Emissions~(tons)), 
		main = "Total US Emissions"
		)
dev.off()