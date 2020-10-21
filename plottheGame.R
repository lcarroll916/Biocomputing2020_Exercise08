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

# Step 3: Fill in the running score
# This creates the empty vectors for the running score to be added to
UWoverall <- numeric(length = nrow(UWScore))
MSUoverall <- numeric(length = nrow(MSUScore))
# This goes through and sums up the running score for each time the teams score
for (i in 1:nrow(UWScore)){
  UWoverall[i] = sum(UWScore$score[1:i])
}
for (i in 1:nrow(MSUScore)){
  MSUoverall[i] = sum(MSUScore$score[1:i])
}

# Step 4: Make the vectors that will be used for the plotting
# This pulls out the column that says when each team scored and puts it into a 
#vector that can be used for plotting
UWtimes <- c(0, UWScore$time)
MSUtimes <- c(0, MSUScore$time)
# Step 5: Plot these two lines using the times vector and overall score vectors
plot(UWtimes, UWoverall, type = 'l', col = "dark red", main = "UW vs MSU Scores (Jan 22, 2013)", xlab = "Time (min)", ylab = "Total Points")
# This next step plots the MSU score on the same graph as UW using the lines
#function in R
# The col input tells R what color to make the line
lines(MSUtimes, MSUoverall, col = "green")