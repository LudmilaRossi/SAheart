#sbp - systolic blood pressure
#tobacco - cumulative tobacco (kg)
#ldl - low densiity lipoprotein cholesterol
#adiposity
#famhist - family history of heart disease (Present, Absent)
#typea - type-A behavior
#obesity
#alcohol - current alcohol consumption
#age - age at onset
#chd - response, coronary heart disease

library(caret)
library(rpart.plot)
install.packages("e1071")
SAheart <-  read.csv("SAHeart.csv")

#MODELO ARBOL DE DECISION
# pasamos la var respuesta a factor
SAheart$chd <- as.factor(SAheart$chd)

#Subset the data to a training set and testing set based on the chd variable in the data set
#p: the percentage that goes to training
#nTrain <- createDataPartition(y = segmentationOriginal$Case, list = FALSE)

regtrain <- createDataPartition(y=SAheart$obesity, p=0.7,list=FALSE) #va cambiando el entrenamiento p=1
itrain <- SAheart[regtrain,]
test <- SAheart[-regtrain,]
mod_arbol <-train(chd ~ ., method="rpart", data=itrain)
print(mod_arbol$finalModel)
rpart.plot(mod_arbol$finalModel)
