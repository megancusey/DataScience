#Basic Math Hit CNTRL + ENTER to run
8+5

1:250 #Prints #1-250

#Clear Console -> CTRL + L

#Print Hello World
print("Hello World!")

# Assign Variables
x <- 1:5
x
y <- c(6,7,8,9,10) # assigns values to y to a vector w/ concatenate function
y

a <-b<-c<-3 # assigns everything to 3

x+y #Adds corresponding elements in x and y

x*2 # multiplies each element by 2


rm(x) # removes x
rm(a, b) # only removes specified items
rm(list = ls()) #clear entire workspace

#Installing and Managing Packages
browseURL("http://cran.r-project.org/web/views/")
browseURL("http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html")
browseURL("http://crantastic.org")

#See current packages
library()
search() #shows packages curren loaded

#To install and use packages 
install.packages("ggplot2")
library()
require("ggplot2")


browseVignettes("ggplot2")

update.packages() #check for updates
?update.packages() #Get help for update.packagesy
#remove.packages("packageName") removes a package


#list datasets
library(help="datasets")
data() 

#load data from a dataset
data(airmiles)
airmiles

#See metadata/structure of the data
str(airmiles)

#dataset with rows and columns
data(anscombe)
str(anscombe)
#view rows/columns
View(anscombe)

rm(list=ls())

#Creating sequential data
x1 <- 0:10
x1

x2 <- 10:0
x2

#use seq to assign 1-10... starts at 1 not 0
x3 <- seq(10)
x3

x4<- seq(30,0, by = -3) #starts at 30, goes to 0, counts down by 3 (hence negative 3)
x4

x5<- c(5,4,1,6,7,2,2,3,2,8) #concatenate
x5

x6 <- scan() #allows user to enter numbers in terminal. Press return twice to exit
x6
ls() #list objects 
rm(list=ls())

#loading Data
#Excel Files - Avoid using Excel Spreadsheets

#CSV file
vgd.data <- read.csv("C:/Users/cusey/Downloads/VGD.csv",header=TRUE)

View(vgd.data)

#converting tabular data to row data
str(UCBAdmissions)
UCBAdmissions
#if you want to specify a column in the row, it wouldn't work. Needs to be row data.


#get marginal frequencies from original table
margin.table(UCBAdmissions,1) #admit
margin.table(UCBAdmissions,2) #gender
margin.table(UCBAdmissions,3) #deptartment
margin.table(UCBAdmissions) #overall

#save marginals as a new table
admit.dept <- margin.table(UCBAdmissions,3) #dept
str(admin.dept)
barplot(admit.dept)
prop.table(admit.dept)
round(prop.table(admit.dept),2) # round frequency
#margin.table(vgd.data) #overall

data <- as.data.frame.table(vgd.data)
View(data)

str(data)

#Work with color
#barplot
x=c(12,4,21,17,13,9)
barplot(x)
#R specifies color in several ways
colors() #list all colors name
barplot(x,col="slategray3")
# From color name's position in alphabetically-ordered vector of colors()
#Specify colors()[i], where i is index number in vector

barplot(x, col=colors()[102]) #darseagreen

#RBG Tripletes
#separetely specify the red, green, and blue components of the color
#By default, colors are specified in 0-1 range
# can specifiy 0-255 range by adding max=255
#convert names to rgb with col2rbg

col2rgb("navyblue")

barplot(x, col=rgb(137,.0,.0, max=255)) #darkred (255 * .54)
barplot(x, col=rgb(159,182,205, max=255)) #darkred (255 * .54)
#RGb Hexcodes
barplot(x, col = "#ffebcd")

#Multiple colros
#specify solors
barplot(x, col=c("red","blue")) #colors cycle
#Palletes
#built in palettes

help(package=colorspace)
pallete()

barplot(x, col=rainbow(6))
barplot(x, col = heat.colors(6))
barplot(x, col=terrain.colors(6))
barplot(x, col=topo.colors(6))
barplot(x, col=cm.colors(6))

#Colorbrewer
browseURL("http://colorbrewer2.org/")

install.packages("RColorBrewer")

require("RColorBrewer")
display.brewer.all()

display.brewer.pal(8,"Accent")
display.brewer.pal(4,"Spectral")
blues <- brewer.pal(6,"Blues")

barplot(x, col=blues)

barplot(x, col=brewer.pal(6,"Greens"))
barplot(x, col=brewer.pal(6,"YlOrRd"))
barplot(x, col=brewer.pal(6,"RdGy"))
barplot(x, col=brewer.pal(6,"BrBG"))
barplot(x, col=brewer.pal(6,"Dark2"))
barplot(x, col=brewer.pal(6,"Paired"))
barplot(x, col=brewer.pal(6,"Pastel2"))
barplot(x, col=brewer.pal(6,"Set3"))

#When ready to clean up colorbrewer
#palette("default")
#detach("package:RColorBrewer",unload=TRUE)
#rm(list=ls())

#Help on plots
?plot
#ONE ROW PER CASE
?chickwts
chickwts
data("chickwts")
plot(chickwts$feed)

# Tangent
#EXAMPLE Anger_Out_Women <- angry_moods2$Anger_Out[angry_moods2$Gender==2]
#plotDataTest <- vgd.data$VGTCount[vgd.data$MuncipalityCd==1]
#plot(plotDataTest)
#View(plotDataTest)

prop.table(data, data$Freq.VGTCount) # like margin.table

feeds <- table(chickwts$feed)
feeds
barplot(feeds)

# Put bars in descending order, add "order
barplot(feeds[order(feeds,decreasing=TRUE)])

#Customize chart
par(oma=c(1,1,1,1)) #Set outside margins: b,l,t,r
par(mar=c(4,5,2,1)) #Set plot margins
barplot(feeds[order(feeds)],
        horiz=TRUE,
        las = 1, #las gives orientation of axis labels,
        col = c("beige","blanchedalmond", "bisque1",
                "bisque2","bisque3", "bisque4"),
        border=NA, #no borders on bars
        main="Frequences of Different Feeds\nin chickwts Dataset", #\n = line break
        xlab="Number of Chicks")
?par

#Pie Charts for categorical variables
#Create a table with frequences
feeds <-table(chickwts$feed)
feeds

pie(feeds)
#modify pie chart
pie(feeds[order(feeds,decreasing=TRUE)],
    init.angle = 90,
    clockwise = TRUE,
    col = c("seashell","cadetblue2","lightpink","lightcyan","plum1","papayawhip"),
    main="Pie Chart of Feeds from chickwts")

#PROBLEMS WITH PIE CHARTS
pie.a <- c(22,14,18,20,14,12)
pie.b <- c(20,18,16,18,16,12)
pie.c <- c(12,14,20,18,14,22)

oldpar <- par() #stores old graphical parameters
par(mfrow = c(1,3), # Number of rows/col
    cex.main = 3) # main title 3x bigger

colors <- c("grey98", "grey90", "lightskyblue", "lightgreen", "grey98", "grey90")

pie(pie.a, main="Pie A", col=colors)
pie(pie.b, main="Pie B", col=colors)
pie(pie.c, main="Pie C", col=colors)

barplot(pie.a, main="Bar A", col=colors)
barplot(pie.b, main="Bar B", col=colors)
barplot(pie.c, main="Bar C", col=colors)

par(oldpar)
rm(list=ls())


#histograms for quantative variables
require("datasets")
?lynx
data(lynx)

hist(lynx)

#Modify Histogram
h <- hist(lynx,
          breaks = 11, #Suggests 11 bins
          #breaks = seq(0,7000,by=100)
          #breaks = c(0,100,300,500,3000,3500,7000)
          freq=FALSE,
          col="thistle1",
          main="Histogram of Annual Canadian Lynx Trappings \n1821-1934",
          xlab="Number of Lynx Trapped"
          )
#if freq = FALSE, draw normal distribution

curve(dnorm(x,mean=mean(lynx), sd=sd(lynx)),
      col = "thistle4",
      lwd=2,
      add=TRUE)

USJudgeRatings
data("USJudgeRatings")
boxplot(USJudgeRatings$RTEN)

#Modifying a boxplot

boxplot(USJudgeRatings,
        horizontal = TRUE,
        notch=TRUE, #Notches for CI for median
        ylim=c(0,10), #specifies range on y axis
        col="slategray3",
        boxwex=.5, #width of box as proportion of original
        whisklty = 1, #Whisker line type = 1 = solid line
        staplelty = 0, #staple (line at end type; 0 = none)
        outpch = 16, #symbols for outliers; 16 = filled circl
        outcol="slategray3", #color for outliers
        main ="Lawyers' Ratings of State Judges in the\nUS Superior Court (c.1977)",
        xlab="Lawyers' Rating")


boxplot(vgd.data$NetWager,
        horizontal = TRUE,
        notch=TRUE, #Notches for CI for median
        #ylim=c(50000,100000), #specifies range on y axis
        col="slategray3",
        boxwex=.5, #width of box as proportion of original
        whisklty = 1, #Whisker line type = 1 = solid line
        staplelty = 0, #staple (line at end type; 0 = none)
        outpch = 16, #symbols for outliers; 16 = filled circl
        outcol="slategray3"#, #color for outliers
        #main ="Lawyers' Ratings of State Judges in the\nUS Superior Court (c.1977)",
        #xlab="Lawyers' Rating"
        )
options(scipen=5) # removes scientific notation

swiss

str(swiss)
data(swiss)
fertility <-swiss$Fertility
#plots
#plot1: Histogram
h <- hist(fertility,
           prob=TRUE,
           ylim=c(0,.04),
           xlim=c(30,100),
           breaks=11,
           col="#E5E5E5",
           border=0,
           main ="Fertility for 47 French-Speaking\n Provinces, c.1888"
          )

#plot 2: Normal Curve
curve(dnorm(x, mean=mean(fertility),sd(fertility)),
      col="red",
      lwd=3,
      add=TRUE)

#plot 3 & 4: Kernal density line (if prob = TRUE)
lines(density(fertility), col="blue")
lines(density(fertility, adjust=3), col="darkgreen") # moving average

#plot 5: RUG that is lineplot underhistogram
rug(fertility, col="red")


#Export Charts
#Hard Way - PNG file
png(filename="C:/Users/cusey/Downloads/example.png", #Open Device
    width=888,
    height=571)
par(oma=c(1,1,1,1))
par(mar=c(4,5,2,1))
barplot(feeds[order(feeds)],
        horiz=TRUE,
        las=1,
        col=c("beige","blanchedalmond","bisque1", "bisque2", "bisque3","bisque4"),
        border=NA,
        main="Frequencies of Different Feeds\nin chickwts Dataset",
        xlab="Number of chicks")
dev.off() #Close Device - run in same block of code

#PDF
pdf("C:/Users/cusey/Downloads/example2.pdf",
    width=9, #inches
    height = 6)
par(oma=c(1,1,1,1))
par(mar=c(4,5,2,1))
barplot(feeds[order(feeds)],
        horiz=TRUE,
        las=1,
        col=c("beige","blanchedalmond","bisque1", "bisque2", "bisque3","bisque4"),
        border=NA,
        main="Frequencies of Different Feeds\nin chickwts Dataset",
        xlab="Number of chicks")
dev.off() #Close Device - run in same block of code

#Easy way - Use export button in the Plot Tab.
par(oma=c(1,1,1,1))
par(mar=c(4,5,2,1))
barplot(feeds[order(feeds)],
        horiz=TRUE,
        las=1,
        col=c("beige","blanchedalmond","bisque1", "bisque2", "bisque3","bisque4"),
        border=NA,
        main="Frequencies of Different Feeds\nin chickwts Dataset",
        xlab="Number of chicks")

#Calculating Frequencies - Qaulatative
groups <- c(rep("blue", 3990),
            rep("red",4140),
            rep("orange",1890),
            rep("green",3770),
            rep("purple",855))

groups.t1 <-table(groups)
groups.t1

#MODIFY FREQUENCY TABLES
groups.t2 <-sort(groups.t1, decreasing=TRUE)
groups.t2


#PROPORTIONS AND PERCENTAGES
prop.table(groups.t2)
round(prop.table(groups.t2),2) * 100

#Calculating Descriptives
data(cars)
cars

str(cars)

#Calculate descriptives

summary(cars$speed)
summary(cars)

#Tukey's five-number summary: min, lower-hinge, median, upper-hinge, max. no labels
fivenum(cars$speed)
boxplot.stats(cars$speed)

#alternative descriptives - ??? couldn't get to work
install.packages("psych")
require("psych")
describe(cars)


#In the 2012 Major League Baseball season, the Washington Nationals
#had the best record at the end of the regular season: 98 wins out
#of the 162 games (.605). Is this significantly greater than 50%?

#PROP Test
#98 successes (games) of 162
prop.test(98,162)
#alternative hypothesis is true
#reject null hypothesis (assumes 50%)


#One-tailed test with 90% CI
prop.test(98,162,alt="greater", conf.level = .90)

#Hypothesis test and confidence interval of a mean
# Assumes null hypothesis is mean = 0... however, thats not also applicable if 0 isn't a choice
#EX: mean of survey answers on a question that uses a 1-5 scale.
quakes
quakes[1:5,] #Gets first 5 observations
mag <- quakes$mag
mag

t.test(mag)

#Assign null hypothesis mean
t.test(mag,alternative="greater", mu=4)

#one sample chi-square test, goodness of fit
HairEyeColor

#get marginal frequency for eye color

eye <- margin.table(HairEyeColor,2)
round(prop.table(eye),2)

#Pearson's chi-squares test
#Need one-dimensional goodness of fit test
#Default test (assume equal distribution)
chi1<-chisq.test(eye) #Results say that these samples do not have equal distribution (which we know already)
chi1

#load in population data
# population data from web page
# Approximate proportions:
# Brown: .41
# Blue: .32
# Harzel: .15
# Green: .12
# p=c(.41, .32, .15, .12)

#Compare sample vs population

chi2 <- chisq.test(eye, p=c(.41, .32, .15, .12))
chi2

#Proprability value of getting observed findings if the null hypothesis is true is not significant

#Robush statistics for univariate analyses
state.area
area <- state.area
area
hist(area)
boxplot(area)
boxplot.stats(area)
summary(area)

#Robust methods for describing center
mean(area) #NOT ROBUST
median(area)
mean(area, trim=.05) #5% from each end (10% total)

#Robust methods for describing variation
sd(area) #NOT ROBUST SD can't be bigger than mean
mad(area) #Median absolute deviation
IQR(area) #Interquartile range

#Examining Outliers
#Quantative
data(rivers)
hist(rivers)
rivers
boxplot(rivers, horizontal = TRUE)
rivers.low <- rivers[rivers <1210]
boxplot(rivers.low)
boxplot.stats(rivers.low)
rivers.low2 <-rivers[rivers < 1055]
boxplot.stats(rivers.low2)

#Transforming variables
islands
hist(islands,breaks=16)
boxplot(islands)

#z-scores
islands.z <-scale(islands)
islands.z
hist(islands.z)
attr(islands.z,"scaled:center") #shows original mean
attr(islands.z,"scaled:scale") #shows original SD
islands.z <- as.numeric(islands.z)
islands.z

#logarithmic Transformation
islands.ln <-log(islands)
#islands.log10
#islands.log2
hist(islands.ln)
boxplot(islands.ln)
x.ln <- log(x+1) #if 0s exist
#squaring for negatively skewed variables
#Distribution may need to be recentered so that all values are positive

#Ranking
islands.rank1<-rank(islands)
hist(islands.rank1)
boxplot(islands.rank1)
#ties.method = "c("average", "first","random", "max","min")

#Dichotomizing
#Use wisely and purposefully!
#split at 1000 (=1,000,000 square miles)
continent <- ifelse(islands >1000,1,0)
continent

#Create variable rn1 with 1 million random normal values
#Will vary from one time ot another
rn1 <- rnorm(1000000)
hist(rn1)
summary(rn1)

rn2 <- rnorm(1000000)
hist(rn2)
summary(rn2)

#Average scores across two variables
rn.mean <- (rn1+rn2)/2
hist(rn.mean)

#Multiple scores across two variables
rn.prod <-rn1*rn2
hist(rn.prod)
summary(rn.prod)

#Kurtosis Comparison
#"moments" gives kurtosis where a mesokurtic, normal distribution
#has a value of 3. 
install.packages("psych")
require("psych")
kurtosi(rn1)
kurtosi(rn2)
kurtosi(rn.mean)
kurtosi(rn.prod)


#Missing data
x1 <- c(1,2,3,NA,5)
summary(x1)
mean(x1)
which(is.na(x1)) #Tells the index for where there is an NA
mean(x1, na.rm=TRUE) #Tells mean function to ignore NA
#Replace missing values with 0
x2 <- x1
x2[is.na(x2)] <- 0
x2

#Use ifelse
x3 <- ifelse(is.na(x1), 0, x1)
x3


#creating bar charts of group means
spray <- InsectSprays

#To plot means, first get hte means for the group
means <- aggregate(spray$count ~ spray$spray, FUN = mean)
means
plot(means) #get lines for the means
#To get barplot, extract means and reorganize
mean.data<-t(means[-1]) #removes first column and transposes (arranges in rows)
mean.data
colnames(mean.data) <- means[,1]
barplot(mean.data)


barplot(mean.data,
        col="lightblue",
        main="Effectiveness of Insect Sprays",
        xlab="Spray Used",
        ylab="Insect Count")

#Creating grouped boxplot
require(MASS)
data(painters)
painters
boxplot(painters$Expression ~ painters$School,
        col= brewer.pal(8,"Pastel2"),
        names = c("Renais",
                  "Mannerist",
                  "Seicento",
                  "Venetian",
                  "Lomard",
                  "16th C.",
                  "17th C.",
                  "French"),
        #notch=TRUE,)
        boxwex=.5,
        whisklty=1,
        staplelty=1,
        outpch=16,
        outcol=brewer.pal(8,"Pastel2"),
        main="Expression of Painters By School",
        ylab="Expression Ratings"
        )
#Scatter plots
data(cars)
plot(cars)
plot(cars,
    pch=16,
    col="gray",
    main="Speed vs Stopping Distance",
    xlab="Speed",
    ylab="Stopping Distance")
abline(lm(cars$dist ~ cars$speed),
       col="darkred",
       lwd=2)

lines(lowess(cars$speed,cars$dist),
      col="blue",
      lwd=2)
install.packages("car")
require("car")
scatterplot(cars$dist~cars$speed,
            pch=16,
            col="darkblue",
            main="Speed vs. Stopping",
            xlab="Speed",
            ylab="Stopping")

data(swiss)
round(cor(swiss),2)
cor.test(swiss$Fertility,swiss$Education)

cor.test(real.data$VGTCount[real.data$Year==2013 & real.data$MuncipalityCd==2],real.data$NetWagePerMachine[real.data$Year==2013 & real.data$MuncipalityCd==2])

cor.test(real.data$Year,real.data$NetWagePerMachine[real.data$Year==2013 & real.data$MuncipalityCd==2])
aggregate(real.data$NetWager~real.data$Year, FUN=mean)

data(trees)
plot(trees$Girth,trees$Height)
abline(lm(trees$Height ~ trees$Girth))
reg1 <- lm(Height ~ Girth, data = trees)
reg1
summary(reg1)
confint(reg1)
predict(reg1, interval="prediction")
lm.influence(reg1)
influence.measures(reg1)


real.data[1:5,]
mean <- aggregate(real.data$NetWager~real.data$Season, FUN=mean)
boxplot(real.data$NetWager~real.data$Season)
boxplot.stats(real.data$NetWagerPerMachine)
View(real.data[,real.data$NetWager==57991.84])
