# =============================
#  PREDICCIONES SOBRE TEST SET
# =============================

# Asegúrate de que tu variable objetivo se llama "ingreso"
predicciones <- predict(modelo_rf, new_data = test_processed, type = "class")

# Unir predicciones con el test set
resultados <- test_processed %>%
  select(ingreso) %>%
  bind_cols(predicciones)

# Renombrar columna de predicciones si es necesario
colnames(resultados)[2] <- "predicted"

# Convertir a factor
resultados$ingreso   <- as.factor(resultados$ingreso)
resultados$predicted <- as.factor(resultados$predicted)

# =============================
#       MÉTRICAS
# =============================

metricas <- resultados %>%
  metrics(truth = ingreso, estimate = predicted)

metricas_precision_recall_f1 <- resultados %>%
  summarise(
    precision = precision_vec(ingreso, predicted),
    recall    = recall_vec(ingreso, predicted),
    f1        = f_meas_vec(ingreso, predicted)
  )

# Mostrar resultados
metricas
metricas_precision_recall_f1