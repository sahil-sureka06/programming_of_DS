
# Initialize customer purchase list
customer_purchases <- list(
  Alice = c(200, 150, 300),
  Bob = c(100, 80, 150),
  Charlie = c(250, 300, 100)
)

# Function to add a new customer and their purchases
add_customer <- function(customer_name, purchases) {
  customer_purchases[[customer_name]] <<- purchases
}

# Function to remove a customer
remove_customer <- function(customer_name) {
  customer_purchases[[customer_name]] <<- NULL
}

# Function to calculate total purchases for each customer
total_purchases <- function() {
  totals <- sapply(customer_purchases, sum)
  return(totals)
}

# Function to find customer with highest and lowest total purchases
find_high_low_customer <- function() {
  totals <- total_purchases()
  highest_customer <- names(which.max(totals))
  lowest_customer <- names(which.min(totals))
  
  cat("Customer with highest total purchase:", highest_customer, "=", totals[highest_customer], "\n")
  cat("Customer with lowest total purchase:", lowest_customer, "=", totals[lowest_customer], "\n")
}

# Example usage
add_customer("David", c(120, 180, 200))
remove_customer("Bob")

cat("Total purchases for each customer:\n")
print(total_purchases())

find_high_low_customer()