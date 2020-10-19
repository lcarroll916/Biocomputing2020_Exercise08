# Guess the Number
# This is a game where the user has to guess what number the computer is thinking
# which is between 1 and 100.
# October 23, 2020
# Laura Carroll

### 2 - Make "guess my number" which limits the guesses to just 10.
## Generate the random number
numguess <- floor(runif(1, min = 1, max = 100))
# Receive input from the user
userguess <- 0
# This gives the user a prompt and stores the user's input as a variable
userguess <- readline(prompt = "I'm thinking of a number between 1 and 100. Guess: ")
# Feedback for the User on whether their number guess is correct
# Create a for loop that tests userguess
for (i in 1:10){
  if (userguess == numguess){
    print("Congratulations! You got it!")
  } else if (userguess > numguess){
    print("Lower")
    userguess <- readline(prompt = "Guess: ")
  } else if (userguess < numguess){
    print("Higher")
    userguess <- readline(prompt = "Guess: ")
  } else{
    print("Sorry, you ran out of tries! The number was ", numguess)
  }
}
