#Step1: Install and Load the necessary packages
install.packages("dplyr")
library(dplyr)

#Step2: Create the Customers Dataset
customers <- data.frame(
  CustomerName = c("John Doe","Jane Smith","Robert Brown","Emily Davis","Michael Green"),
  Email = c("john.doe@example.com",
            "jane.smith@example.com",
            "robert.brown@example.com",
            "emily.davis@example.com",
            "michael.green@example.com")
)

View(customers)

#Step3: Create the Purchases Dataset
purchases <- data.frame(
  CustomerName = c("John Doe","Jane Smith","Robert Brown","Sarah Johnson","Emily Davis"),
  PurchaseAmount = c(150,200,120,180,220),
  Date = c("01-01-2023","02-01-2023","03-01-2023","04-01-2023","05-01-2023")
)

View(purchases)

#Step4: Perform Left Join
left_join_data <- left_join(customers, purchases, by = "CustomerName")
View(left_join_data)

#Step5: Perform Right Join
right_join_data <- right_join(customers, purchases, by = "CustomerName")
View(right_join_data)

#Step6: Perform Inner Join
inner_join_data <- inner_join(customers, purchases, by = "CustomerName")
View(inner_join_data)

#Step7: Perform Full Join
full_join_data <- full_join(customers, purchases, by = "CustomerName")
View(full_join_data)

