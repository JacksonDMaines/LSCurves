#git push --mirror https://github.com/JacksonDMaines/LSCurves

# Create function to find derivs? or changes
# I think ill follow what gcplyr does.

# The idea: fit a lm between a window of points and average?
#   Will this work well? idk


deriv <- function(times, meas, window = 1, blank = 0){

  # first we need to log y
  log_y <- log(meas)

  ans <- rep(NA, length(meas))
  for (i in 1:(length(log_y)-1)){
    slope <- ((log_y[i+1] - log_y[i]) / ((times[i+1] - length(times)/2) - meas[i]))
    ans[i] <- slope
  }
  return(ans)
}


# Create function to find lag time

# Create function to find stationary time

