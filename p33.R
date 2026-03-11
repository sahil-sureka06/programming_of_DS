# -----------------------------
# Task 1: Create Column Vectors
# -----------------------------

PatientID <- c("HOS1001","HOS1002","HOS1003","HOS1004","HOS1005",
               "HOS1006","HOS1007","HOS1008","HOS1009","HOS1010")

Name <- c("Arjun Menon","Bhavana Iyer","Chirag Gupta","Devika Nair",
          "Eshwar Rao","Farida Sheikh","Gaurav Kumar","Harini Krishnan",
          "Ishita S","Jatin Verma")

Department <- c("Cardiology","Neurology","Endocrinology","Pulmonology",
                "Cardiology","Endocrinology","Neurology","Pulmonology",
                "Cardiology","Endocrinology")

Diagnosis <- c("Hypertension","Migraine","Type-2 Diabetes","Asthma",
               "Hypertension","Thyroid Disorder","Epilepsy","COPD",
               "Arrhythmia","Type-1 Diabetes")

Test1 <- c(82,71,90,64,95,60,78,68,87,83)
Test2 <- c(76,69,92,70,94,63,82,72,85,79)
Test3 <- c(88,73,86,67,93,61,79,70,90,77)
Test4 <- c(84,75,91,72,96,66,81,69,88,85)
Test5 <- c(88,73,86,67,93,61,79,70,90,77)

# -----------------------------
# Task 2: Build Data Frame
# -----------------------------

patients <- data.frame(
  PatientID, Name, Department, Diagnosis,
  Test1, Test2, Test3, Test4, Test5,
  stringsAsFactors = FALSE
)

cat("Structure of Dataset:\n")
str(patients)

cat("\nFirst Few Rows:\n")
head(patients)

# -----------------------------
# Task 3: Patient-Level Metrics
# -----------------------------

# Sum of diagnostic tests
patients$Sum <- rowSums(patients[,c("Test1","Test2","Test3","Test4")])

# Average score
patients$Average <- round(patients$Sum / 4, 2)

# Rank (Highest sum gets Rank 1)
patients$Rank <- rank(-patients$Sum, ties.method = "min")

cat("\nPatient Level Analysis:\n")
print(patients)

cat("\nSorted by Rank:\n")
print(patients[order(patients$Rank), ])

# -----------------------------
# Task 4: Test-wise Averages
# -----------------------------

test_cols <- c("Test1","Test2","Test3","Test4")

test_wise_avg <- colMeans(patients[,test_cols], na.rm = TRUE)

cat("\nTest Wise Average Scores:\n")
print(round(test_wise_avg,2))

# -----------------------------
# Task 5: Department-wise Averages
# -----------------------------

dept_test_avg <- aggregate(
  patients[,test_cols],
  by = list(Department = patients$Department),
  FUN = function(x) mean(x, na.rm = TRUE)
)

# Round numeric columns
dept_test_avg[,test_cols] <- round(dept_test_avg[,test_cols],2)

# Overall department average
dept_test_avg$Overall_Average <- round(
  rowMeans(dept_test_avg[,test_cols], na.rm = TRUE),2
)
cat("\nDepartment Wise Diagnostic Performance:\n")
print(dept_test_avg)

# -----------------------------
# Department Ranking
# -----------------------------

dept_test_avg_sorted <- dept_test_avg[order(-dept_test_avg$Overall_Average), ]

cat("\nDepartment Ranking:\n")
print(dept_test_avg_sorted)

