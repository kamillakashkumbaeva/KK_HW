library(caret)# Fitting Naive Bayes Model

# to training datasetclassifier_auth <- naiveBayes(gnd ~ ., data = train)
classifier_auth
# Predicting on test data'
y_pred <- predict(classifier_auth, newdata = test)
# Confusion Matrixcm <- table(test$gnd, y_pred)
cm
library(MASS)##LDA
author.lda<-lda(gnd~.,data=train)print(author.lda$scaling)
summary(author.lda)author.ldapredicttrain<-predict(author.lda,train)
tldatrain<-table(train$gnd,author.ldapredicttrain$class)error(tldatrain)
f1(tldatrain)author.ldapredicttest<-predict(author.lda,test)
summary(author.ldapredicttest)tldatest<-table(test$gnd,author.ldapredicttest$class)
error(tldatest)print(paste0(c("text: ", 55)))
x1 <- "string1"x2 <- "sring2"
paste0(x1, x2)
f1(tldatest)plot(author.lda,col=author.train$colour)
plot(author.lda,dimen=1,type="both")plot(author.lda,dimen=1,type="density")

require(nnet)##Logistic Regression
lr<-multinom(gnd~.,data=train)help(multinom)
lr.train<-predict(lr,train,type = "class")error(table(train$gnd,lr.train))
lr.test<-predict(lr,test,type = "class")
error(table(test$gnd,lr.test))##SVM
# author.numtr$colour = NA# author.numtr$colour[author.numtr$Author == "Austen"] = 0
# author.numtr$colour[author.numtr$Author == "London"] = 1# author.numtr$colour[author.numtr$Author == "Milton"] = 2
# author.numtr$colour[author.numtr$Author == "Shakespeare"] = 3# author.numtr <- author.numtr[,-15]
train$gnd <- as.factor(train$gnd)author.svm<-svm(gnd~.,data=train,
                                                 kernel="sigmoid")help("svm")
summary(author.svm)
author.pred<-predict(author.svm,                     train,decision.values=T)
ttrain<-table(train$gnd,author.pred)error(ttrain)

author.predtestsvm<-predict(author.svm,test,decision.values=T)
ttest<-table(test$gnd,author.predtestsvm)error(ttest)
plot(author.svm, data=train[,c(1:4)])
