install.packages("neuralnet")
library(neuralnet)
concrete <- read.csv("concrete.csv")
normalize <- function(x) {return((x - min(x)) / (max(x) - min(x)))}
concrete_norm <- as.data.frame(lapply(concrete,normalize))
concrete_train <- concrete_norm[1:773, ]
concrete_test <- concrete_norm[774:1030, ]
concrete_model <- neuralnet(strength ~ cement + slag+ ash + water + superplastic + coarseagg + fineagg + age,data = concrete_train)
plot(concrete_model)
model_results <- compute(concrete_model, concrete_test)    
predicted_strength <- model_results$net.result
predicted_neuron <- model_results$neurons
concrete_model2 <- neuralnet(strength ~ cement + slag +ash + water + superplastic +coarseagg + fineagg + age,data = concrete_train, hidden = 5)
plot(concrete_model2)
model_results2 <- compute(concrete_model2, concrete_test)
predicted_strength2 <- model_results2$net.result
cor(predicted_strength2, concrete_test$strength)
