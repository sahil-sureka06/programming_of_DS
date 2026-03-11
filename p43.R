# Step 1: Install and load jsonlite
install.packages("jsonlite")   # run once
library(jsonlite)

# Step 2: Set working directory to your JSON file location
setwd("D:/DOWNLOAD/inventory.json")

# Check files in the folder
list.files()

# Step 3: Read inventory.json
inventory <- fromJSON("inventory.json")

print("Original Inventory Data:")
print(inventory)

# Step 4: Create a new product
new_product <- data.frame(
  product_id = 104,
  name = "Wireless Mouse",
  category = "Electronics",
  price = 25.99,
  stock = 50
)

# Step 5: Add new product to inventory
inventory_updated <- rbind(inventory, new_product)

print("Inventory After Adding New Product:")
print(inventory_updated)

# Step 6: Write updated inventory to JSON file
write_json(inventory_updated, "updated_inventory.json", pretty = TRUE)

# Step 7: Verify updated JSON file
updated_inventory <- fromJSON("updated_inventory.json")

print("Verified Updated Inventory:")
print(updated_inventory)

