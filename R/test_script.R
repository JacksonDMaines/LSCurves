#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -20:20
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.02) + .1
x2 = 0:40


plot(x2, z)


test <- deriv(time = x2, meas = z)
test
plot(x2, test)


test <- differences(time = x2, meas = z, showplot = TRUE)
test

lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)

plot(x2, log(z))
abline(v = 17.55913)



test <- c(1,2,3,4,5,6)
meas <- c(1,2,3,4,5,6)
which(test > 4)
meas[(length(meas) - length(which(test > 4))):length(meas)]

