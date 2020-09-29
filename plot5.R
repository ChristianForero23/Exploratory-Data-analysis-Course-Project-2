scc<- readRDS("Source_Classification_Code.rds")
nei<- readRDS("summarySCC_PM25.rds")
emissions<-nei[(nei$fips=="24510") & (nei$type=="ON-ROAD"),]
total<- summarise(group_by(emissions, year), Emissions=sum(Emissions))
png(file="plot5.png",width=480, height=480)
barplot(total$Emissions/1000,names.arg=total$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,600),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=colores)
dev.off()
