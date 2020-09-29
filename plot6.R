scc<- readRDS("Source_Classification_Code.rds")
nei<- readRDS("summarySCC_PM25.rds")
emissions<-nei[((nei$fips=="24510")|(nei$fips=="06037")),]
emissions<-emissions[emissions$type=="ON-ROAD",]
total<- summarise(group_by(emissions, year,fips), Emissions=sum(Emissions))
png(file="plot6.png",width=780, height=480)
ggplot(total, aes(x= factor(year), y=Emissions, fill=fips))+ geom_bar(stat = "identity")+facet_grid(~fips)+ ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons"))+ylab(expression("total PM"[2.5]*" emissions in tons")) +xlab("year")
dev.off()
