## Matrix inversion is usually a costly computation and their may be 
# some benefit to caching the inverse of a matrix rather than compute 
# it repeatedly. 
##

##
#This R script attempts to do just that using 2 functions:
# makeCacheMatrix for caching of the matrix data and its inverse 
# and cacheSolve for computing the inverse of matrix and using 
# the cache to store the data
##

# Author: Ravi Shankar


########################################################
#This function creates a special "matrix" object that can 
#cache its inverse.
#######################################################

makeCacheMatrix <- function(x = matrix()) {
    matrix_inverse <- NULL 
    set <- function(y) {
        x <<- y
        matrix_inverse <<- NULL
    }
    get <- function() x
    setinverse <- function(inverse) matrix_inverse <<- inverse
    getinverse <- function() matrix_inverse
    # Return a list that is used as a cached by the cacheSolve function
    list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


##
# This function computes the inverse of the special "matrix" returned by 
# makeCacheMatrix above. If the inverse has already been calculated 
# (and the matrix has not changed), then the cachesolve should retrieve 
# the inverse from the cache.
##

cacheSolve <- function(x, ...) {
    matrix_inverse <- x$getinverse()
    if(!is.null(matrix_inverse)) {
        #message("getting cached data")
        return(m)
    }
    data <- x$get()
    matrix_inverse <- solve(data, ...)
    x$setinverse(matrix_inverse)
    matrix_inverse
}
