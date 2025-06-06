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


differences2 <- function(times, meas, showplot = FALSE){


  if (any(is.na(times) == TRUE | any(is.na(meas)) == TRUE)) {
    stop("NAs in time or meas \n Clean the data")
  }


  ans <- rep(NA, length(meas))
  ans[1] <- 0
  log_meas <- log(meas)
  for (i in 1:(length(log_meas)-1)){
    slope <- log_meas[i+1] - log_meas[i]
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

  if (any(is.na(time) == TRUE | any(is.na(meas)) == TRUE)) {
    stop("NAs in time or meas \n Clean the data")
  }

  # first find max point in differences
  maxgrowth <- which.max(differences)

  # need slope
  slope1 <- ((meas[maxgrowth + 1] - meas[maxgrowth]) / (time[maxgrowth + 1] - time[maxgrowth]))
  slope2 <- ((meas[maxgrowth] - meas[maxgrowth - 1]) / (time[maxgrowth] - time[maxgrowth - 1]))
  slope <- (slope1 + slope2) / 2
  #fit tangent line to the point
  y <- slope * (time - time[maxgrowth]) + meas[maxgrowth]
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


# Ok this works, but od data is really small like ~ .1 and times arent always just
# 1, 2, 3,4... it might be 0, 20, 40min gaps
# first one, probably just add 1 to all data so it doesnt error out?
  # also I need better synthetic data, this shits trash.
stattime <- function(time, meas, diff, lag, threshold = .01, window =3, showplot = FALSE){

  if (any(is.na(time) == TRUE | any(is.na(meas)) == TRUE)) {
    stop("NAs in time or meas \n Clean the data")
  }

  # first lag index
  time1 <- which(time > lag)[1]

  # filter to points right of lagtime
  time_l <-  time[which(time > lag)]
  meas_l <- meas[(length(meas) - length(time_l) + 1):length(meas)]

  meas_lD <- differences2(time = time_l, meas = meas_l)

  # instead of finding changes in lag phase
  # we can find where the change between points is
  # small?
  newdiff <- max(meas_lD) * threshold # this threshold window would fail index one as its 0

  j  <- 1
  for (i in 2:(length(time_l) - window)) {
    current_window <- meas_lD[i:(i + window)]
    if (all(current_window > newdiff)) {
      j <- j + 1
    }
  }

  # find index of stationary phase
  end_index <- time1 + j

  if(showplot == TRUE){
    plot(time, log(meas))
    abline(v = lag)
    abline(v = time[end_index])
  }

  return(time[end_index])


}



# fit linear model to log of data
loglin_growth <- function(time, meas, lag, stat) {

  if (any(is.na(time) == TRUE | any(is.na(meas)) == TRUE)) {
    stop("NAs in time or meas \n Clean the data")
  }

  # log meas
  meas_l <- log(meas)

  #parse out exp phase
  indexs <- which(time > lag & time < stat)
  time_e <- time[indexs]
  meas_e <- meas_l[indexs]

  model <- lm(meas_e ~ time_e)
  model <- summary(model)

  outputlist <- list("Growth Rate" = model$coefficients[2,1],
                     "P-Value" = model$coefficients[2,4])
  # return growth rate
  return(outputlist)


}



# fit exp to points inbetween lag and stat time




# find AUC with riemman type sums
area_uCurve <- function(time, meas, rsums = "average") {
  #rsums = ("upper", "lower")
  # default if average
  # do upper/lower or average the two riemman sum

  if (any(is.na(time) == TRUE | any(is.na(meas)) == TRUE)) {
    stop("NAs in time or meas \n Clean the data")
  }


  if (rsums == "upper") {
    area <- 0
    for (i in 1:(length(time)-1)) {
      area <- area + (time[i] * meas[i + 1])
    }

    return(area)
  } else if(rsums == "lower"){
    area <- 0
    for (i in 1:(length(time)-1)) {
      area <- area + (time[i] * meas[i])
    }
  } else {

    lower <- 0
    upper <- 0
    for (i in 1:(length(time)-1)) {
      lower <- lower + (time[i] * meas[i])
      upper <- upper + (time[i] * meas[i + 1])

      area <- (upper + lower) / 2
    }

  }

  return(area)

}
