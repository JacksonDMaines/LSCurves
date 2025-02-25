#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -10:10
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 100,100)
x2 = 0:20


z_1 <- c(1.52241035575357, 6.69405158107127, 11.36748041913, 16.5150704688625,
         25.197684468949, 37.2729510427523, 49.7489827854298, 63.7812415138795,
         81.4451517013702, 100.043167260407)

plot(x2, y)



test <- deriv(x = x2, y = y)
test


# first we need to log y
log_y <- log(y)

derivatives <- c()
#now you need to start window lm
for (i in 1:(length(log_y)-1)){
  slope <- (log_y[i+1] - log_y[i]) / (x[i+1]- y[i])
  print(slope)
}
