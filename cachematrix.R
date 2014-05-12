## This code provides a cache mechanism for calculating the inverse of a matrix. 

##Example Usage
##mtrx <- matrix(c(7,3,-2,5),2,2)
##cacheMtrx <- makeCacheMatrix(mtrx)
##cacheSolve(cacheMtrx)

## Container for the original matrix and the inverse if it has been calculated.
makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) m <<- inverse
    getInverse <- function() m
    list(set = set, 
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

##Either calculates the inverse of the matrix, or returns cached value.
cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- solve(data)
    x$setInverse(m)
    m
}