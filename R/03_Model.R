# ------------------------------
# PARTE 3: MODELO
# ------------------------------

library(randomForest)
library(caret)

# Definir grid de hiperparámetros equivalente al GridSearchCV
tune_grid <- expand.grid(
  mtry = c(3, 5, 7, 10),
  splitrule = c("gini"),   # randomForest no soporta entropy, solo gini
  min.node.size = c(1, 3, 5)
)

# Entrenar modelo con validación cruzada
control <- trainControl(method = "cv", number = 5)

set.seed(2025)
modelo_rf <- train(
  ingreso ~ .,
  data = train_processed,
  method = "ranger",
  trControl = control,
  tuneGrid = tune_grid,
  num.trees = 200
)

# Mejor modelo encontrado
modelo_rf$bestTune

# Predicciones
pred <- predict(modelo_rf, newdata = test_processed)

# Matriz de confusión
confusionMatrix(pred, test_processed$ingreso)

# Guardar modelo y preprocesamiento
saveRDS(modelo_rf, "modelo_rf.rds")
saveRDS(prep_rec, "preprocesamiento.rds")