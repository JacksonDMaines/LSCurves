#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x <-  -30:30
y <-  exp(x) / (1 + exp(x))
z <-  y + rnorm(length(y), 0,.02) + .1
z
x2 <-  0:60
plot(x2, z)


x <- -30:30
y <- exp(x) / (1 + exp(x))
z <- y + rnorm(length(y), 0,.01) + .1
#x2 <- 60:120
x2 <- seq(from = 0, to = 7023,length.out = 61)
test <- differences2(time = x2, meas = z, showplot = TRUE)
lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)
stat <- stattime(time = x2, meas = z, diff = test, lag = lag, threshold = .01, window = 3, showplot = TRUE)
lgr <- loglin_growth(time = x2, meas = z, lag = lag, stat = stat)
lgr
area_uCurve(x2, z, rsums = "avg") #rsums = ("upper", "lower", "avg")

summary(lm(x~z))$coefficient[8]
summary(lm(x~z))$coefficients[2,4]
summary(lm(x~z))$coefficients[2,1]
# OK, now time to start refining function
  # work on weird time gaps
    # yeah so checked ive noticed that weird time gaps, get messed up with
    # stat, so lets look into that. I think I got it
  # AUC to help find curves that dont grow
    # look into Riemann sums for this, upper and lower done
  # work on NA checks
  # get this weird loglin_growth output fixed...






#############################################################################
