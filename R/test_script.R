#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x <-  -30:30
y <-  exp(x) / (1 + exp(x))
z <-  y + rnorm(length(y), 0,.02) + .1
z
x2 <-  0:60
plot(x2, z)


x = -30:30
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.01) + .1
x2 = 60:120
test <- differences2(time = x2, meas = z, showplot = TRUE)
lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)
stat <- stattime(time = x2, meas = z, diff = test, lag = lag, threshold = .01, window = 3, showplot = TRUE)
lgr <- loglin_growth(time = x2, meas = z, lag = lag, stat = stat)
lgr

# OK, now time to start refining function
  # work on weird time gaps
  # work on NA checks
  # get this weird loglin_growth output fixed...


