scc<- readRDS("Source_Classification_Code.rds")
nei<- readRDS("summarySCC_PM25.rds")
a<- subset(nei, nei$fips=="24510")
total<- summarise(group_by(a, year), Emissions=sum(Emissions))
colores <- c("red", "green", "blue", "yellow")
png(file="plot2.png",width=480, height=480)
barplot(total$Emissions,names.arg=total$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,4000),
        main=expression('Total PM'[2.5]*' emissions in the Baltimore City, Maryland'),col=colores)
dev.off()

