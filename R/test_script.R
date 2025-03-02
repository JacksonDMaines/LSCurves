#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -10:10
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,1)
x2 = 0:20


plot(x2, y)



test <- deriv(time = x2, meas = y)
test
plot(x2, test)

