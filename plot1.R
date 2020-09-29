scc<- readRDS("Source_Classification_Code.rds")
nei<- readRDS("summarySCC_PM25.rds")
total<- summarise(group_by(nei, year), Emissions=sum(Emissions))
colores <- c("red", "green", "blue", "yellow")
png(file="plot1.png",width=480, height=480)
barplot(total$Emissions/1000,names.arg=total$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,8000),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=colores)
dev.off()
