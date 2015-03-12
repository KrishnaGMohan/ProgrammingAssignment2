rm(list=ls())

makeVector <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}

cachemean <- function(x, ...) {
        q <- x$getmean()
        if(!is.null(q)) {
                message("getting cached data")
                return(q)
        }
        data <- x$get()
        q <- mean(data, ...)
        x$setmean(q)
        q
}







#debug(makeVector)
#debug(cachemean)

# create a sample vector 
v1 <- c(1:10)

# convert it into an object which supports caching
v1c <- makeVector(v1)

# have a look at it
v1c$get()

# have a look at it
v1c$getmean()


v1c$setmean( mean(v1c$get() ) )   

# calculate the mean for v1c for the first time:
cachemean(v1c)

# calculate the mean for v1c again:
cachemean(v1c)


