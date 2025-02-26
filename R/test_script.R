#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -10:10
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,100)
x2 = 0:20


plot(x2, y)



test <- deriv(time = x2, meas = y)
test
plot(x2, test)

# first we need to log y
log_y <- log(y)

derivatives <- c()
#now you need to start window lm
for (i in 1:(length(log_y)-1)){
  slope <- (log_y[i+1] - log_y[i]) / (x[i+1]- y[i])
  print(slope)
}

