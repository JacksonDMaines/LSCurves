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
# Some differences function
differences <- function(times, meas, showplot = FALSE){

  ans <- rep(NA, length(meas))
  ans[1] <- 0
  for (i in 1:(length(meas)-1)){
    slope <- meas[i+1] - meas[i]
    ans[i+1] <- slope

  }
  if(showplot == TRUE){
    plot(times, ans, type = "l")
  }
  return(ans)
}

# Third Idea:
  # Fit lm between points and find rate of change by subtracting last slope
  # by new slope?
deriv2 <- function(time, meas, window = 3){

  #First log meas

  #Then window n points
  #Fit lm model and get slope?
  #fit next model and differnce slope?
}





# Create function to find lag time
lagtime <- function(time, meas, differences, showplot = FALSE){
  # first find max point in differences
  maxgrowth <- which.max(differences)

  # need slope
  slope1 <- ((meas[maxgrowth + 1] - meas[maxgrowth]) / (time[maxgrowth + 1] - time[maxgrowth]))
  slope2 <- ((meas[maxgrowth] - meas[maxgrowth - 1]) / (time[maxgrowth] - time[maxgrowth - 1]))
  slope <- (slope1 + slope2) / 2
  #fit tangent line to the point
  y <- slope * (time - time[maxgrowth]) - meas[maxgrowth]
    # y−y1=m(x−x1)
  #find where it intersects with min meas value
  min_meas <- min(meas)
  lag <- ((min_meas - meas[maxgrowth]) / slope) + time[maxgrowth]

  if(showplot == TRUE){
    plot(time, meas)
    lines(time, y)
    abline(h = min_meas)
    abline(v = lag)
  }
  #return lagtime
  return(lag)
}

# Create function to find stationary time
  #Sliding window with threshold and window parameters


# fit exp to points inbetween lag and stat time
