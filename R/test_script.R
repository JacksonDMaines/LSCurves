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

x <-  1:6
y <-  x + rnorm(6, 0, .1)
abs((x[2]-x[1])*(y[3]-y[1]) - (y[2]-y[1])*(x[3]-x[1]))
abs((x[3]-x[2])*(y[4]-y[2]) - (y[3]-y[2])*(x[4]-x[2]))
abs((x[4]-x[3])*(y[5]-y[3]) - (y[4]-y[3])*(x[5]-x[3]))
abs((x[5]-x[4])*(y[6]-y[4]) - (y[5]-y[4])*(x[6]-x[4]))
plot(x,y)

(y[2] - y[1]) / (x[2]- x[1])
(y[3] - y[2]) / (x[3]- x[2])


# how can i do this?
  # I has thinking slope, but I need a baseline slope to check against
  # I Was thingking this (y[2] - y[1]) / (x[2]- x[1]), but idk how to do this
    # for more points, still dont know about a baseline maybe just the first
    # points?

# Could residual from tangent line and find first point where residual is greater
  # than threshold?  No but it needs to be in log format




