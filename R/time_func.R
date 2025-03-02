#git push --mirror https://github.com/JacksonDMaines/LSCurves

# Create function to find derivs? or changes

# First Idea:
  # Some weird slope function
deriv <- function(times, meas){

  # first we need to log y
  log_y <- log(meas)

  ans <- rep(NA, length(meas))
  ans[1] <- 0
  for (i in 1:(length(log_y)-1)){
    slope <- abs(((log_y[i+1] - log_y[i]) / ((times[i+1] - length(times)/2) - meas[i])))
    ans[i+1] <- slope
  }
  return(ans)
}

# Second Idea:
  # Fit lm between points and find rate of change by subtracting last slope
  # by new slope?
deriv2 <- function(time, meas, window = 3){

  #First log meas

  #Then window n points
  #Fit lm model and get slope?
  #fit next model and differnce slope?
}

# Create function to find lag time
  #Fit tangent line to max slope and find intersection to min y value

# Create function to find stationary time
  #Sliding window with threshold and window parameters

