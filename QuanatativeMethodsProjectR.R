#LOAD CSV file
real.data <- read.csv("C:/Users/cusey/Downloads/VGD.csv",header=TRUE)
real.data
#BAR CHART SHOWS NET WAGER AS A FUNCTION OF VGT FOR ALL FISCAL YEARS.
means.NetWagerVGTCounts <- aggregate(real.data$NetWagePerMachine[Year!=2012] ~ real.data$VGTCount[Year!=2012], FUN = mean)
means.NetWagerVGTCounts
plot(means.NetWagerVGTCounts)

means.NetWagerVGTCounts2<-t(means.NetWagerVGTCounts[-1]) #removes first column and transposes (arranges in rows)

colnames(means.NetWagerVGTCounts2) <- means.NetWagerVGTCounts[,1] #Sets VGT as column names

barplot(means.NetWagerVGTCounts2,
        col="lightblue",
        main="Net Wager Per VGT Count",
        xlab="Number of Terminals",
        ylab="Net Wager")

boxplot(real.data$NetWagePerMachine[real.data$Year!=2012]~real.data$VGTCount[real.data$Year!=2012]+real.data$Year[real.data$Year!=2012],
        col="lightblue",
        main="Net Wager Per VGT Count 2013-2019",
        xlab="Number of Terminals/Year",
        ylab="Net Wager Per Video Game Terminal")

barchart(real.data$NetWagePerMachine[real.data$Year!=2012]~real.data$VGTCount[real.data$Year!=2012]+real.data$Year[real.data$Year!=2012],
        col="lightblue",
        main="Net Wager Per VGT Count 2013-2019",
        xlab="Number of Terminals/Year",
        ylab="Net Wager Per Video Game Terminal")

#######################################################################
#BAR CHART SHOWS NET WAGER AS A FUNCTION FOR ALL FISCAL YEARS

means.fy.1 <- aggregate(real.data$NetWager~real.data$Year, FUN=mean)
means.fy.1
plot(means.fy.1)



#######################################################################
#Objective #1 - Box plot indicating clear pattern, even with outliers that there is a pattern between the number of terminals and 
#net wager amount per video game terminal over the years.
boxplot(real.data$NetWagePerMachine[real.data$Year!=2012]~real.data$VGTCount[real.data$Year!=2012]+real.data$Year[real.data$Year!=2012],
        col="lightblue",
        main="Net Wager Per VGT Count 2013-2019",
        xlab="Number of Terminals/Year",
        ylab="Net Wager Per Video Game Terminal")


#######################################################################


netWager <- vgd.data$NetWager
netWager2 <- vgd.data3$NetWager
netWager.Auburn <- vgd.data$NetWager[vgd.data$MuncipalityCd==1]
netWager.Springfield <- vgd.data$NetWager[vgd.data$MuncipalityCd==2]
netWager.Sangamon <- vgd.data$NetWager[vgd.data$MuncipalityCd==3]

      netWager.Auburn.histogram <-hist(netWager.Auburn,
                                   prob=TRUE,
                                   #ylim=c(0,.04),
                                   #xlim=c(30,100),
                                   #breaks=11,
                                   col="#E5E5E5",
                                   border=0,
                                   main ="Auburn Net Wager Data"
                                  )
      curve(dnorm(x, mean=mean(netWager.Auburn),sd(netWager.Auburn)),
            col="red",
            lwd=3,
            add=TRUE)
netWager.Springfield.histogram <- hist(netWager.Springfield,
                                   prob=TRUE,
                                   #ylim=c(0,.04),
                                   #xlim=c(30,100),
                                   #breaks=11,
                                   col="#E5E5E5",
                                   border=0,
                                   main ="Springfield Net Wager Data"
                                  )
curve(dnorm(x, mean=mean(netWager.Springfield),sd(netWager.Springfield)),
      col="red",
      lwd=3,
      add=TRUE)
netWager.Sangamon.histogram <-   hist(netWager.Sangamon,
                                  prob=TRUE,
                                  #ylim=c(0,.04),
                                  #xlim=c(30,100),
                                  #breaks=11,
                                  col="#E5E5E5",
                                  border=0,
                                  main ="Springfield Net Wager Data"
                                 )

curve(dnorm(x, mean=mean(netWager.Sangamon),sd(netWager.Sangamon)),
      col="red",
      lwd=3,
      add=TRUE)

#Where would this be valuable in the data?? Since this is going to take the sum of the VGTCounts for each establishment, each year, each month.
vgt.count <- table(vgd.data$VGTCount)
vgt.count

fivenum(vgd.data$VGTCount)
boxplot.stats(vgd.data$VGTCount)

#How does the number of VGT effect net wagers per establishment? Is there a correlation between high number of VGT in an establishment?
#If the the net wager amount is unsignificant between number of VGT, is it better to play in an establishment with fewer VGT?

#Has the net wagers amount significantly differed between FY

#How do winter months compare to other seasons?

vgd.trans <-log10(vgd.data$NetWager + 1)
vgd.trans
#islands.log10
#islands.log2
hist(vgd.trans)
boxplot.stats(vgd.trans$NetWager)



rm(list=ls())

#x1 <- netWager^2
#hist(x1)
#boxplot(x1)
#x2 <- netWager^4
#hist(x2)
#boxplot(x2)
#x3 <- log(netWager)
#hist(x3)
#boxplot(x3)
#x4 <- log10(netWager)
#hist(x4)
#boxplot(x4)
#boxplot.stats(x4)
#x5 <- log2(netWager)
#hist(x5)
#boxplot(x5)
#boxplot.stats(x5)

#Code idk that helps me
summary(real.data$NetWagerPerMachine)
real.data.mean <- mean(real.data$NetWagerPerMachine,trim=.15)
str(real.data)
boxplot.stats(vgd.data$NetWager)
vgd.data2 <- vgd.data[which(vgd.data$NetWager > 70000),]
vgd.data3 <- vgd.data[which(vgd.data$NetWager < 100000),]
vgd.data3
boxplot.stats(vgd.data3$NetWager)

mean(year.data$NetWager[year.data$Month==1])
aggregate(real.data$NetWager ~ real.data$Year, FUN=mean)

aggregate(cbind(real.data$NetWager, real.data$VGTCount)~real.data$Year, FUN=mean) #VGTCount doesn't really help here.


View(real.data$NetWagePerMachine)

