
# Example sensor readings (60 values each for 60 minutes)
temperature <- c(28, 29, 30, 31, 32, 33, 29, 28, 27, 30, 31, 34, 35, 33, 32, 30, 29, 28, 31, 32, 33, 34, 30, 29, 28, 27, 26, 30, 31, 32, 33, 34, 35, 36, 34, 33, 32, 31, 30, 29, 28, 27, 31, 32, 33, 34, 35, 30, 29, 28, 27, 26, 31, 32, 33, 34, 35, 36, 37, 38)

humidity <- c(45, 44, 43, 42, 41, 39, 38, 37, 36, 40, 39, 38, 37, 35, 34, 42, 43, 44, 39, 38, 37, 36, 35, 41, 42, 43, 44, 39, 38, 37, 36, 35, 34, 33, 32, 40, 41, 42, 43, 44, 45, 46, 39, 38, 37, 36, 35, 34, 33, 32, 41, 42, 39, 38, 37, 36, 35, 34, 33, 32)

pressure <- c(1012, 1013, 1011, 1010, 1012, 1014, 1015, 1013, 1012, 1011, 1010, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013, 1012, 1011, 1010, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013, 1012, 1011, 1010, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013, 1012, 1011, 1010, 1012, 1013, 1014, 1015, 1016, 1015, 1014, 1013, 1012, 1011, 1010, 1012, 1013, 1014, 1015, 1016)

time_minutes <- 1:60

# 1. Average reading for each sensor
avg_temp <- mean(temperature)
avg_humidity <- mean(humidity)
avg_pressure <- mean(pressure)

# 2. Identify intervals where temperature > 30 and humidity < 40
condition <- (temperature > 30) & (humidity < 40)
intervals <- which(condition)

# Print results
cat("Average Temperature:", avg_temp, "°C\n")
cat("Average Humidity:", avg_humidity, "%\n")
cat("Average Pressure:", avg_pressure, "hPa\n")
cat("Time intervals where Temp > 30°C and Humidity < 40% (in minutes):", intervals, "\n")

# 3. Plot sensor readings over time
plot(time_minutes, temperature, type = "l", xlab = "Time (minutes)", ylab = "Temperature (°C)", main = "Sensor Readings Over Time")
lines(time_minutes, humidity)
lines(time_minutes, pressure)