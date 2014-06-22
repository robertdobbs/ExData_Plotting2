nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

coal <- subset(scc, grepl(" Coal", as.character(EI.Sector)))
coal.nei <- subset(nei, SCC %in% coal$SCC)
emi = aggregate(coal.nei$Emissions ~ year, data = coal.nei, sum)

png(filename = "plot4.png")
barplot	(
		emi[,2],		
		col = "blue",
		xlab = "Year",
		names = c("1999", "2002", "2005", "2008"),
		ylab = expression(PM[2.5] ~ Emissions ~ (tons)), 
		main = "Total US Coal Emissions"
		)
dev.off()