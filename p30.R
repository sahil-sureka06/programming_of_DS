
# Initialize library borrowing system (books and their borrowers)
library_books <- list(
  "The Hobbit" = c("Alice", "Bob"),
  "1984" = c("Charlie", "Alice"),
  "Moby Dick" = c("Bob")
)

# Function to add a new book with borrowers
add_book <- function(book_name, borrowers) {
  library_books[[book_name]] <<- borrowers
}

# Function to remove a book from the system
remove_book <- function(book_name) {
  library_books[[book_name]] <<- NULL
}

# Function to calculate total number of borrowers for each book
total_borrowers <- function() {
  borrower_counts <- sapply(library_books, length)
  return(borrower_counts)
}

# Function to find the book with highest and lowest borrowers
find_high_low_book <- function() {
  counts <- total_borrowers()
  
  highest_book <- names(which.max(counts))
  lowest_book <- names(which.min(counts))
  
  cat("Book with highest borrowers:", highest_book, "=", counts[highest_book], "\n")
  cat("Book with lowest borrowers:", lowest_book, "=", counts[lowest_book], "\n")
}

# Example usage
add_book("Harry Potter", c("David", "Emma", "Alice"))
remove_book("Moby Dick")

cat("Total borrowers for each book:\n")
print(total_borrowers())

find_high_low_book()