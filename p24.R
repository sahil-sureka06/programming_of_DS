
closing_prices <- c(120, 122, 118, 121, 119, 117, 123, 125, 126, 124, 128, 130, 129, 131, 135, 134, 136, 137, 140, 138, 139, 141, 142, 144, 143, 145, 146, 148, 147, 149)

# 1. Calculate daily returns (percentage change)
daily_returns <- diff(closing_prices) / head(closing_prices, -1) * 100

# 2. Identify the days with the highest and lowest returns
highest_return_day <- which.max(daily_returns) + 1
lowest_return_day <- which.min(daily_returns) + 1

highest_return <- max(daily_returns)
lowest_return <- min(daily_returns)

# 3. Calculate cumulative return over the month
cumulative_return <- ((tail(closing_prices, 1) - closing_prices[1]) / closing_prices[1]) * 100

# Print results
cat("Daily returns (%):", daily_returns, "\n")
cat("Highest return day:", highest_return_day, "Return:", highest_return, "%\n")
cat("Lowest return day:", lowest_return_day, "Return:", lowest_return, "%\n")
cat("Cumulative return over the month:", cumulative_return, "%\n")