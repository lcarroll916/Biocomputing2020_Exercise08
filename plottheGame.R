### Part 1 of Exercise 8
### Create a graph that shows how the points between two teams over a basketball game changes
# Date: October 23, 2020
# Laura Carroll

### 1 - Create a graph that shows how the points between two teams changes throughout a game
# Step 1: Read in the "UWvsMSU_1-22-13.txt" as a data frame
setwd("~/Biocomputing/R_programming/Biocomputing2020_Exercise08/")
# Need to read as delim since it is tab delimited
gameScores <- read.delim("UWvMSU_1-22-13.txt", header = TRUE)

# Step 2: Break the table apart into two data frames that contain when each team
#scored and the new score for the team
# This pulls out the times that each time scored and how many points each basket was
UWScore <- gameScores[gameScores$team == "UW", ]
MSUScore <- gameScores[gameScores$team == "MSU", ]
# This creates a new column in the team data frames to be used for finding the 
#running score for each team
UWVec <- numeric(length = nrow(UWScore))
UWScore$OverallScore <- UWVec
MSUVec <- numeric(length = nrow(MSUScore))
MSUScore$OverallScore <- MSUVec

# Step 3: Fill in the running score
# This goes through and sums up the running score for each time the teams score
for (i in 1:nrow(UWScore)){
  UWScore$OverallScore[i] = sum(UWScore$score[1:i])
}
for (i in 1:nrow(MSUScore)){
  MSUScore$OverallScore[i] = sum(MSUScore$score[1:i])
}

# Step 4: Make the vectors that will be used for the plotting
# timepoints and pointchange correspond with UW data, but I changed their names
#so that the x and y axes would be labeled with a good name
timepoints <- c(0, UWScore$time)
pointchange <- c(0, UWScore$OverallScore)
MSUtimes <- c(0, MSUScore$time)
MSUoverall <- c(0, MSUScore$OverallScore)
# Step 4: Plot these two lines using subsections time and OverallScore for x and y
#respectively
plot(timepoints, pointchange, type = 'l', col = "dark red")
# This next step plots the MSU score on the same graph as UW using the lines
#function in R
# The col input tells R what color to make the line
lines(MSUtimes, MSUoverall, col = "green")