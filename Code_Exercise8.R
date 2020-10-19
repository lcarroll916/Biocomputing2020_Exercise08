# This is the script for Exercise 8
# October 23, 2020
# Laura Carroll

### 1 - Make a graph that shows how the two teams scored throughout a basketball game

### 2 - Make "guess my number" which limits the guesses to just 10.
## Generate the random number
numguess <- runif(1, min = 1, max = 100)

## Receive input from the user
# This prints out the beginning statement to let the user know what is happening
print("I'm thinking of a number between 1 and 100...")
# This gives the user a prompt and stores the user's input as a variable
userguess <- readline(prompt = "Guess: ")