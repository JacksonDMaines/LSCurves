#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x = -30:30
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.02) + .1
x2 = 0:60
plot(x2, z)


test <- deriv(time = x2, meas = z)
test
plot(x2, test)

test <- differences(time = x2, meas = z, showplot = TRUE)
test <- differences(time = x2, meas = log(z), showplot = TRUE)

lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)

plot(x2, log(z))
abline(v = 26.7184)


test <- differences(time = x2, meas = log(z), showplot = TRUE)
plot(x2, z)
abline(v = 26.7184)

# idea use log differences to then find a window size of consetive points that are
# below a cutoff value

#time meas factorsize window_size

# filter to after lag
# log meas
# differences
# create cutoff value
# find window that doesnt satify cutoff value? maybe
#

