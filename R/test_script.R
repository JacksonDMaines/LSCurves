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
area_uCurve(x2, z) #rsums = ("upper", "lower", "avg")

summary(lm(x~z))$coefficient[8]
summary(lm(x~z))$coefficients[2,4]
summary(lm(x~z))$coefficients[2,1]
# OK, now time to start refining function
  # work on NA checks
  # get this weird loglin_growth output fixed...
  # get started on dplyr-able function






#############################################################################

who <- c(1, 2, NA, 3, 4)
when <- c(1, 2, 3, 4, 5)
any(is.na(who))


differences2(who, when)
lagtime(who, when, who)
loglin_growth(who, when, 1)


#################################################################################

x <- -30:30
y <- exp(x) / (1 + exp(x))
z <- y + rnorm(length(y), 0,.01) + .1
#x2 <- 60:120
x2 <- seq(from = 0, to = 7023,length.out = 61)
SynGrowth <- data.frame(time = x2, meas = z)
SynGrowth$diff <- differences2(times = SynGrowth$time, meas = SynGrowth$meas)
SynGrowth$lag <- lagtime(time = SynGrowth$time, meas = SynGrowth$meas, differences = SynGrowth$diff)
SynGrowth$stat <- stattime(time = SynGrowth$time, meas = SynGrowth$meas, lag = SynGrowth$lag)
SynGrowth$rate <- loglin_growth(time = SynGrowth$time, meas = SynGrowth$meas, lag = SynGrowth$lag, stat = SynGrowth$stat)
  # gotta figure out way to output two columns idk maybe
