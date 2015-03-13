## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# The function makeCacheMatrix creates an object
# with a set of functions to store and retrieve 
# matrices and their inverses. 

# x holds the original matrix
# matinv holds the inverse of the matrix


# When makeCacheMatrix is called with a matrix, the 
# 'set function is used. The matrix # is stored in x 
# of the parent env and the inverse of the matrix 
# 'matinv' is set to null using the <<- operator. 
# The 'get' function simply returns the matrix.

# The 'setinv' function stores the inverse of the 
# matrix in 'matinv' in the parent env using the <<-
# operator . And the 'getinv' function returns 
# the 'matinv' matrix


makeCacheMatrix <- function(x = matrix()) {
        matinv <- NULL
        set <- function(y) {
                x <<- y           ## superassignment to parent env matrix
                matinv <<- NULL   ## superassignment to parent env inverse
        }
        get <- function() { x }
        setinv <- function(solved) { matinv <<- solved }
        getinv <- function() { matinv }
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## Write a short comment describing this function

## The 'cacheSolve' function takes in an object 
## created by the 'makeCacheMatrix'. If the inverse
## had been previously calculated and stored then return
## the cached value. If not then calculate, cache and 
## then return the value


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        matinv <- x$getinv()
        
        ## if the returned inverse is not NULL
        ## return the inverse
        if(!is.null(matinv)) {
                message("getting cached data")
                return(matinv)
        }
        
        ## If it is NULL then calculate the inverse
        data <- x$get()
        matinv <- solve(data)
        
        ## and cahe it using 'setinv'
        x$setinv(matinv)
        
        ## return the inverse
        matinv
}
