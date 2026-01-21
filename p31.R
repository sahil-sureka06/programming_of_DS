
# Initialize team performance list (teams and their scores)
team_scores <- list(
  "Team A" = c(90, 85, 88),
  "Team B" = c(78, 82, 79),
  "Team C" = c(88, 92, 90)
)

# Function to add a new team with scores
add_team <- function(team_name, scores) {
  team_scores[[team_name]] <<- scores
}

# Function to remove a team
remove_team <- function(team_name) {
  team_scores[[team_name]] <<- NULL
}

# Function to calculate average score for each team
average_scores <- function() {
  avg <- sapply(team_scores, mean)
  return(avg)
}

# Function to rank teams based on average scores
rank_teams <- function() {
  avg <- average_scores()
  ranked <- sort(avg, decreasing = TRUE)
  return(ranked)
}

# Example usage
add_team("Team D", c(80, 85, 90))
remove_team("Team B")

cat("Average score for each team:\n")
print(average_scores())

cat("\nTeam ranking based on average scores:\n")
print(rank_teams())
