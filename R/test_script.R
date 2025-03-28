#git push --mirror https://github.com/JacksonDMaines/LSCurves
print("test")


x <-  -30:30
y <-  exp(x) / (1 + exp(x))
z <-  y + rnorm(length(y), 0,.02) + .1
z
x2 <-  0:60
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


bleh <- stattime(time = x2, meas = z, lag)
#


x = -30:30
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.02) + 1
x2 = 0:60
#test <- differences(time = x2, meas = log(z), showplot = TRUE)
test <- differences2(time = x2, meas = z, showplot = TRUE)
lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)

#stat <- stattime(time = x2, meas =z, lag = lag, threshold = .01)


#first cuttime to after lag time, and log data
time_l <-  which(x2 > lag)
meas_l <- log(z[(length(z) - length(time_l) + 1):length(z)])
plot(time_l, meas_l)
plot(time_l, meas_l*.1)


#plot(time_l[-1], diff(meas_l))
what <- diff(meas_l)
plot(time_l[-length(time_l)], what)
abline(h = .01)
for (i in 3) {
  print(i)
}


     # why isnt this working?
for (i in (length(time_l) - 2 - 1)) {
  start <- i
  end <- i + 2
  if(all(what[start:end] > .05) == FALSE){
    hey <- i + 2
    print("hey")
    print(time_l[i + 2])
    break
  }
}
# like when i do it manually it should stop way earlier
# i think "for i in vector" is the issue?
  # yeah what was right


start <- 0
end <- start
for (i in 1:(length(time_l) - 2 - 1)) {
  start <- start + 1
  end <- start + 2
  if(all(what[start:end] > .05) == TRUE){
    print(what[i])
  }
}

# lets rewrite this a bit different
window  <- 2
for (i in 1:(length(time_l) - window - 1)) {
  current_window <- what[i:(i + window)]
  if (all(current_window > .05)) {
    print(what[i])
  }
}
    # So these work the same


# good now I need to figure out a way to find a threshold
# so looking at my code, I think its multiplying the differences by by some value then

## find lag
x = -30:30
y = exp(x) / (1 + exp(x))
z = y + rnorm(length(y), 0,.02) + 1
x2 = 0:60
test <- differences2(time = x2, meas = z, showplot = TRUE)
lag <- lagtime(time = x2, meas = z, differences = test, showplot = TRUE)


## cut to after lag time and log meas
time_l <-  x2[which(x2 > lag)]
meas_l <- log(z[(length(z) - length(time_l) + 1):length(z)])
meas_ln <- z[(length(z) - length(time_l) + 1):length(z)]
meas_lD <- differences2(time = time_l, meas = meas_l, showplot = TRUE)
plot(time_l, meas_l)
plot(time_l, meas_lD)

## multiple differences by threshold
threshold <- .01
newdiff <- max(meas_lD) * threshold # this threshold window would fail index one as its 0
plot(28:60, meas_lD)
abline(h = newdiff)


window  <- 2
for (i in 2:(length(time_l) - window)) {
  current_window <- meas_lD[i:(i + window)]
  if (all(current_window > newdiff)) {
    print(meas_lD[i])
    print(i)
    j <- i
  }
}

plot(28:60, meas_lD)
abline(h = newdiff)
abline(v = 34)

plot(x2, z)
abline(v = ceiling(lag) + 5)
abline(v = lag)


# just for this synthetic data after the threshold you could do while
# all(stuff) == TRUE print index, then just output last index?
# cant figure this out.

#alt idea
# next slope be threshold percentage of last slope
# sudo code
  # window
  # for i in legnth
  # define current window
  # if all in the current window are > threshold of last point keep going,  #### I dont know how to do this?
  # once all points in window < threshold


  # differences are within
window  <- 2
for (i in 1:(length(time_l) - window - 1)) {
  current_window <- what[i:(i + window)]
  if (all(current_window > .05)) {
    print(what[i])
  }
}



