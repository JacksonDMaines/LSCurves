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
time_l <-  which(time > lag)
meas_l <- log(z[(length(z) - length(time_l) + 1):length(z)])
plot(time_l, meas_l)
plot(time_l, meas_l*.1)


#plot(time_l[-1], diff(meas_l))
what <- diff(meas_l)
plot(time_l[-length(time_l)], what)
abline(h = .01)



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


start <- 0
end <- start
for (i in (length(time_l) - 2 - 1)) {
  start <- start + 1
  end <- start + 2
  if(all(what[start:end] > .05) == FALSE){
    print("hey")
    break
  }
}






