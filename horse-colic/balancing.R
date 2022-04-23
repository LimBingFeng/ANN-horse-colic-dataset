library(ROSE)

imbalance = imbalanced

dim(imbalance)       # 9234 * 56 
summary(imbalance)  
balanced <- ovun.sample(outcome~., data=imbalance, method = "over", p=0.5,seed=1)$data

table(imbalance$outcome)
table(balanced$outcome)

#write.csv(balanced,"balanced.csv")
