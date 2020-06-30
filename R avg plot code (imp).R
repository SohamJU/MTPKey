concat=read.csv(file.choose())
library(ggplot2)
library(dplyr)
concat.summary=concat %>% group_by(fpr) %>% summarise(ymin=min(tpr),ymax=max(tpr),ymean=mean(tpr),sd=sd(tpr))
am=ggplot(concat.summary,aes(x=fpr,y=ymean))+geom_path(size=3)+geom_errorbar(aes(ymin=ymin,ymax=ymax)) + geom_path() + labs(x='False Postive Rate',y='True Positive Rate', title='Average ROC curve for Gradient Tree Boosting')
am
