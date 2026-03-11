#############################################################################
#Methods to Use SQL in R: sqldf Package
#########################################################################
install.packages("sqldf")
library(sqldf)

# Example data frame
employees <- data.frame(
  EmployeeID = c(1, 2, 3),
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(28, 35, 40),
  Salary = c(50000, 60000, 70000)
)

print(employees)

# SQL query using sqldf
result <- sqldf("SELECT Name, Salary FROM employees WHERE Age > 30")
print(result)

############################################################################


#############################################################################
#Methods to Use SQL in R: DBI and RSQLite Packages
############################################################################
install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)

# Create an in-memory SQLite database and connect to it
con <- dbConnect(RSQLite::SQLite(), ":memory:")

# Write data to a table
dbWriteTable(con, "employees", employees)

# Query the database
result <- dbGetQuery(con, "SELECT Name, Salary FROM employees WHERE Age > 30")
print(result)

# Disconnect from the database
dbDisconnect(con)
#############################################################################


#############################################################################
#Methods to Use SQL in R: dplyr Package
############################################################################
install.packages("dplyr")
library(dplyr)

# Using dplyr to filter and select data
result <- employees %>%
  filter(Age > 30) %>%
  select(Name, Salary)

print(result)

