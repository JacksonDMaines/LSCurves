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
z = y + rnorm(length(y), 0,.02) + .1
x2 = 60:120
test <- differences2(time = x2, meas = z, showplot = TRUE)
lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)
stat <- stattime(time = x2, meas = z, diff = test, lag = lag, threshold = .01, window = 3, showplot = TRUE)

#ok next step before we start refining, fitting exp curves
  # notes: maybe first just fit lm to log points in curve
  # next notes: figure out out how to mange having later and earlier lag times when
  #   fitting exp curves


#fitting lm function
  # log points
  # parse points between lag and stat
  # fit lm
  # output slope
    # Question? can you output two things? like slope and R^2?


function(time, meas, lag, stat) {
  # log meas
  meas_l <- log(meas)

  #parse out exp phase
  indexs <- which(meas_l > lag & meas_l < stat)
  time_e <- time[indexs]
  meas_e <- meas_l[indexs]

  model <- lm(meas_e ~ time_e)



}


