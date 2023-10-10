---
title: "Homework 1"
output: html_document
date: "2023-09-01"
---

#Importing Data
getwd()
bonds <- read.csv('/Users/dananguyen/Desktop/SDS_313/Homework1_Bonds.csv')


#------ Question 1 ------

#Sum of the bonds approved by voters
sum(bonds$Result == "Carried")

#Sum of the bonds defeated by voters
sum(bonds$Result == "Defeated")

#Table of proportional differences between approved/defeated bonds across different govt types
prop.table(table(bonds$Gov_Type, bonds$Result == "Carried"), 1)


#------ Question 2 ------

#Creates a variable for total amount of votes for each bond measure
bonds$Votes_Total <- bonds$Votes_For + bonds$Votes_Against
head(bonds)

#Creates a variable for highest voter turnout
max <- max(bonds$Votes_Total)
#Displays election date, county, and purpose details of the bond measure w/ highest voter turnout
bonds$Election_Date[bonds$Votes_Total == max]
bonds$County[bonds$Votes_Total == max]
bonds$Purpose_Detail[bonds$Votes_Total == max]


#------ Question 3 ------

#Creates a subset from bonds data set that only includes those with bond measures approved & a voter total of at least 10
approvedBonds <- bonds[bonds$Result == "Carried" & bonds$Votes_Total >= 10,]

#Creates a variable that gives percentage of total votes for the bond measures
approvedBonds$percentYes <- (approvedBonds$Votes_For / approvedBonds$Votes_Total) * 100

#Creates a box plot and fivenum summary for the distribution of total votes for the bond measures
boxplot(approvedBonds$percentYes,main='Percentage of Total Votes for Bond Measures',xlab='Percentage (%)', col=c('lightpink1'), horizontal=TRUE, pch=20)
fivenum(approvedBonds$percentYes)


#------ Question 4 ------

#Creates a scatter plot to display relationship between the bond and cost
plot(approvedBonds$percentYes, approvedBonds$Amount,main='Bonds related to Cost',xlab='Percentage (%)',ylab='Cost',pch=20)

#Checks for correlation between bond and its cost
cor(approvedBonds$percentYes, approvedBonds$Amount)



