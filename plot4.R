scc<- readRDS("Source_Classification_Code.rds")
nei<- readRDS("summarySCC_PM25.rds")
combustion <- grepl("Fuel Comb.*Coal", scc$EI.Sector)
coal<- scc[combustion,]
emissions<- nei[(nei$SCC %in% coal$SCC), ]
total<- summarise(group_by(emissions, year), Emissions=sum(Emissions))
png(file="plot4.png",width=480, height=480)
barplot(total$Emissions/1000,names.arg=total$year,
        xlab="years", ylab=expression('total PM'[2.5]*' emission in kilotons'),ylim=c(0,600),
        main=expression('Total PM'[2.5]*' emissions at various years in kilotons'),col=colores)
dev.off()
