#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -10:10
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.02)
x2 = 0:20


plot(x2, z)


test <- deriv(time = x2, meas = z)
test
plot(x2, test)


test <- differences(time = x2, meas = z, showplot = TRUE)
test

lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)

plot(x2, z)
abline(v = 7.966322)
