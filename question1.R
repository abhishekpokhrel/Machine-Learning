df<- read.csv(file = "C:/question1.csv",header = TRUE,sep = ",")

install.packages("caret")
library(caret)

boxplot(df$x)$out
boxplot(df$x, plot=FALSE)$out
outliers <- boxplot(df$x, plot=FALSE)$out
df[which(df$x %in% outliers),]
df <- df[-which(df$x %in% outliers),]
boxplot(df$x)


boxplot(df$y)$out
boxplot(df$y, plot=FALSE)$out
outliers <- boxplot(df$y, plot=FALSE)$out
df[which(df$y %in% outliers),]
df <- df[-which(df$y %in% outliers),]
boxplot(df$y)


?preProcess
prep_first <- preProcess(df, method = c("BoxCox"), thresh = 1)
predict(prep_first,df)

df_new <- predict(prep_first,df)
df_new$z <- df_new$x + df_new$y
df_new

