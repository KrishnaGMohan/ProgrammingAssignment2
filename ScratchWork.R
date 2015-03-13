### ScratchWork

## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
rm(list=ls())

makeCacheMatrix <- function(x = matrix()) {
        matinv <- NULL
        set <- function(y) {
                x <<- y
                matinv <<- NULL
        }
        get <- function() x
        setinv <- function(solved) matinv <<- solved
        getinv <- function() matinv
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        matinv <- x$getinv()
        if(!is.null(matinv)) {
                message("getting cached data")
                return(matinv)
        }
        data <- x$get()
        matinv <- solve(data)
        x$setinv(matinv)
        matinv
}

m <- matrix(c(-1, -2, 1, 1), 2,2)
x <- makeCacheMatrix(m)
x$get()
inv <- cacheSolve(x)
inv
inv <- cacheSolve(x)
getting cached data
inv

AMat <- matrix(0,nr=5, nc=5)
AMat <- abs(col(AMat)-row(AMat))+1


AMatZ <-makeCacheMatrix(AMat)

AMatZ$getinv()
cacheSolve(AMatZ)




m <- matrix(c(-1, -2, 1, 1), 2,2)
x <- makeCacheMatrix(m)


x$get()
inv <- cacheSolve(m)
inv


class(makeCacheMatrix)



