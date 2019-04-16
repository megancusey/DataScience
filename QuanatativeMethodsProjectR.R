#LOAD CSV file
real.data <- read.csv("C:/Users/Megan.Cusey/Downloads/VGD.csv",header=TRUE)
real.data
#BAR CHART SHOWS NET WAGER AS A FUNCTION OF VGT FOR ALL FISCAL YEARS.
means.NetWagerVGTCounts <- aggregate(real.data$NetWagePerMachine[real.data$Year!=2012 & real.data$Year !=2019] ~ real.data$VGTCount[real.data$Year!=2012 & real.data$Year !=2019], FUN = mean)
means.NetWagerVGTCounts
plot(means.NetWagerVGTCounts)

means.NetWagerVGTCounts2<-t(means.NetWagerVGTCounts[-1]) #removes first column and transposes (arranges in rows)

colnames(means.NetWagerVGTCounts2) <- means.NetWagerVGTCounts[,1] #Sets VGT as column names

barplot(means.NetWagerVGTCounts2,
        col="lightblue",
        main="Net Wager Per VGT Count",
        xlab="Number of Terminals",
        ylab="Net Wager")

#######################################################################

#######################################################################
# Objective #1 - Box plot indicating clear pattern, even with outliers that there 
# is a pattern between the number of terminals and net wager amount per video game 
# terminal over the years.

means <- aggregate(real.data$NetWagePerMachine[real.data$Year!=2012 & 
      real.data$Year !=2019] ~ real.data$VGTCount[real.data$Year!=2012 & 
      real.data$Year !=2019] + real.data$Year[real.data$Year!=2012 & 
      real.data$Year !=2019], FUN=mean)
mean.2 <- means[-2]
names(mean.2) <- c("VGTCount", "NetWagerPerMachine")
mean.2

plot(mean.2)

anov <- aov(mean.2$NetWagerPerMachine~mean.2$VGTCount)
summary(anov)

### Conclusion - We  reject the null hypothesis, and accept the null hypothesis that there is a difference in the mean of
### of net wagers based on VGTCount. WHY? Do places with more machines get more business?? Future Study.
#######################################################################
#Objective #2 - Fiscal Year and NetWagers
means <- aggregate(real.data$NetWagePerMachine[real.data$Year!=2012 & 
         real.data$Year !=2019] ~ real.data$VGTCount[real.data$Year!=2012 & 
         real.data$Year !=2019] + real.data$Year[real.data$Year!=2012 & 
         real.data$Year !=2019], FUN=mean)
means
mean.2 <- means[-1]
names(mean.2) <- c("Year", "NetWagerPerMachine")
mean.2

plot(mean.2)

anov <- aov(mean.2$NetWagerPerMachine~mean.2$Year)
summary(anov)

### Conclusion - We cannot reject the null hypothesis, results are inconclusive. There is not a 
### significant difference between netwagers and years.
#######################################################################
#Objective #3 Seasons and Net Wager Means
means <- aggregate(real.data$NetWager[real.data$Year!=2012 & 
         real.data$Year !=2019] ~ real.data$Season[real.data$Year!=2012 &
         real.data$Year !=2019]+real.data$MuncipalityCd[real.data$Year!=2012 & 
         real.data$Year !=2019], FUN=mean)
names(means) <- c("Season", "Muncipality", "NetWagersPerSeason")
means


plot(means$NetWagersPerSeason~means$Season)
barchart(means$NetWagersPerSeason~means$Season,
        col="grey",
        main="Net Wagers Per Season",
        xlab="Season",
        ylab="Net Wagers")

anov<- aov(means$NetWagersPerSeason~means$Season)
summary(anov)

### Conclusion - We cannot reject the null hypothesis, results are inconclusive. There is not a 
### significant difference between netwagers and years.
