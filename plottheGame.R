### Part 1 of Exercise 8
### Create a graph that shows how the points between two teams over a basketball game changes
# Date: October 23, 2020
# Laura Carroll

### 1 - Create a graph that shows how the points between two teams changes throughout a game
# Step 1: Read in the "UWvsMSU_1-22-13.txt" as a data frame
setwd("~/Biocomputing/R_programming/Biocomputing2020_Exercise08/")
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
# This goes through and sums up the score for each time the teams scores
for (i in 1:nrow(UWScore)){
  UWScore$OverallScore[i] = sum(UWScore$score[1:i])
}
for (i in 1:nrow(MSUScore)){
  MSUScore$OverallScore[i] = sum(MSUScore$score[1:i])
}
# Step 2: Need to figure out how plotting works

# Step 3: Need to make sure it's plotting the two lines separate

# Step 4: Make the graph have a key so that people know which colored line matches
#which team?