# Step 1: Install ggplot2 (run only once)
install.packages("ggplot2")

# Step 2: Load library
library(ggplot2)

# Step 3: Load dataset
data("midwest", package = "ggplot2")

# View dataset
View(midwest)

# 1. Scatter Plot
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "Scatter Plot: Education vs Adult Poverty",
       x = "Percent College Educated",
       y = "Percent Adult Poverty")

# 2. Bar Chart (Population by State)
ggplot(data = midwest) + 
  geom_col(mapping = aes(x = state, y = poptotal), fill = "blue") +
  labs(title = "Population by State",
       x = "State",
       y = "Total Population")

# 3. Hexagonal Heatmap
ggplot(data = midwest) + 
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty)) +
  labs(title = "Hexbin Plot: Education vs Poverty",
       x = "Percent College Educated",
       y = "Percent Adult Poverty")

# 4. Scatter Plot with Smooth Line
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty)) + 
  geom_smooth(mapping = aes(x = percollege, y = percadultpoverty), method = "lm", se = FALSE) +
  labs(title = "Scatter Plot with Trend Line",
       x = "Percent College Educated",
       y = "Percent Adult Poverty")

# 5. Shared Aesthetic Mapping
ggplot(data = midwest, aes(x = percollege, y = percadultpoverty)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  geom_point(aes(y = percchildbelowpovert), color = "purple") +
  labs(title = "Shared Aesthetic Mapping")

# 6. Color Mapping by State
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty, color = state)) +
  labs(title = "Scatter Plot with State Colors")

# 7. Constant Color and Transparency
ggplot(data = midwest) + 
  geom_point(aes(x = percollege, y = percadultpoverty), 
             color = "red", alpha = 0.3) +
  labs(title = "Scatter Plot with Transparency",
       x = "Percent College Educated",
       y = "Percent Adult Poverty")
