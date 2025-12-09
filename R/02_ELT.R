# ------------------------------
# PARTE 2: PREPROCESAMIENTO
# ------------------------------

library(recipes)
library(caret)
#install.packages("tidymodels")
library(tidymodels)

# Separar X e y
adult_data <- clean_adult %>% select(-fnlwgt)  # eliminar fnlwgt como en tu código
adult_data$ingreso <- factor(adult_data$ingreso)

# Split en train y test
set.seed(2025)
train_index <- createDataPartition(adult_data$ingreso, p = 0.8, list = FALSE)
train_data <- adult_data[train_index, ]
test_data  <- adult_data[-train_index, ]

# Crear receta de preprocesamiento
rec <- recipe(ingreso ~ ., data = train_data) %>%
  step_unknown(all_nominal_predictors(), new_level = "Unknown") %>%  # imputación
  step_dummy(all_nominal_predictors(), one_hot = TRUE) %>%           # OneHotEncoding
  step_center(all_numeric_predictors()) %>%                          # centrado
  step_scale(all_numeric_predictors())

# Preparar receta con datos de entrenamiento
prep_rec <- prep(rec)
train_processed <- bake(prep_rec, new_data = train_data)
test_processed  <- bake(prep_rec, new_data = test_data)