## Author
**Gustavo Adolfo García Vélez** \
Environmental Engineer | Statistician | Specialist in Applied Statistics | Specialist in Geomatics | \
Master in Applied Statistics - Universidad Santo Tomás

# Random Forest Classification with the Adult Dataset

## 📘 Overview

This project builds a **Random Forest classification model** using the well-known [Adult Income dataset](https://archive.ics.uci.edu/ml/datasets/adult) (also known as the **"Census Income"** dataset).  
The goal is to predict whether an individual's income exceeds **$50K per year**, based on demographic and employment attributes.

---

## 🎯 Objective

The main objective is to apply **Random Forest**, a robust ensemble learning algorithm, to classify individuals into two categories:

- **Income ≤ 50K**
- **Income > 50K**

This task demonstrates supervised machine learning for **classification problems** using mixed data types (numerical and categorical variables).

---

## 🧾 Dataset Description

The Adult dataset contains demographic and employment-related features extracted from the 1994 U.S. Census database.  
Each row represents an individual, and the target variable indicates whether the individual's income exceeds $50,000 per year.

| Variable Name     | Role      | Type         | Description | Possible Values / Units | Missing Values |
|-------------------|------------|---------------|--------------|--------------------------|----------------|
| **age**           | Feature    | Integer       | Age of individual | Years | No |
| **workclass**     | Feature    | Categorical   | Type of employer | Private, Self-emp-not-inc, Self-emp-inc, Federal-gov, Local-gov, State-gov, Without-pay, Never-worked | Yes |
| **fnlwgt**        | Feature    | Integer       | Final weight assigned by Census Bureau | N/A | No |
| **education**     | Feature    | Categorical   | Highest education level achieved | Bachelors, Some-college, 11th, HS-grad, Prof-school, Assoc-acdm, etc. | No |
| **education-num** | Feature    | Integer       | Numeric representation of education level | N/A | No |
| **marital-status**| Feature    | Categorical   | Marital status | Married-civ-spouse, Divorced, Never-married, etc. | No |
| **occupation**    | Feature    | Categorical   | Type of occupation | Tech-support, Sales, Adm-clerical, etc. | Yes |
| **relationship**  | Feature    | Categorical   | Relationship status in household | Wife, Husband, Own-child, Not-in-family, etc. | No |
| **race**          | Feature    | Categorical   | Race | White, Black, Asian-Pac-Islander, Amer-Indian-Eskimo, Other | No |
| **sex**           | Feature    | Binary        | Gender | Female, Male | No |
| **income**        | Target     | Binary        | Income class | `<=50K`, `>50K` | No |

---

## 🧹 Data Preparation

1. **Handle missing values**  
   - Replace missing values in categorical variables (e.g., `workclass`, `occupation`) with `"Unknown"` or the mode.

2. **Encode categorical variables**  
   - Convert categorical features into factors using `as.factor()` in R.

3. **Split dataset**  
   - Divide data into **training (70%)** and **testing (30%)** sets.

4. **Feature selection**  
   - Use relevant demographic and socioeconomic features to predict income.

---

## 🌲 Model: Random Forest

### Algorithm
Random Forest is an **ensemble learning method** that constructs multiple decision trees during training and outputs the mode of the classes (classification) of the individual trees.

### Key Benefits
- Handles both numerical and categorical data.  
- Resistant to overfitting.  
- Provides feature importance.

### Implementation in R

```r
# Load libraries
library(randomForest)
library(caret)

# Load dataset
data <- read.csv("adult.csv", na.strings = " ?")

# Data cleaning
data$workclass[is.na(data$workclass)] <- "Unknown"
data$occupation[is.na(data$occupation)] <- "Unknown"

# Convert to factors
categorical_vars <- c("workclass", "education", "marital.status", "occupation",
                      "relationship", "race", "sex", "income")
data[categorical_vars] <- lapply(data[categorical_vars], as.factor)

# Split into train and test sets
set.seed(123)
trainIndex <- createDataPartition(data$income, p = 0.7, list = FALSE)
train <- data[trainIndex, ]
test  <- data[-trainIndex, ]

# Train Random Forest model
rf_model <- randomForest(income ~ ., data = train, ntree = 500, mtry = 4, importance = TRUE)

# Evaluate performance
predictions <- predict(rf_model, test)
confusionMatrix(predictions, test$income)
