attach(data)
View(data)

summary(data)
str(data)

#combine bathsfull and bathshalf into 1 variable
baths=bathsfull + 0.5*bathshalf

#Create binary indicators
specialsale = ifelse(splsale == 'None',0,1)
roof_tile = ifelse(Roof == "Tile", 1, 0)
privatepool = ifelse(Pool %in% c("Private", "Private, Community"), 1, 0)
communitypool = ifelse(Pool %in% c("Community", "Private, Community"), 1, 0)

#Extracting year from pending data
PendingDate = as.Date(PendingDate, format="%Y-%m-%d")
year = as.numeric(format(PendingDate, "%Y"))

#check for missing values
which (!complete.cases ( data ) )
colSums(is.na (data) )

# Removing columns with excessive missing values
data = data [ , -c (1:3 , 5:7 , 10 , 13:15 , 17 , 20 , 22:24) ]

# Plotting hi st og ra ms for pricesold and adom
hist(pricesold, main="Sale Price Distribution", xlab="Price Sold")
hist(adom_agentdaysonmarket, main="Adom Distribution", xlab="Adom")
hist(log(adom_agentdaysonmarket), main="Adom Distribution", xlab="log(Adom)")

#coorelation plot for variables
library(PerformanceAnalytics)
temp = data[,c(1:10)]
chart.Correlation(temp)

#Correlation plot with IV
library(corrplot)
correlationall=cor(data)
View(correlationall)
corrplot(correlationall)

#Regression models for pricesold
price1 = lm(pricesold ~ year, data=data)
summary(price1)

price2 = lm(pricesold ~ Beds + baths + garages + roof_tile + privatepool + communitypool, data=data)
summary(price2)

price3 = lm(pricesold ~ sqft + year + yrblt, data= data)
summary(price3)

library(stargazer)
stargazer(price1,price2,price3,type="text", single.row = TRUE)

#Regression models for Adom
adom1 = lm(adom_agentdaysonmarket ~ year, data=data)
summary(adom1)

adom2 = lm(adom_agentdaysonmarket ~ listprice+yrblt, data=data)
summary(adom2)

adom3 = lm(adom_agentdaysonmarket ~ listprice+yrblt+splsale+Beds+baths, data= data)
summary(adom3)

stargazer(adom1,adom2,adom3,type="text", single.row = TRUE)

#Assumption tests
plot(price3)
plot(adom3)

#check linearity
price3$residuals
price3$fitted.values
plot(price3$residuals~price3$fitted.values)

adom3$residuals
adom3$fitted.values
plot(adom3$residuals~adom3$fitted.values)

#check for normality of residuals, using Shapiro-Wilk's Test
shapiro.test(price3$residuals)
shapiro.test(adom3$residuals)

#check for Homoscedasticity - Bartlett Test
bartlett.test(list(price3$res,price3$fit))
bartlett.test(list(adom3$res,adom3$fit))

#check for Multicollinearity - VIF test
library (car)
vif ( price3 )
vif ( adom3 )

#check for Independence- Durbin-Watson test
library ( lmtest )
dwtest ( price3 )
dwtest ( adom3 )

summary(price3)
summary(adom3)



