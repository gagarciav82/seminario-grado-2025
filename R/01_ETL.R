# PARTE 1: LIMPIEZA DE LOS DATOS
# ------------------------------

library(tidyverse)

# 1. Cargar dataset (SIN encabezados)
adult <- read.csv(
  "data/adult.csv",
  header = TRUE,
  sep = ";",
  strip.white = TRUE,
  na.strings = c("?", " ?")
)

# 3. Eliminar duplicados
adult <- adult %>% distinct()

# 4. Limpieza de espacios
adult <- adult %>% mutate(across(where(is.character), trimws))

# 5. Arreglo de la variable objetivo income
adult$ingreso <- adult$ingreso %>%
  recode(
    "<=50K" = 0,
    ">50K" = 1,
    "<=50K." = 0,
    ">50K." = 1
  ) %>%
  as.numeric()

# 6. Reporte de NA
print(colSums(is.na(adult)))

# Resultado final
clean_adult <- adult
clean_adult